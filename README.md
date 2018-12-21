# README

I make this tutorial with Hackademy course you can follow it at this address:
https://hackademy.io/p/rails

Thanks to Nicolas Cavigneaux.

Things you may want to cover:

* Ruby version : 2.5.3
* Rails version : 5.2.1

* System dependencies Ubuntu 18.04 (I tried with Windows 10 but it seems to be harder)

APPLI RAILS (HACKADEMY COURSE)

Installing Ruby : https://gorails.com/setup/ubuntu/18.10
--------------------------------------------------------

Choose the recommended version of Ruby to install:
The first step is to install some dependencies for Ruby and Rails.
To make sure we have everything necessary for Webpacker support in Rails, we're first going to start by adding the Node.js and Yarn repositories to our system before installing them.

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

Next we're going to be installing Ruby using one of three methods. Each have their own benefits, most people prefer using rbenv these days, but if you're familiar with rvm you can follow those steps as well. I've included instructions for installing from source as well, but in general, you'll want to choose either rbenv or rvm.
Choose one method. Some of these conflict with each other, so choose the one that sounds the most interesting to you, or go with my suggestion, rbenv.
    • Using rbenv (Recommended) 
    •  
Installing with rbenv is a simple two step process. First you install rbenv, and then ruby-build: 
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.5.3
rbenv global 2.5.3
ruby -v
The last step is to install Bundler
gem install bundler
rbenv users need to run rbenv rehash after installing bundler.


Installing Rails
--------------------------------
Choose the version of Rails you want to install:
Since Rails ships with so many dependencies these days, we're going to need to install a Javascript runtime like NodeJS. This lets you use Coffeescript and the Asset Pipeline in Rails which combines and minifies your javascript to provide a faster production environment.
To install NodeJS, we're going to add it using the official repository:
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
And now, without further adieu:
gem install rails -v 5.2.1
If you're using rbenv, you'll need to run the following command to make the rails executable available:
rbenv rehash
Now that you've installed Rails, you can run the rails -v command to make sure you have everything installed correctly:

rails -v
# Rails 5.2.1
git config --global user.email "Vous@exemple.com"
git config --global user.name "Votre Nom"


Starting
--------------------------------------

rails new shop --webpack

cd shop

Create a new repositpory in github
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/YOUR_NAME/Your_REPOSITORY.git
git push -u origin master


rails s
http://localhopst:3000

Yay! You’re on Rails!
	
Rails version: 5.2.1
Ruby version: 2.5.3 (x86_64-linux) 

rails generate scaffold Product title:string description:text price:decimal image_url:string

In app/db/migrate

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 6, scale: 2
      t.string :image_url

      t.timestamps
    end
  end
end

rails db:migrate
== 20181121170405 CreateProducts: migrating ===================================
-- create_table(:products)
   -> 0.0013s
== 20181121170405 CreateProducts: migrated (0.0014s) ============================

rails s

open your browser with this address
http://localhost:3000/products

Products
Title
Description
Price
Image url

New Product

Clic on new product and you will see the new form

#app/views/products/_form.html.erb
replace description field by this:

  <div class="field">
    <%= form.label :description %>
    <%= form.text_area :description, cols: 60, rows: 10 %>
  </div>

Using seeds
#db/seeds.rb
Product.create(
  title: "Mug",
  description: "Un joli mug pour votre café",
  price: 12.5,
  image_url: "une_image.jpg")
  
Product.create(
  title: "T-shirt",
  description: "Parfait pour le sport",
  price: 25,
  image_url: "tshirt.jpg")
Product.create(
  title: "Vélo" ,
  description: "Un vélo pour faire du sport",
  price: 152.5,
  image_url: "un_velo.jpg")
  
Product.create(
  title: "TV",
  description: "Vous pourrez regarder toutes vos émissions préférées",
  price: 598.99,
  image_url: "tv.jpg")
  puts "Vous venez de créer  #{Product.count} produits"
rails db:seed

>Vous venez de créer 4 produits

git branch bootstrap
git branch
bootstrap
* master

git checkout bootstrap
git status → on branch bootstrap

yarn add bootstrap@4.0.0
bundle exec rake yarn:install

#app/javascript/packs/application.scss
@import '~bootstrap/dist/css/bootstrap'


