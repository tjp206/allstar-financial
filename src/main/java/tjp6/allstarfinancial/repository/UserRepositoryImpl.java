package tjp6.allstarfinancial.repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import tjp6.allstarfinancial.domain.User;
import tjp6.allstarfinancial.exception.ApiException;

import java.util.Collection;
import java.util.Map;

@Repository
@RequiredArgsConstructor
@Slf4j
public class UserRepositoryImpl implements UserRepository<User> {

    private static final String COUNT_USER_EMAIL_QUERY = ;

    public final NamedParameterJdbcTemplate jdbcTemplate;

    @Override
    public User createUser(User user) {
        //check email is unique
        if(getEmailCount(user.getEmail().trim().toLowerCase()) > 0) throw new ApiException("Email already in use. Please try again with a different email address.")
        // save new user
        // add role to user
        // send verification url
        // save url in verifications table
        // send email to user with verification url
        // return newly created user
        // if error, throw exception with proper message
        return null;
    }

    @Override
    public Collection<User> list(int page, int pageSize) {
        return null;
    }

    @Override
    public User getUser(Long id) {
        return null;
    }

    @Override
    public User updateUser(User data) {
        return null;
    }

    @Override
    public Boolean deleteUser(Long id) {
        return null;
    }

    private Integer getEmailCount(String email) {
        return jdbcTemplate.queryForObject(COUNT_USER_EMAIL_QUERY, Map.of("email", email), Integer.class);
    }
}
