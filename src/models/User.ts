export enum USER_ROLES {
    NORMAL = "NORMAL",
    ADMIN = "ADMIN"
}

export interface TokenPayload {
    id: string,
    name: string,
    role: USER_ROLES
}

export interface UserDB {
    id: string,
    name: string,
    email: string,
    password: string,
    role: USER_ROLES,
    created_at: string
}

export interface UserModel {
    id: string,
    name: string,
    email: string,
    role: USER_ROLES,
    createdAt: string
}

export class User {
    constructor(
        private id: string,
        private name: string,
        private email: string,
        private password: string,
        private role: USER_ROLES,
        private createdAt: string
    ) { }

    public getId(): string {
        return this.id
    }
    public getName(): string {
        return this.name
    }
    public getEmail(): string {
        return this.email
    }
    public getPassword(): string {
        return this.password
    }
    public getRole(): USER_ROLES {
        return this.role
    }
    public getCreatedAt(): string {
        return this.createdAt
    }

    public setId(newId: string): void {
        this.id = newId
    }
    public setName(newName: string): void {
        this.name = newName
    }
    public setEmail(newEmail: string): void {
        this.email = newEmail
    }
    public setPassword(newPassword: string): void {
        this.password = newPassword
    }
    public setRole(newRole: USER_ROLES): void {
        this.role = newRole
    }
    public setCreatedAt(newCreatedAt: string): void {
        this.createdAt = newCreatedAt
    }

    public toDBModel(): UserDB {
        return {
            id: this.id,
            name: this.name,
            email: this.email,
            password: this.password,
            role: this.role,
            created_at: this.createdAt
        }
    }

    public toBusinessModel(): UserModel {
        return {
            id: this.id,
            name: this.name,
            email: this.email,
            role: this.role,
            createdAt: this.createdAt
        }
    }
}