migrations commands
alembic revision --autogenerate -m "init"
alembic upgrade heads
alembic downgrade -1
alembic current
alembic history


uv run uvicorn main:app --reload