package tjp6.allstarfinancial.repository;

import tjp6.allstarfinancial.domain.Role;


import java.util.Collection;

public interface RoleRepository <T extends Role> {
    // Basic CRUD Operations
    T createRole(T data);

    Collection<T> list(int page, int pageSize);

    T getRole(Long id);

    T updateRole(T data);

    Boolean deleteRole(Long id);

// More Complex CRUD Operations
    void addRoleToUser(Long userId, String roleName);
    Role getRoleByUserId(Long userId);
    Role getRoleByUserEmail(String email);
    void updateUserRole(Long userId, String roleName);

}
