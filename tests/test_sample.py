"""
A sample test module for the boilerplate
"""

from src.sample import add


def test_add_function() -> None:
    """Tests add function"""
    assert add(1, 2) == 3
