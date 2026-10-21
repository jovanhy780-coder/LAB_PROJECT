"""Check that Python can reach the intended PostgreSQ database."""
from sqlalchemy import text
from db_config import get_engine

engine = get_engine()
with engine.connect() as connection:
    row = connection.execute(
       text("SELECT current_database(), current_user")
    ).one()
    print(f"Connected to database:{row[0]}")
    print(f"PostgreSQLuser: {row[1]}")