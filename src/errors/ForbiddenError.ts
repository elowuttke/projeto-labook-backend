import { BaseError } from "./BaseError";

export class ForbiddenError extends BaseError {
    constructor(
        message: string = "Token válido, mas sem permissões suficientes" //"Usuário não tem as permissões necessárias"
    ) {
        super(403, message)
    }
}