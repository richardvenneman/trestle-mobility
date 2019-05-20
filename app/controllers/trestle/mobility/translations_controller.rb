class Trestle::Mobility::TranslationsController < Trestle::ApplicationController
  def translate
    translation = Trestle::Mobility::Translators::DeeplTranslator.new.translate(
      translation_params[:text],
      translation_params[:from_locale],
      translation_params[:to_locale],
      translation_params[:query_params] || {}
    )

    render plain: translation
  end

  private
    def translation_params
      params.require(:translation).permit(:text, :from_locale, :to_locale, query_params: {})
    end
end
