.PHONY: run-act

run-act: # Run the CI-CD workflow.
	act workflow_dispatch -W .github/workflows/CI_CD.yml --defaultbranch feature/KalebCoberly/bare_ui_setup