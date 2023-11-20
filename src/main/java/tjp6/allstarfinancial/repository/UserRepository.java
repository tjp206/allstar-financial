package tjp6.allstarfinancial.repository;

import tjp6.allstarfinancial.domain.User;

import java.util.Collection;

public interface UserRepository <T extends User> {
    // Basic CRUD Operations
    T createUser(T data);
    Collection<T> list(int page, int pageSize);
    T getUser(Long id);
    T updateUser(T data);
    Boolean deleteUser(Long id);

    // More Complex CRUD Operations


}
