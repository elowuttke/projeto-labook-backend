import { BaseError } from "./BaseError";

export class UnauthorizedError extends BaseError {
    constructor(
        message: string = "Token inválido" //"Credenciais inválidas"
    ) {
        super(401, message)
    }
}