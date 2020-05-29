const db = require("../data/db-config.js");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function findSteps(id) {
  return db("schemes as sc")
    .join("steps as s", "sc.id", "s.scheme_id")
    .select("s.id", "sc.scheme_name", "s.step_number", "s.instructions")
    .where("s.scheme_id", id);
}

function add(schemeData) {
  return db("schemes")
    .insert(schemeData)
    .then((schemeData) => {
      console.log("add", schemeData);
      return findById(schemeData[0]);
    });
}

function update(schemeData, id) {
  return db("schemes")
    .where({ id })
    .first()
    .update(schemeData)
    .then(() => {
      console.log("update", schemeData);
      return findById(id);
    });
}

function remove(id) {
  return findById(id).then((removedSchema) => {
    return db("schemes")
      .where({ id })
      .first()
      .del()
      .then(() => {
        return removedSchema;
      });
  });
}

function addSteps(stepData){
  return db('steps').insert(stepData)
}


module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  addSteps
};
