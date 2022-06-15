# shopping_products

An app to list products from realtime database with the option to edit and delete the products. using clean architecture.

# Demo
![Demo](demo.gif)

## Getting Started

**Note:** Make sure your Flutter environment is [setup](https://flutter.io/getting-started/).

## Installation

In the command terminal, run the following commands:

    $ git clone https://github.com/Leonardov31/shopping_products.git
    $ cd shopping_products/

## Setup Flutter Firebase integration
Check out the [documentation]('https://firebase.google.com/docs/flutter/setup?platform=android') to setup Flutter Firebase integration.

#### Reatime Database data example:
Import the [Json data](data.json) into the firebase realtime database and replace the 'filename' whith your firebase storage path referencing the images.
Exemplo:
    
    filename: "gs://shopping-products-f39f5.appspot.com/0.jpg"

## Start your Flutter project by running the command:
    
    $ flutter run