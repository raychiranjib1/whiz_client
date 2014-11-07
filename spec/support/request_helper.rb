module RequestHelper
  def valid_response(fixture)
    File.read(fixture_filepath(:valid_responses, fixture))
  end

  def mock_valid_response(dir, fixture)
    described_class.stub(:request_data) { valid_response(fixture) }
  end

  def fixture_filepath(sub_dir, name)
    root_path.join('fixtures', sub_dir.to_s, name.to_s)
  end

  def root_path
    Pathname.new(File.join(File.dirname(__FILE__), '../')).realpath
  end
end