package tjp6.allstarfinancial.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import tjp6.allstarfinancial.domain.User;
import tjp6.allstarfinancial.dto.UserDTO;
import tjp6.allstarfinancial.dtomapper.UserDTOMapper;
import tjp6.allstarfinancial.repository.UserRepository;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements  UserService {

    private final UserRepository<User> userRepository;

    @Override
    public UserDTO createUser(User user) {
        return UserDTOMapper.fromUser(userRepository.createUser(user));
    }
}
