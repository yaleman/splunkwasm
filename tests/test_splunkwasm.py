import splunkwasm


def test_add() -> None:
    assert splunkwasm.add(2, 3) == 5
    assert splunkwasm.add(2, 23) == 25


def test_multiply() -> None:
    assert splunkwasm.multiply(2, 3) == 6
    assert splunkwasm.multiply(4, 5) == 20
