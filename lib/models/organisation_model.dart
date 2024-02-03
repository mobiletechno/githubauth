/// login : "iStudioTechtest"
/// id : 157803218
/// node_id : "O_kgDOCWfi0g"
/// url : "https://api.github.com/orgs/iStudioTechtest"
/// repos_url : "https://api.github.com/orgs/iStudioTechtest/repos"
/// events_url : "https://api.github.com/orgs/iStudioTechtest/events"
/// hooks_url : "https://api.github.com/orgs/iStudioTechtest/hooks"
/// issues_url : "https://api.github.com/orgs/iStudioTechtest/issues"
/// members_url : "https://api.github.com/orgs/iStudioTechtest/members{/member}"
/// public_members_url : "https://api.github.com/orgs/iStudioTechtest/public_members{/member}"
/// avatar_url : "https://avatars.githubusercontent.com/u/157803218?v=4"
/// description : null

class OrganisationModel {
  OrganisationModel({
    String? login,
    int? id,
    String? nodeId,
    String? url,
    String? reposUrl,
    String? eventsUrl,
    String? hooksUrl,
    String? issuesUrl,
    String? membersUrl,
    String? publicMembersUrl,
    String? avatarUrl,
    dynamic description,
  }) {
    _login = login!;
    _id = id!;
    _nodeId = nodeId!;
    _url = url!;
    _reposUrl = reposUrl!;
    _eventsUrl = eventsUrl!;
    _hooksUrl = hooksUrl!;
    _issuesUrl = issuesUrl!;
    _membersUrl = membersUrl!;
    _publicMembersUrl = publicMembersUrl!;
    _avatarUrl = avatarUrl!;
    _description = description;
  }

  OrganisationModel.fromJson(dynamic json) {
    _login = json['login'];
    _id = json['id'];
    _nodeId = json['node_id'];
    _url = json['url'];
    _reposUrl = json['repos_url'];
    _eventsUrl = json['events_url'];
    _hooksUrl = json['hooks_url'];
    _issuesUrl = json['issues_url'];
    _membersUrl = json['members_url'];
    _publicMembersUrl = json['public_members_url'];
    _avatarUrl = json['avatar_url'];
    _description = json['description'];
  }
  String? _login;
  int? _id;
  String? _nodeId;
  String? _url;
  String? _reposUrl;
  String? _eventsUrl;
  String? _hooksUrl;
  String? _issuesUrl;
  String? _membersUrl;
  String? _publicMembersUrl;
  String? _avatarUrl;
  dynamic _description;
  OrganisationModel copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? url,
    String? reposUrl,
    String? eventsUrl,
    String? hooksUrl,
    String? issuesUrl,
    String? membersUrl,
    String? publicMembersUrl,
    String? avatarUrl,
    dynamic description,
  }) =>
      OrganisationModel(
        login: login ?? _login,
        id: id ?? _id,
        nodeId: nodeId ?? _nodeId,
        url: url ?? _url,
        reposUrl: reposUrl ?? _reposUrl,
        eventsUrl: eventsUrl ?? _eventsUrl,
        hooksUrl: hooksUrl ?? _hooksUrl,
        issuesUrl: issuesUrl ?? _issuesUrl,
        membersUrl: membersUrl ?? _membersUrl,
        publicMembersUrl: publicMembersUrl ?? _publicMembersUrl,
        avatarUrl: avatarUrl ?? _avatarUrl,
        description: description ?? _description,
      );
  String? get login => _login;
  num? get id => _id;
  String? get nodeId => _nodeId;
  String? get url => _url;
  String? get reposUrl => _reposUrl;
  String? get eventsUrl => _eventsUrl;
  String? get hooksUrl => _hooksUrl;
  String? get issuesUrl => _issuesUrl;
  String? get membersUrl => _membersUrl;
  String? get publicMembersUrl => _publicMembersUrl;
  String? get avatarUrl => _avatarUrl;
  dynamic get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['id'] = _id;
    map['node_id'] = _nodeId;
    map['url'] = _url;
    map['repos_url'] = _reposUrl;
    map['events_url'] = _eventsUrl;
    map['hooks_url'] = _hooksUrl;
    map['issues_url'] = _issuesUrl;
    map['members_url'] = _membersUrl;
    map['public_members_url'] = _publicMembersUrl;
    map['avatar_url'] = _avatarUrl;
    map['description'] = _description;
    return map;
  }
}
