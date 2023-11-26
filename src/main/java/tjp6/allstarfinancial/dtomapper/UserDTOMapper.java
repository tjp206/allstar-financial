package tjp6.allstarfinancial.dtomapper;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import tjp6.allstarfinancial.domain.User;
import tjp6.allstarfinancial.dto.UserDTO;

@Component
public class UserDTOMapper {
    public static UserDTO fromUser(User user) {
        UserDTO userDTO = new UserDTO();
        BeanUtils.copyProperties(user, userDTO);
        return userDTO;
    }

    public static User toUser(UserDTO userDTO) {
        User user = new User();
        BeanUtils.copyProperties(userDTO, user);
        return user;
    }
}
