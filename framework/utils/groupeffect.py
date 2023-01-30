from sys import argv
from random import choice
import string


class AtomicEnv:
    def __init__(self, key, value=None, length=None) -> None:
        self.key = key
        self.value = value
        self.length = length

    def secret_generator(self, length: int = 20):
        txt = str()
        chars = string.digits + string.ascii_uppercase + string.ascii_lowercase + "+!?#"
        if self.length:
            length = self.length

        for i in range(length):
            txt += txt.join(choice(chars))
        return f"'{txt}'"

    def get_random_secret(self):
        if not self.value:
            self.value = self.secret_generator()

    def text(self):
        self.get_random_secret()
        return f"'{self.key}={self.value}'"

    def test(self):
        print(self.text())
        print(self.__dict__)


class ManagedEnv:
    def __init__(self, params=None, access_token=None) -> None:
        self.access_token = access_token
        if not access_token:
            self.access_token = "<token>"
        if not params:
            self.params = [
                AtomicEnv("SECRET_KEY", length=80),
                ##
                AtomicEnv("POSTGRES_PASSWORD"),
                AtomicEnv("POSTGRES_USER", "adminuser"),
                AtomicEnv("POSTGRES_PORT", 5432),
                AtomicEnv("POSTGRES_DB", "alphadb"),
                ##
                AtomicEnv("POSTGRES_DJANGO_USER_PASSWORD"),
                AtomicEnv("POSTGRES_DJANGO_USER", "djangouser"),
                AtomicEnv("POSTGRES_DJANGO_PORT", 5432),
                AtomicEnv("POSTGRES_DJANGO_DB", "djangodb"),
                AtomicEnv("POSTGRES_DJANGO_DB_TEST", "test_djangodb"),
                ##
                AtomicEnv("ADMIN_EMAIL", "admin@groupeffect.de"),
                AtomicEnv("ADMIN_PASSWORD"),
                AtomicEnv("USER_EMAIL", "user@groupeffect.de"),
                AtomicEnv("USER_PASSWORD"),
                AtomicEnv("TEST_EMAIL", "test@groupeffect.de"),
                AtomicEnv("POSTGRES_DJANGO_DB", "djangodb"),
                ##
                AtomicEnv("GIT_ACCESS_TOKEN", self.access_token),
                AtomicEnv(
                    "GIT_ACCESS_LINK",
                    f"https://{self.access_token}@github.com/Groupeffect/webserver.git",
                ),
            ]

        self.text = ""
        self._set()

    def _set(self):
        self.text = ""
        for i in self.params:
            self.text += f"{i.text()}\n"

    def test(self):
        print(self.text)


def help():
    print(
        """
# ADD GITHUB ACCESS TOKEN WITH:
# -t <git access token>
    """
    )


if __name__ == "__main__":
    has_token = False
    token_index = None
    for k, v in enumerate(argv):
        if v == "-t" and len(argv) >= k + 2:
            token_index = k + 1
            has_token = True

    if has_token:
        ManagedEnv(access_token=argv[token_index]).test()

    else:
        ManagedEnv().test()
        help()
