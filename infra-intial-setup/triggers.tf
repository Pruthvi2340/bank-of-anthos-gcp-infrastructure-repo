# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "userservice" {
    disabled       = false
    filename       = "userservice-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-userservice"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "contacts" {
    disabled       = false
    filename       = "contacts-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-contacts"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "ledgerwriter" {
    disabled       = false
    filename       = "ledgerwriter-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-ledgerwriter"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "balancereader" {
    disabled       = false
    filename       = "balancereader-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-balancereader"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "transactionhistory" {
    disabled       = false
    filename       = "transactionhistory-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-transactionhistory"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "accounts-db" {
    disabled       = false
    filename       = "accounts-db-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-accounts-db"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "ledger-db" {
    disabled       = false
    filename       = "ledger-db-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-ledger-db"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "loadgenerator" {
    disabled       = false
    filename       = "loadgenerator-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-loadgenerator"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

# google_cloudbuild_trigger.default:
resource "google_cloudbuild_trigger" "workflow-ui-tests" {
    disabled       = false
    filename       = "ui-tests-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-ui-tests"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}

resource "google_cloudbuild_trigger" "frontend" {
    disabled       = false
    filename       = "frontend-cloudbuild.yaml"
    ignored_files  = []
    included_files = []
    location       = "global"
    name           = "${var.name}-frontend"
    substitutions  = {}
    tags           = []

    approval_config {
        approval_required = false
    }

    timeouts {}

    trigger_template {
        invert_regex = false
        project_id   = var.project_id
        repo_name    = "github_pruthvi2340_bank-of-anthos-gcp-source-repo"
        tag_name     = ".*"
    }
}