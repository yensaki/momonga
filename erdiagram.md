```uml
@startuml
object Tip
Tip : id: int
Tip : user_id
Tip : title: string
Tip : created_at: datetime
Tip : updated_at: datetime

object TipMovie
TipMovie : id: int
TipMovie : tip_id: int
TipMovie : movie_id: int
TipMovie : created_at: datetime

object Movie
Movie : id: int
Movie : title: string
Movie : url: string
Movie : created_at: datetime
Movie : updated_at: datetime

object TipBody
TipBody : id: int
TipBody : tip_id: int
TipBody : content: text
TipBody : created_at: datetime
TipBody : updated_at: datetime

object TipLike
TipLike : id: int
TipLike : tip_id: int
TipLike : user_id: int
TipLike : created_at: datetime

object User
User : id: int
User : name: string
User : created_at: datetime
User : updated_at: datetime

object UserIcon
UserIcon : id: int
UserIcon : user_id: int
UserIcon : url: string

object OauthAuthentication
OauthAuthentication : id: int
OauthAuthentication : user_id: int
OauthAuthentication : provider_id: int
OauthAuthentication : uid: string
OauthAuthentication : credentials: text
OauthAuthentication : created_at: datetime
OauthAuthentication : updated_at: datetime

object UserRank
UserRank : id: int
UserRank : user_id: int
UserRank : type: int
UserRank : rank: int
UserRank : score: int
UserRank : created_at: datetime
UserRank : updated_at: datetime

User ---|| OauthAuthentication
User ---|| UserRank
User ---|| UserIcon
User ---o{ Tip
Tip ---o{ TipMovie
TipMovie ||---|| Movie
Tip ---|| TipBody
Tip ---o{ TipLike
User }---{ TipLike
@enduml
```
