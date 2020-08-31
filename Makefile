install:
	raco pkg install sicp
	raco pkg install review

test:
	raco test exercises

lint:
	@echo "check codestyle"
	@(for f in $$(find exercises -name '*.rkt'); do raco review $$f; done)

.PHONY: test
