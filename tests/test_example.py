import pytest

from mypackage.example import divide


def test_cannot_divide_by_zero():
    with pytest.raises(ZeroDivisionError):
        divide(1, 0)


def test_one_divided_by_two_equals_one_half():
    assert divide(1, 2) == 1 / 2
