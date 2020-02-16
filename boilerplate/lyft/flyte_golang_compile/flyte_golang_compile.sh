# WARNING: THIS FILE IS MANAGED IN THE 'BOILERPLATE' REPO AND COPIED TO OTHER REPOSITORIES.
# ONLY EDIT THIS FILE FROM WITHIN THE 'LYFT/BOILERPLATE' REPOSITORY:
# 
# TO OPT OUT OF UPDATES, SEE https://github.com/lyft/boilerplate/blob/master/Readme.rst

if [ -z "$PACKAGES" ]; then
  echo "PACKAGES environment VAR not set"
  exit 1
fi

if [ -z "$OUTPUT" ]; then
  echo "OUTPUT environment VAR not set"
  exit 1
fi

# get the GIT_SHA and RELEASE_SEMVER

GIT_SHA=$(git rev-parse HEAD)
RELEASE_SEMVER=$(git describe --tags --exact-match $GIT_SHA 2>/dev/null)

CURRENT_PKG=github.com/lyft/{{ REPOSITORY }}
VERSION_PKG="${CURRENT_PKG}/vendor/github.com/lyft/flytestdlib"

LDFLAGS="-X ${VERSION_PKG}/version.Build=${GIT_SHA} -X ${VERSION_PKG}/version.Version=${RELEASE_SEMVER}"

GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags "$LDFLAGS" -o "$OUTPUT" "$PACKAGES"
