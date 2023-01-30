#!/bin/python3

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
        return txt

    def get_random_secret(self):
        if not self.value:
            self.value = self.secret_generator()

    def text(self):
        self.get_random_secret()
        return f"{self.key}={self.value}"

    def test(self):
        print(self.text())
        print(self.__dict__)


class ManagedEnv:
    def __init__(self, params=None) -> None:
        if not params:
            self.params = [
                AtomicEnv("POSTGRES_PASSWORD"),
                AtomicEnv("POSTGRES_USER", "djangouser"),
                AtomicEnv("POSTGRES_PORT", 5432),
                AtomicEnv("POSTGRES_DB", "alphadb"),
                AtomicEnv("ADMIN_EMAIL", "admin@groupeffect.de"),
                AtomicEnv("ADMIN_PASSWORD"),
                AtomicEnv("USER_EMAIL", "user@groupeffect.de"),
                AtomicEnv("USER_PASSWORD"),
                AtomicEnv("SECRET_KEY", length=80),
            ]

        self.text = ""
        self._set()

    def _set(self):
        self.text = ""
        for i in self.params:
            self.text += f"{i.text()}\n"

    def test(self):
        print(self.text)


if __name__ == "__main__":

    ManagedEnv().test()
