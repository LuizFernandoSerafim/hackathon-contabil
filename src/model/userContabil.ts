import mongoose, { Document } from "mongoose";
import Authservice from "@src/services/authService";

export interface User {
  _id?: string;
  namecont: string;
  emailcont: string;
  passwordcont: string;
  permissao: boolean;
  cnpj: string;
  razaosoc: string;
  crc: string;
  usuariopermi: string ;
}
var usuariopermi: []
export enum CUSTOM_VALIDATION {
  DUPLICATED = "DUPLICATED",
}

interface UserModel extends Omit<User, "_id">, Document {}

const schema = new mongoose.Schema(
  {
    namecont: { type: String, required: true },
    emailcont: { type: String, required: true, unique: true },
    passwordcont: { type: String, required: true },
    permissao:{type: Boolean, required: true},
    cnpj:{type: String, required: true, unique: true},
    razaosoc:{type: String, required: true},
    crc:{type: String, required: true},
    usuariopermi:{type:String, required: true}

  },

  {
    toJSON: {
      transform: (_, ret): void => {
        ret.id = ret._id;
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

schema.path("email").validate(
  async (email: string) => {
    const emailCount = await mongoose.models.User.countDocuments({ email });
    return !emailCount;
  },
  "already exists in the database.",
  CUSTOM_VALIDATION.DUPLICATED
);

// trás o erro da informação duplicada para a camada do mongoose
// fazendo ele parar de retornar um erro diretamenta do MongoDB

schema.pre<UserModel>("save", async function (): Promise<void> {
  if (!this.passwordcont || !this.isModified("password")) {
    return;
  }

  try {
    const hashedPassword = await Authservice.hashPassword(this.passwordcont);
    this.passwordcont = hashedPassword;
  } catch (err) {
    console.error(`Erro no hash do password do usuario ${this.namecont}`);
    // @TODO ERRO
  }
});

export const User = mongoose.model<UserModel>("User", schema);
