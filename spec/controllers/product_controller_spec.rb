require 'spec_helper'
# require 'test/unit'
  describe ProductsController do

    describe 'GET#index' do #??
      it "populates an array of products" do
        product = create(:product)
        get :index
        assigns(:products).should eq Product.all
      end

      it "renders index view" do
        get :index
        response.should render_template :index
      end
    end

    describe 'GET#show' do
      it "renders show view" do
        product = create(:product)
        get :show , id: product
        assigns(:product).should eq product
        response.should render_template :show
      end
    end

    describe 'POST#create' do #??
      context "with valid attributes" do
       it "redirects to home page" do
          post :create, product: attributes_for(:product)
          product = assigns[:product]
          response.should redirect_to product_url(product)
        end

        it "saves new product in database" do
          expect{
            post :create , product: attributes_for(:product)
            }.to change(Product , :count).by(1)
        end
      end

      context "with invalid attributes" do #??
        it "does not save new product in database" do
          expect{
            post :create , product: attributes_for(:invalid_product)
            }.to_not change(Product, :count)
        end
      end
    end

    describe 'GET#new' do
      it "renders new template" do
        get :new
        response.should render_template :new
      end

      it "assigns product to @product" do
        get :new
        assigns(:product).should be_a_new(Product)
      end


    end

    describe 'GET#edit' do

      it "renders edit template" do
        product = create(:product)
        get :edit , id: product
        response.should render_template :edit
      end

      it "assigns requested product to @product"do #??
        product = create(:product)
        get :edit , id: product
        debugger
        assigns(:product).should eq product
      end
    end

    describe 'PUT#update' do
      before :each do
        @product = create(:product , title: "chocolate")
      end

      it "locates requested product" do
        put :update , id: @product , product: attributes_for(:product)

        assigns(:product).should eq @product
        debugger
      end


      context "with valid attributes" do
        it "changes @product's atttributes" do
          put :update , id: @product ,
          product: attributes_for(:product , title: "qwe")
          @product.reload
          debugger
          @product.title.should eq "qwe"
        end

        it "redirects to products show page" do
          put :update , id: @product ,
          product: attributes_for(:product)
          # debugger
          response.should redirect_to @product
        end
      end

      context "with invalid attributes" do
        it "does not change @product's attributes" do
          put :update , id: @product ,
          product: attributes_for(:product , title: "ghf" , price:nil)
          @product.reload
          debugger
          expect(@product.price).not_to be_nil
          expect(@product.title).not_to be "ghf"
        end

        it "re-renders to edit page" do
          put :update , id: @product ,
          product: attributes_for(:invalid_product)
          response.should render_template :edit
        end
      end

    end

    describe 'DELETE#destroy' do
      before :each do
        @product = create(:product)
      end

      it "deletes product from database" do
        expect { delete :destroy , id: @product }.to change(Product , :count).by(-1)
      end

      it "abcc0" do
        item = create :line_item#, product: @product
        # delete :destroy , id: item.product
        expect { delete :destroy , id: item.product }.to change(Product , :count).by(-1)
      end

      it "redirects to products index page" do
        delete :destroy , id: @product
        response.should redirect_to products_path
        end
    end

    it "render who_bought.xm page for perticular product"  do
      @product = create(:product)
      get :who_bought, id: @product, format: :xml
      response.headers['Content-Type'].should have_content 'xml'
    end



end
