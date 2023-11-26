package tjp6.allstarfinancial.service;

import tjp6.allstarfinancial.domain.User;
import tjp6.allstarfinancial.dto.UserDTO;

public interface UserService {
    UserDTO createUser(User user);
}