In app/views/layouts/application.html.erb` 

<!DOCTYPE html>
<html>
<head>
  <title>Shop</title>
  <%= csrf_meta_tags %>
  <%= csp_meta_tag %>

  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>

  <%= stylesheet_pack_tag 'application' %>
</head>

<body>
  <div class="container">
    <%= yield %>
  </div>
</body>
</html>


Les helpers
#app/views/products/index.html.erb
<td><%= truncate strip_tags(product.description), length: 80  %></td>

#app/views/products/show.html.erb
<%= raw @product.description %>

<td><%= number_to_currency @product.price, unit: "€", separator: ",", format: "%n%u" %></td>

Les images : Ajoutons donc les images au répertoire
`app/assets/images`.
Show.html.erb
<td><%= image_tag @product.image_url, width: 50 %></td>

Les validations
#app/models/products.rb
validates :title, :description, :image_url, presence: true

Validation du prix
Passons maintenant à l'ajout des validations pour le prix. Disons pour l'exemple qu'on souhaite n'autoriser que des prix qui sont supérieurs ou égaux à 1.
validates :price, numericality: { greater_than_or_equal_to: 1 }
Validation du format de l'image
Nous sommes presque arrivés au bout, on n'a pour le moment prêté aucune attention particulière à l'attribut image_url. Il faudrait pourtant vérifier que ce qui est passé semble bien être une image. Ce n'est pas une solution sans faille mais nous allons faire ça en vérifiant que le nom qui est passé fini bien par .jpg, .png ou .gif :
validates :image_url,
  format: {
    with: /\.(jpg|png|gif)\z/i,
    message: 'doit être au format jpg, png ou gif'
  },
  allow_blank: true

Ajout d’un catalogue
rails generate controller Catalog index

#app/config/routes.rb
root 'catalog#index'

#app/controllers/catalog_controller.rb
class CatalogController < ApplicationController
  def index
    @products = Product.order(:title)
  end
end

#app/views/catalog.html.erb
<h1>Catalogue produit</h1>

<% @products.each do |product| %>
  <div class="row mb-4">
    <div class="card w-50 bg-light">
      <div class="card-body">
        <h2 class="card-title"><%= product.title %></h2>
        <div class="row">
          <div class="col-6">
            <%= image_tag(product.image_url, width: "200") %>
          </div>
          <div class="col-6">
            <div class="card-text"><%= sanitize(product.description) %></div>
          </div>
        </div>
      </div>
      <div class="card-footer text-center font-weight-bold">
        <%= number_to_currency product.price, unit: '€', separator: ',', format: '%n %u' %>
      </div>
    </div>
  </div>
<% end %>

Création du panier
$ rails generate scaffold Cart
$ rails db:migrate
Récupération du panier courant

Dans Rails, on a accès à la session de l'utilisateur courant grâce à la méthode session. Cette méthode retourne un objet qui se comporte comme un Hash. Créons un module qui va être dédié à la récupération du panier. On pourra ensuite inclure ce module dans chaque contrôleur qui nécessite un accès au panier.

Pour mettre en place ce genre de module ré-utilisable, Rails met à disposition un répertoire app/controllers/concerns. C'est ici que nous allons ajouter notre fichier current_cart.rb :
module CurrentCart
  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] ||= @cart.id
  end
end
Associer des produits au panier
rails generate scaffold LineItem cart:belongs_to product:belongs_to quantity:integer

$ bin/rails generate scaffold LineItem cart:belongs_to product:belongs_to quantity:integer

On va éditer la nouvelle migration pour spécifier qu'on veut que la quantité soit à 1 par défaut :
t.integer :quantity, default: 1

Si on regarde cette migration de plus près on a bien notre belongs_to qui apparaît et signifie que dans cette table, on aura une colonne cart_id qui référence un panier donné. Idem pour product.
rails db:migrate

On va donc ajouter la relation à LineItem dans le model Cart :
has_many :line_items, dependent: :destroy

C'est la méthode has_many qui permet de définir une relation 1-N, notre modèle Cart sait maintenant qu'il peut avoir N LineItems associés. Vous noterez qu'on a passé l'option dependent: :destroy dont le but est de supprimer en cascade les LineItems associés à un panier si ce dernier est supprimé. Ça nous évite de nous retrouver avec des lignes orphelines.

Faisons de même pour le modèle Product :
has_many :line_items, dependent: :nullify
app/views/catalog/index.html.erb :
<%= button_to 'Ajouter au panier', line_items_path(product_id: product), class: 'btn btn-primary' %>

# app/controllers/line_items_controller.rb
include CurrentCart

before_action :set_cart, only: [:create]
def create
product = Product.find(params[:product_id])
@line_item = @cart.line_items.new(product: product)
format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }

#app/views/carts/show.html.erb
<p id="notice"><%= notice %></p>
<h2>Panier</h2>
<ul>
  <% @cart.line_items.each do |item| %>
    <li><%= item.product.title %></li>
  <% end %>
</ul>
<p><%= link_to "Retour aux produits", root_path %></p>

Modèle cart
def add_product(product)
  item = line_items.find_by(product: product)

  if item
    item.quantity += 1
  else
    item = line_items.new(product: product)
  end

  item
end
On modifie ensuite notre action contrôleur pour utiliser cette nouvelle méthode :
def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

…

Et finalement on affiche cette information dans la page panier :
<li><%= item.product.title %> (x <%= item.quantity %>)</li>

Modifions le fichier app/controllers/carts_controller.rb pour y apporter quelques modifications :
rescue_from ActiveRecord::RecordNotFound, with: :cart_not_found

private

def cart_not_found
  redirect_to root_url, alert: t(".cart_not_found")
end
