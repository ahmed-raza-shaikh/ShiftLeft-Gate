.PHONY: verify validate-yaml check-js audit-critical docker-build

verify: validate-yaml check-js audit-critical

validate-yaml:
	ruby -e 'require "yaml"; YAML.load_file(".github/workflows/shiftleft-gate.yml"); puts "workflow yaml ok"'

check-js:
	node --check app/server.js

audit-critical:
	npm audit --audit-level=critical

docker-build:
	docker build -t shiftleft-gate-demo:local .
