/// name : "development"
/// commit : {"sha":"57791d3fa68f234b65e40fa38b92ef7f3e83e051","url":"https://api.github.com/repos/iStudioTechtest/firstrepo/commits/57791d3fa68f234b65e40fa38b92ef7f3e83e051"}
/// protected : false

class BranchListModel {
  BranchListModel({
    String? name,
    Commit? commit,
    bool? protected,
  }) {
    _name = name;
    _commit = commit;
    _protected = protected;
  }

  BranchListModel.fromJson(dynamic json) {
    _name = json['name'];
    _commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    _protected = json['protected'];
  }
  String? _name;
  Commit? _commit;
  bool? _protected;
  BranchListModel copyWith({
    String? name,
    Commit? commit,
    bool? protected,
  }) =>
      BranchListModel(
        name: name ?? _name,
        commit: commit ?? _commit,
        protected: protected ?? _protected,
      );
  String? get name => _name;
  Commit? get commit => _commit;
  bool? get protected => _protected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_commit != null) {
      map['commit'] = _commit!.toJson();
    }
    map['protected'] = _protected;
    return map;
  }
}

/// sha : "57791d3fa68f234b65e40fa38b92ef7f3e83e051"
/// url : "https://api.github.com/repos/iStudioTechtest/firstrepo/commits/57791d3fa68f234b65e40fa38b92ef7f3e83e051"

class Commit {
  Commit({
    String? sha,
    String? url,
  }) {
    _sha = sha!;
    _url = url!;
  }

  Commit.fromJson(dynamic json) {
    _sha = json['sha'];
    _url = json['url'];
  }
  String? _sha;
  String? _url;
  Commit copyWith({
    String? sha,
    String? url,
  }) =>
      Commit(
        sha: sha ?? _sha,
        url: url ?? _url,
      );
  String? get sha => _sha;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sha'] = _sha;
    map['url'] = _url;
    return map;
  }
}
