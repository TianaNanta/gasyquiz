"""Make relationship between response and user

Revision ID: a08a6937e101
Revises: f100ba278a0a
Create Date: 2024-06-25 06:34:06.994227

"""
from alembic import op
import sqlalchemy as sa
import sqlmodel.sql.sqltypes


# revision identifiers, used by Alembic.
revision = 'a08a6937e101'
down_revision = 'f100ba278a0a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('response', sa.Column(
        'owner_id', sa.Integer(), nullable=False))
    op.create_foreign_key(None, 'response', 'user', ['owner_id'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'response', type_='foreignkey')
    op.drop_column('response', 'owner_id')
    # ### end Alembic commands ###
