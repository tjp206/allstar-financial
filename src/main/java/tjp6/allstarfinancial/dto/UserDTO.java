package tjp6.allstarfinancial.dto;

import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
public class UserDTO {

    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String address;
    private String phone;
    private String title;
    private String bio;
    private Boolean isUserActive;
    private Boolean isUserUnlocked;
    private LocalDateTime createdTs;
    private Boolean isUsingTfa;
    private String imageUrl;
}
