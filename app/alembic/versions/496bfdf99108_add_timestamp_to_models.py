"""add timestamp to models

Revision ID: 496bfdf99108
Revises: e2412789c190
Create Date: 2024-05-22 04:42:22.838046

"""
from alembic import op
import sqlalchemy as sa
import sqlmodel.sql.sqltypes


# revision identifiers, used by Alembic.
revision = '496bfdf99108'
down_revision = 'e2412789c190'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('item', sa.Column('created_at', sa.DateTime(), nullable=True))
    op.add_column('item', sa.Column('updated_at', sa.DateTime(), nullable=True))
    op.add_column('user', sa.Column('created_at', sa.DateTime(), nullable=True))
    op.add_column('user', sa.Column('updated_at', sa.DateTime(), nullable=True))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('user', 'updated_at')
    op.drop_column('user', 'created_at')
    op.drop_column('item', 'updated_at')
    op.drop_column('item', 'created_at')
    # ### end Alembic commands ###
