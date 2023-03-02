import Joi from "joi";

export const registerSchema = Joi.object({
    name:Joi.string().min(3).required(),
    email: Joi.string().email({ tlds: { allow: false } }).required(),
    password:Joi.string().min(5).required(),
    confirmPassword:Joi.string().valid(Joi.ref('password')).required()
})

export const loginSchema = Joi.object({
    email: Joi.string().email({ tlds: { allow: false } }).required(),
    password:Joi.string().min(5).required()
})

export const urlSchema = Joi.object({
    url: Joi.string().uri().required()
})