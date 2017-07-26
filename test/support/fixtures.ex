defmodule BootlegPhoenix.Fixtures do
  @moduledoc false

  def inflate_project(name \\ :build_me) do
    project_dir = Temp.mkdir!("git-#{name}")
    File.cp_r!("./test/fixtures/#{name}", project_dir)
    File.cd!(project_dir, fn ->
      System.cmd("git", ["init"])
      System.cmd("git", ["config", "user.email", "local@example.com"])
      System.cmd("git", ["config", "user.name", "Miscellaneous Minstrel"])
      System.cmd("git", ["add", "."])
      System.cmd("git", ["commit", "-m", "yolo"])
    end)
    project_dir
  end
end
