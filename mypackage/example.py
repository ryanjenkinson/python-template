"""An example module."""


def divide(a: float, b: float) -> float:
    """A function to divide two numbers.

    Args:
        a (float): The numerator
        b (float): The denominator

    Raises:
        ZeroDivisionError: If the denominator is zero

    Returns:
        float: The division
    """
    if b == 0:
        raise ZeroDivisionError
    return a / b
