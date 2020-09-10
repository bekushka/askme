# Модуль хэлпера ApplicationHelper
#
# В этом файле мы можем писать вспомогательные методы (хелперы) для шаблонов,
# (представлений, вьюх) нашего приложения
module ApplicationHelper
  # Этот метод возвращает ссылку на автарку пользователя, если она у него есть
  # или ссылку на дефолтную аватарку, которая лежит в app/assets/images
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def question_counted(questions_count)
    word_declination(questions_count, 'вопрос', 'вопроса', 'вопросов')
  end

  def answer_counted(answers_count)
    word_declination(answers_count, 'ответ', 'ответа', 'ответов')
  end

  def word_declination(number, one, few, many)
    if (11..14).include?(number % 100)
      many
    end

    residue = number % 10

    if residue == 1
      one
    elsif (2..4).include?(residue)
      few
    else
      many
    end
  end


  # Хелпер, рисующий span тэг с иконкой из font-awesome
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
