abstract class Repo {
  Future<dynamic> getOrganisationList();
  Future<dynamic> getRepoList(String organisationName);
  Future<dynamic> getBranchList(String organisationName, String repoName);
  Future<dynamic> getCommitList(
      String organisationName, String repoName, String branchName);
}
