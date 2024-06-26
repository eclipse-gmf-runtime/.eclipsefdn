local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-gmf-runtime') {
  settings+: {
    description: "Eclipse GMF Runtime is an industry proven application framework for creating graphical editors using Eclipse EMF and Eclipse GEF.",
    name: "Eclipse GMF Runtime",
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
          required_approving_review_count: null,
          requires_linear_history: true,
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('gmf-notation') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "GMF notation repository",
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_linear_history: true,
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('gmf-runtime') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: false,
      description: "Eclipse GMF Runtime",
      homepage: "https://projects.eclipse.org/projects/modeling.gmf-runtime",
      topics+: [
        "diagram",
        "eclipse",
        "emf",
        "java",
        "modeler"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_linear_history: true,
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('gmf-runtime-website') {
      allow_squash_merge: false,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/gmf-runtime/",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: null,
          requires_linear_history: true,
          requires_pull_request: false,
        },
      ],
    },
  ],
}
