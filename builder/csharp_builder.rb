require 'fileutils'
require 'set'

require_relative 'partial_builder'
require_relative 'shellconfig'

class CSharpBuilder < PartialBuilder
  def initialize
    super

    @spec_dir = 'spec/csharp/kaitai_struct_csharp_tests'
    @packages_dir = 'spec/csharp/packages'
    @compiled_dir = 'compiled/csharp'
    @project_file = "#{@spec_dir}/kaitai_struct_csharp_tests.csproj"
    @project_template = "#{@spec_dir}/kaitai_struct_csharp_tests.csproj.in"

    @test_out_dir = "#{@config['TEST_OUT_DIR']}/csharp"

    detect_tools
  end

  def detect_tools
    # msbuild
    if system("msbuild /version")
      @msbuild = 'msbuild'
    elsif system("xbuild /version")
      @msbuild = 'xbuild'
    else
      raise 'Unable to find msbuild/xbuild, bailing out'
    end

    # If we're running in AppVeyor, add extra logger args
    @msbuild_args = []
    if ENV['APPVEYOR']
      @msbuild_args << '/logger:C:\Program Files\AppVeyor\BuildAgent\Appveyor.MSBuildLogger.dll'
    end

    # If mono is available, use it
    @is_mono = system("mono --version") ? true : false
  end

  def list_mandatory_files
    convert_slashes([
      'Properties/AssemblyInfo.cs',
      'CommonSpec.cs',
    ])
  end

  def list_disposable_files
    rel_files = Dir.glob("#{@spec_dir}/tests/**/*.cs") + Dir.glob("#{@compiled_dir}/**/*.cs")
    abs_files = rel_files.map { |fn| File.absolute_path(fn) }
    convert_slashes(abs_files)
  end

  def create_project(mand_files, disp_files)
    tmpl = File.read(@project_template)
    files_xml = (mand_files + disp_files).map { |x| "    <Compile Include=\"#{x}\" />" }.join("\n")
    project = tmpl.gsub(/%%%FILES%%%/, files_xml)
    File.write(@project_file, project)
    @project_file
  end

  def build_project(log_file)
    cli = [@msbuild] + @msbuild_args + ["#{@spec_dir}/kaitai_struct_csharp_tests.csproj"]
    run_and_tee({}, cli, log_file).exitstatus
  end

  def parse_failed_build(log_file)
    list = Set.new

    File.open(log_file, 'r') { |f|
      f.each_line { |l|
        l.chomp!
        if l =~ /^\s*(.*?)\((\d+),(\d+)\): error (.*?): (.*)$/
          filename = $1
          #row = $2
          #col = $3
          #code = $4
          #msg = $5
          list << filename
        end
      }
    }

    convert_slashes(list)
  end

  def file_to_test(filename)
    # File.basename only forwards with forward slashes, so we normalize for that first
    fn = File.basename(filename.gsub(/\\/, '/'))
    if fn =~ /^Spec(.*)\.cs$/
      return [:spec, $1]
    else
      return [:format, fn.gsub(/\.cs$/, '')]
    end
  end

  def run_tests
    xml_log = "#{@test_out_dir}/TestResult.xml"
    FileUtils.mkdir_p(@test_out_dir)
    FileUtils.rm_f(xml_log)

    cli = [
      "#{@packages_dir}/NUnit.ConsoleRunner.3.4.1/tools/nunit3-console.exe",
      "--result=#{xml_log}",
      "#{@spec_dir}/bin/Debug/kaitai_struct_csharp_tests.dll",
    ]

    cli.unshift("mono") if @is_mono

    run_and_tee(
      {"CSHARP_TEST_SRC_PATH" => "src"},
      cli,
      "#{@test_out_dir}/test_run.stdout"
    )

    File.exists?(xml_log)
  end

  private
  def convert_slashes(list)
    list.sort.map { |f| f.gsub(/\//, '\\') }
  end
end
