"""Module containing base class for lookup database tables.

LookupDBObject defines the base class for lookup tables and defines
relevant methods. LookupDBObject inherits from DBObjectUnsharded and
extends the functionality for getting, creating, updating and deleting
the lookup relationship.
"""
import functools
import logging
import struct

from vtdb import db_object
from vtdb import db_object_unsharded
from vtdb import dbexceptions
from vtdb import keyrange
from vtdb import keyrange_constants
from vtdb import shard_constants
from vtdb import vtgate_cursor


class LookupDBObject(db_object_unsharded.DBObjectUnsharded):
  """This is an example implementation of lookup class where it is stored
  in unsharded db.
  """
  @classmethod
  def get(class_, cursor, entity_id_column, entity_id):
    where_column_value_pairs = [(entity_id_column, entity_id),]
    rows =  class_.select_by_columns(cursor, where_column_value_pairs)
    return [row.__dict__ for row in rows]

  @classmethod
  def create(class_, cursor, **bind_vars):
    return class_.insert(cursor, **bind_vars)

  @classmethod
  def update(class_, cursor, sharding_key_column_name, sharding_key,
             entity_id_column, new_entity_id):
    where_column_value_pairs = [(sharding_key_column_name, sharding_key),]
    update_column_value_pairs = [(entity_id_column,new_entity_id),]
    return class_.update_columns(cursor, where_column_value_pairs,
                                 update_column_value_pairs)

  @classmethod
  def delete(class_, cursor, sharding_key_column_name, sharding_key):
    where_column_value_pairs = [(sharding_key_column_name, sharding_key),]
    return class_.delete_by_columns(cursor, where_column_value_pairs)
