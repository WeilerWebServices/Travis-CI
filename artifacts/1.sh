wget https://s3.amazonaws.com/travis-ci-gmbh/artifacts/stable/build/windows/amd64/artifacts.exe
open artifacts.exe
curl -sL https://raw.githubusercontent.com/travis-ci/artifacts/master/install | bash
export ARTIFACTS_KEY="AKIT339AFIY655O3Q9DZ"
export ARTIFACTS_SECRET="48TmqyraUyJ7Efpegi6Lfd10yUskAMB0G2TtRCX1"
export ARTIFACTS_BUCKET="my-fancy-bucket"
export ARTIFACTS_PATHS="log/:coverage/"
export ARTIFACTS_KEY="AKIT339AFIY655O3Q9DZ"
export ARTIFACTS_SECRET="48TmqyraUyJ7Efpegi6Lfd10yUskAMB0G2TtRCX1"
export ARTIFACTS_BUCKET="my-fancy-bucket"
export ARTIFACTS_PATHS="$(git ls-files -o | tr "\n" ":")"
export ARTIFACTS_TARGET_PATHS="artifacts/$TRAVIS_REPO_SLUG/$TRAVIS_BUILD_NUMBER/$TRAVIS_JOB_NUMBER:artifacts/$TRAVIS_REPO_SLUG/$TRAVIS_COMMIT"
export ARTIFACTS_KEY="AKIT339AFIY655O3Q9DZ"
export ARTIFACTS_SECRET="48TmqyraUyJ7Efpegi6Lfd10yUskAMB0G2TtRCX1"
export ARTIFACTS_BUCKET="my-fancy-bucket"
export ARTIFACTS_PATHS="$(git ls-files -o | tr "\n" ":")"
