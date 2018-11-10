class UserRank < ApplicationRecord
  belongs_to :user

  enum gachi_rule: { area: 1, yagura: 2, hoko: 3, asari: 4 }
  enum rank: {
    c_minus: 0,
    c: 1,
    c_plus: 2,
    b_minus: 3,
    b: 4,
    b_plus: 5,
    a_minus: 6,
    a: 7,
    a_plus: 8,
    s: 9,
    s_plus: 10,
    x: 11
  }
end
