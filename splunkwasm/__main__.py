from pathlib import Path
import sys

REPO_ROOT = Path(__file__).resolve().parents[1]
if str(REPO_ROOT) not in sys.path:
    sys.path.insert(0, str(REPO_ROOT))


def main():
    """does a thing"""
    print("Loading splunkwasm module...")

    from splunkwasm import add, multiply

    print("Running things")
    a = 5
    b = 10
    sum_result = add(a, b)
    product_result = multiply(a, b)
    print(f"The sum of {a} and {b} is: {sum_result}")
    print(f"The product of {a} and {b} is: {product_result}")


if __name__ == "__main__":
    main()
