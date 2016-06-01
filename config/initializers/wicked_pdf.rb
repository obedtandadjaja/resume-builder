# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

if Rails.env.staging? || Rails.env.production?
  WickedPdf.config = { exe_path: Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s }
else
  WickedPdf.config = { exe_path: '/usr/local/bin/wkhtmltopdf' }
  # exe_path = '/usr/local/bin/wkhtmltopdf'
end
