 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/attachments", type: :request do
  
  # Attachment. As you add validations to Attachment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Attachment.create! valid_attributes
      get attachments_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      attachment = Attachment.create! valid_attributes
      get attachment_url(attachment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_attachment_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      attachment = Attachment.create! valid_attributes
      get edit_attachment_url(attachment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Attachment" do
        expect {
          post attachments_url, params: { attachment: valid_attributes }
        }.to change(Attachment, :count).by(1)
      end

      it "redirects to the created attachment" do
        post attachments_url, params: { attachment: valid_attributes }
        expect(response).to redirect_to(attachment_url(Attachment.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Attachment" do
        expect {
          post attachments_url, params: { attachment: invalid_attributes }
        }.to change(Attachment, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post attachments_url, params: { attachment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested attachment" do
        attachment = Attachment.create! valid_attributes
        patch attachment_url(attachment), params: { attachment: new_attributes }
        attachment.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the attachment" do
        attachment = Attachment.create! valid_attributes
        patch attachment_url(attachment), params: { attachment: new_attributes }
        attachment.reload
        expect(response).to redirect_to(attachment_url(attachment))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        attachment = Attachment.create! valid_attributes
        patch attachment_url(attachment), params: { attachment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested attachment" do
      attachment = Attachment.create! valid_attributes
      expect {
        delete attachment_url(attachment)
      }.to change(Attachment, :count).by(-1)
    end

    it "redirects to the attachments list" do
      attachment = Attachment.create! valid_attributes
      delete attachment_url(attachment)
      expect(response).to redirect_to(attachments_url)
    end
  end
end
