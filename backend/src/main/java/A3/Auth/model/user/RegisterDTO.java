package A3.Auth.model.user;

public record RegisterDTO(String email, String name, String password, String cpf ,UserRole role){
}
