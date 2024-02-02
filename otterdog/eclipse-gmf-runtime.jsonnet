local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-gmf-runtime') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Eclipse GMF Runtime is an industry proven application framework for creating graphical editors using Eclipse EMF and Eclipse GEF.",
    name: "Eclipse GMF Runtime",
    readers_can_create_discussions: true,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/gmf-runtime/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          requires_pull_request: false,
          requires_linear_history: true,
        },
      ],
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('gmf-notation') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "GMF notation repository",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          requires_pull_request: false,
          requires_linear_history: true,
        },
      ],
      has_projects: false,
      has_wiki: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('gmf-runtime') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Eclipse GMF Runtime",
      homepage: "https://projects.eclipse.org/projects/modeling.gmf-runtime",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          requires_pull_request: false,
          requires_linear_history: true,
        },
      ],
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "diagram",
        "eclipse",
        "emf",
        "java",
        "modeler"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
    orgs.newRepo('gmf-runtime-website') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/gmf-runtime/",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          requires_pull_request: false,
          requires_linear_history: true,
        },
      ],
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
}
