// Auto-generated. Do not edit!

// (in-package wpm2_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class pid_control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speedH = null;
      this.speedW = null;
      this.degreeH = null;
      this.degreeW = null;
    }
    else {
      if (initObj.hasOwnProperty('speedH')) {
        this.speedH = initObj.speedH
      }
      else {
        this.speedH = 0.0;
      }
      if (initObj.hasOwnProperty('speedW')) {
        this.speedW = initObj.speedW
      }
      else {
        this.speedW = 0.0;
      }
      if (initObj.hasOwnProperty('degreeH')) {
        this.degreeH = initObj.degreeH
      }
      else {
        this.degreeH = 0.0;
      }
      if (initObj.hasOwnProperty('degreeW')) {
        this.degreeW = initObj.degreeW
      }
      else {
        this.degreeW = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type pid_control
    // Serialize message field [speedH]
    bufferOffset = _serializer.float32(obj.speedH, buffer, bufferOffset);
    // Serialize message field [speedW]
    bufferOffset = _serializer.float32(obj.speedW, buffer, bufferOffset);
    // Serialize message field [degreeH]
    bufferOffset = _serializer.float32(obj.degreeH, buffer, bufferOffset);
    // Serialize message field [degreeW]
    bufferOffset = _serializer.float32(obj.degreeW, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type pid_control
    let len;
    let data = new pid_control(null);
    // Deserialize message field [speedH]
    data.speedH = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [speedW]
    data.speedW = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [degreeH]
    data.degreeH = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [degreeW]
    data.degreeW = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wpm2_tutorials/pid_control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '82d8395801dda259b07c2aa9213a389a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 speedH
    float32 speedW
    float32 degreeH
    float32 degreeW
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new pid_control(null);
    if (msg.speedH !== undefined) {
      resolved.speedH = msg.speedH;
    }
    else {
      resolved.speedH = 0.0
    }

    if (msg.speedW !== undefined) {
      resolved.speedW = msg.speedW;
    }
    else {
      resolved.speedW = 0.0
    }

    if (msg.degreeH !== undefined) {
      resolved.degreeH = msg.degreeH;
    }
    else {
      resolved.degreeH = 0.0
    }

    if (msg.degreeW !== undefined) {
      resolved.degreeW = msg.degreeW;
    }
    else {
      resolved.degreeW = 0.0
    }

    return resolved;
    }
};

module.exports = pid_control;
