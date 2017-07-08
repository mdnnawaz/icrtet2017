class StaticPagesController < ApplicationController
  def home
  end

  def call_for_papers
  end

  def important_dates
  end

  def paper_ethics
  end

  def commitee
  end

  def venue_and_contact
  end

  def selections
  end

  def publications
  end


  def brochure
    send_file(
      "#{Rails.root}/public/icrtet17_brochure.pdf",
      filename: "icrtet2017_brochure.pdf",
      type: "application/pdf"
      )
  end

  def schedule
    send_file(
      "#{Rails.root}/public/updated_schedule2017.pdf",
      filename: "updated_schedule2017.pdf",
      type: "application/pdf"
      )
  end

  def paper_temp
   send_file(
    "#{Rails.root}/public/Paper Format.doc",
    filename: "paper_template.doc",
    type: "application/pdf"
    )
 end


end
