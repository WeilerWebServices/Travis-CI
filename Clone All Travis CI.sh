git clone https://github.com/travis-ci/travis-watcher-macosx.git
git clone https://github.com/travis-ci/travis-extension-chrome.git
git clone https://github.com/travis-ci/travis-ci.git
git clone https://github.com/travis-ci/travis-worker.git
git clone https://github.com/travis-ci/travis-cookbooks.git
git clone https://github.com/travis-ci/travis-ci.github.com.git
git clone https://github.com/travis-ci/talk-2011-lyon.git
git clone https://github.com/travis-ci/travis-ruby-client.git
git clone https://github.com/travis-ci/travis-boxes.git
git clone https://github.com/travis-ci/travis-build.git
git clone https://github.com/travis-ci/travis-core.git
git clone https://github.com/travis-ci/travis-hub.git
git clone https://github.com/travis-ci/travis-support.git
git clone https://github.com/travis-ci/timetrap_tests.git
git clone https://github.com/travis-ci/travis-listener.git
git clone https://github.com/travis-ci/travis-deploy.git
git clone https://github.com/travis-ci/travis-crowd.git
git clone https://github.com/travis-ci/travis-lint.git
git clone https://github.com/travis-ci/travis-weblint.git
git clone https://github.com/travis-ci/gh.git
git clone https://github.com/travis-ci/travis-assets.git
git clone https://github.com/travis-ci/travis-web.git
git clone https://github.com/travis-ci/travis-api.git
git clone https://github.com/travis-ci/veewee-definitions.git
git clone https://github.com/travis-ci/travis-tasks.git
git clone https://github.com/travis-ci/travis-logs.git
git clone https://github.com/travis-ci/travis-sso.git
git clone https://github.com/travis-ci/travis-chat.git
git clone https://github.com/travis-ci/travis-become.git
git clone https://github.com/travis-ci/travis-sidekiq.git
git clone https://github.com/travis-ci/travis-scheduler.git
git clone https://github.com/travis-ci/travis-web-buildpack.git
git clone https://github.com/travis-ci/travis-sidekiqs.git
git clone https://github.com/travis-ci/travis-artifacts.git
git clone https://github.com/travis-ci/third-party-cookies.git
git clone https://github.com/travis-ci/travis-images.git
git clone https://github.com/travis-ci/charmeur.git
git clone https://github.com/travis-ci/travis.rb.git
git clone https://github.com/travis-ci/travis-workers.git
git clone https://github.com/travis-ci/travis-web-log.git
git clone https://github.com/travis-ci/travis-redirect.git
git clone https://github.com/travis-ci/travis-rubies.git
git clone https://github.com/travis-ci/fog.git
git clone https://github.com/travis-ci/octopus.git
git clone https://github.com/travis-ci/moustached-hubot.git
git clone https://github.com/travis-ci/travis-foundation.git
git clone https://github.com/travis-ci/dpl.git
git clone https://github.com/travis-ci/github-services.git
git clone https://github.com/travis-ci/build-email.git
git clone https://github.com/travis-ci/heroku-buildpack-ruby.git
git clone https://github.com/travis-ci/openshift-travis-quickstart.git
git clone https://github.com/travis-ci/casher.git
git clone https://github.com/travis-ci/rack-auth-travis.git
git clone https://github.com/travis-ci/travis-cli-pr.git
git clone https://github.com/travis-ci/terminal-notifier.git
git clone https://github.com/travis-ci/travis-cli-settings.git
git clone https://github.com/travis-ci/travis-cli-gh.git
git clone https://github.com/travis-ci/docs-travis-ci-com.git
git clone https://github.com/travis-ci/travis-migrations.git
git clone https://github.com/travis-ci/travis-yaml.git
git clone https://github.com/travis-ci/test-docs-travis-ci-com.git
git clone https://github.com/travis-ci/travis.js.git
git clone https://github.com/travis-ci/artifacts.git
git clone https://github.com/travis-ci/travis-switch.git
git clone https://github.com/travis-ci/flock-of-test-birds.git
git clone https://github.com/travis-ci/canary.git
git clone https://github.com/travis-ci/libgit2.git
git clone https://github.com/travis-ci/heaven.git
git clone https://github.com/travis-ci/unlimited-jce-policy-jdk7.git
git clone https://github.com/travis-ci/enterprise-installation.git
git clone https://github.com/travis-ci/hubot-deploy.git
git clone https://github.com/travis-ci/system-info.git
git clone https://github.com/travis-ci/travis-config.git
git clone https://github.com/travis-ci/travis-deploy-logs.git
git clone https://github.com/travis-ci/pudding.git
git clone https://github.com/travis-ci/test-sync-repo-owner.git
git clone https://github.com/travis-ci/hubot-pudding.git
git clone https://github.com/travis-ci/worker.git
git clone https://github.com/travis-ci/s3.git
git clone https://github.com/travis-ci/users-cookbook.git
git clone https://github.com/travis-ci/gimme.git
git clone https://github.com/travis-ci/apt-package-safelist.git
git clone https://github.com/travis-ci/travis-web-ember-cli-buildpack.git
git clone https://github.com/travis-ci/chirp.git
git clone https://github.com/travis-ci/travis-images-specs.git
git clone https://github.com/travis-ci/php-src-builder.git
git clone https://github.com/travis-ci/cpython-builder.git
git clone https://github.com/travis-ci/lounge-signup.git
git clone https://github.com/travis-ci/travis-topaz-gem.git
git clone https://github.com/travis-ci/jupiter-brain.git
git clone https://github.com/travis-ci/apt-source-safelist.git
git clone https://github.com/travis-ci/kiex.git
git clone https://github.com/travis-ci/encrypted-column.git
git clone https://github.com/travis-ci/travis-styleguide.git
git clone https://github.com/travis-ci/packer-templates.git
git clone https://github.com/travis-ci/packer-builder-vmware-vsphere.git
git clone https://github.com/travis-ci/vitess.git
git clone https://github.com/travis-ci/travis-nightly-builder.git
git clone https://github.com/travis-ci/travis-live.git
git clone https://github.com/travis-ci/vsphere-janitor.git

curl "https://api.github.com/orgs/travis-ci/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone