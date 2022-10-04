//
//  Animals.swift
//  Animals
//
//  Created by Mekhriddin Jumaev on 30/09/22.
//

import UIKit

struct Animal {
    let name: String
    let image: UIImage
    let info: String
    let mass: String
    let lifeSpan: String
    let pronounce: String
    let quiz: String
}

let animals: [Animal] = [
    
    Animal(name: "Lion", image: UIImage(named: "lion")!, info: "Lions are king of the jungle. They live in parts of Africa and India. Their loud roar is among the most terrifying sounds of the grasslands. Lions are covered with yellow-brown hair. A male lion is easy to spot because of its mane. This coarse hair grows on its head, neck, and shoulders.", mass: "130 - 190 kg", lifeSpan: "15 – 16 years", pronounce: "/ˈlʌɪən/", quiz: "Which animal is the King of the Jungle?"),
                         
    Animal(name: "Tiger", image: UIImage(named: "tiger")!, info: "The tiger is the largest of the cats. Like lions, tigers are very strong and fierce hunters. They are found in the wild only in parts of Russia, China, and South and Southeast Asia. They live in forests, grasslands, and swamps and hunt alone at night. They prey on animals such as deer and wild hogs.", mass: "90 - 310 kg", lifeSpan: "8 – 10 years", pronounce: "/ˈtʌɪɡə/", quiz: "Which animal is the largest of the cats?"),
    
    Animal(name: "Horse", image: UIImage(named: "horse")!, info: "The horse is a mammal that people have valued for thousands of years. In the past people commonly used horses to get from place to place and to pull heavy loads. Horses once roamed free over grasslands in North America, South America, Europe, Asia, and Africa.", mass: "300 kg", lifeSpan: "25 – 30 years", pronounce: "/hɔːs/", quiz: "Which mammal have people valued for thousands of years?"),
       
    Animal(name: "Zebra", image: UIImage(named: "zebra")!, info: "Zebras are mammals that are known for their black and white stripes. They belong to the horse family of animals. There are three species, or types, of zebra: the plains zebra, Grevy’s zebra, and the mountain zebra. They live in various parts of Africa.", mass: "350 kg", lifeSpan: "25 years", pronounce: "/ˈzɛbrə,ˈziːbrə/", quiz: "Which mammal is known for their black and white stripes?"),
    
    Animal(name: "Elephant", image: UIImage(named: "elephant")!, info: "Elephants are the largest living land animals. Elephants’ skin is thick, wrinkled, and not very hairy. It is grayish to brown in color. An elephant uses its trunk to grab food and to put it into the mouth. It can also draw water into the trunk and then blow it into the mouth.", mass: "4 tons", lifeSpan: "60 - 70 years", pronounce: "/ˈɛlɪf(ə)nt/", quiz: "Which mammal is the largest living land animal?"),
    
    Animal(name: "Monkey", image: UIImage(named: "monkey")!, info: "Monkeys are clever, social animals. They are known for running and leaping through trees with ease. Monkeys use all four limbs—two arms and two legs—to walk and run. Their hands and feet are good for grasping tree branches. Monkeys have a coat of hair on most of their bodies.", mass: "7.7 kg", lifeSpan: "15 - 20 years", pronounce: "/ˈmʌŋki/", quiz: "Which mammal can run and leap through trees with ease?"),
    
    Animal(name: "Giraffe", image: UIImage(named: "giraffe")!, info: "The giraffe is the tallest living animal. It can reach a height of more than 5.5 meters. Giraffes have a short body, but their legs and neck are very long. The coat is light brown with reddish brown spots. Many giraffes have two short horns between the ears. Their tongues are more than 45 centimeters long.", mass: "2 tons", lifeSpan: "20 - 25 years", pronounce: "/dʒɪˈrɑːf,dʒɪˈraf/", quiz: "Which mammal is the tallest living animal?"),
    
    Animal(name: "Crocodile", image: UIImage(named: "crocodile")!, info: "Crocodiles are lizardlike, flesh-eating animals. They are the largest living members of the group of animals called reptiles. They are related to alligators. Crocodiles eat mainly fish, turtles, birds, and other small animals. They capture water animals in their jaws with a sideways motion.", mass: "200 - 1,000 kg", lifeSpan: "60 - 70 years", pronounce: "/ˈkrɒkədʌɪl/", quiz: "Which animals are the largest living members of the group of animals called reptiles?"),
    
    Animal(name: "Wolf", image: UIImage(named: "wolf")!, info: "Wolves are members of the dog family. They are known for their intelligence and courage. Wolves are also noted for traveling very long distances. Wolves normally hunt at night in groups. They eat deer, moose, squirrels, and mice. They live in groups called packs.", mass: "40 kg", lifeSpan: "16 years", pronounce: "/wʊlf/", quiz: "Which animal is known for their intelligence and courage?"),
    
    Animal(name: "Hippo", image: UIImage(named: "hippo")!, info: "The hippopotamus is a huge mammal that lives only in Africa, south of the Sahara. Hippopotamuses spend the day resting in shallow water. They often sleep with just their eyes, ears, and nose above the water. It can keep its head underwater for 5 to 10 minutes before coming up to breathe.", mass: "4.5 tons", lifeSpan: "48 - 70 years", pronounce: "/ˈhɪpəʊ/", quiz: "Which animal can keep its head underwater for 5 to 10 minutes before coming up to breathe?"),
    
    Animal(name: "Fox", image: UIImage(named: "fox")!, info: "Foxes are mammals that look like small, bushy-tailed dogs. They live all over the world. Foxes usually live in dens. The den is often a burrow that another animal dug and left. Most foxes hide by day and hunt by night. They like to eat birds, including chickens, and small mammals such as gophers and rabbits.", mass: "3.2 – 9.4 kg", lifeSpan: "3 - 4 years", pronounce: "/fɒks/", quiz: "Which animal likes to eat birds, including chickens, and small mammals such as gophers and rabbits?"),
    
    Animal(name: "Bear", image: UIImage(named: "bear")!, info: "Bears are large, powerful mammals related to dogs and raccoons. The biggest bears are the world’s largest animals that live on land and eat meat. Bears have broad heads, large bodies, and short legs and tails. They have poor eyesight but an excellent sense of smell. Most kinds are good at climbing trees and at swimming.", mass: "80 – 600 kg", lifeSpan: "20 - 30 years", pronounce: "/bɛː/", quiz: "Which animal is good at climbing trees and at swimming?"),
    
    Animal(name: "Panda", image: UIImage(named: "panda")!, info: "The name panda is used for two mammals that live in Asia: the giant panda and the lesser panda, or red panda. The giant panda is found only in bamboo forests in central China. The giant panda has a bulky body and a round head. Its fur is white with black on the shoulders, legs, and ears and around the eyes. They eat bamboo and other plants, fruit, and sometimes small animals.", mass: "70 – 120 kg", lifeSpan: "20 - 30 years", pronounce: "/ˈpandə/", quiz: "Which animal likes to eat bamboo and other plants, fruit, and sometimes small animals?"),
    
    Animal(name: "Snake", image: UIImage(named: "snake")!, info: "Snakes are found throughout the world. Most snakes live on the ground, but others prefer trees. Some snakes spend their whole lives in underground tunnels. Sea snakes live in water. Snakes have no ears or eyelids. Clear scales cover the eyes. A snake’s mouth opens wide because the lower and upper jaw can separate.", mass: "Not found", lifeSpan: "9 years", pronounce: "/sneɪk/", quiz: "Which animal does not have any ears or eyelids?"),
    
    Animal(name: "Camel", image: UIImage(named: "camel")!, info: "Camels are well adapted to living in deserts. They feed on thorny plants, shrubs, and dried grasses. They can go for days or even months without water. If a camel goes without food and water, the fat in its hump can nourish it for several days. The hump then becomes limp and leans to one side.", mass: "650 kg", lifeSpan: "40 years", pronounce: "/ˈkam(ə)l/", quiz: "Which animal can go for days or even months without water?"),

    Animal(name: "Deer", image: UIImage(named: "deer")!, info: "Deer are the only animals that can grow large antlers. Deer have large ears, short tails, and long, slender legs. On each foot they have two small and two large hooves. Deer usually have smooth, brown fur. White areas often cover the chest and throat. Some types have a shaggy coat, especially in the cold seasons.", mass: "90 - 150 kg", lifeSpan: "6 years", pronounce: "/dɪə/", quiz: "Which animal can grow large antlers?"),
    
    Animal(name: "Rhinoceros", image: UIImage(named: "rhino")!, info: "Rhinoceroses are heavy animals with thick skin and hooves. There are five species, or types, of this mammal. Illegal hunting has left most of them in danger of dying out. Most rhinoceroses live by themselves. They generally live in grasslands, in areas with small bushes, or in marshes. The Sumatran rhinoceros prefers the forest.", mass: "3 - 5 tons tons", lifeSpan: "40 - 50 years", pronounce: "/rʌɪˈnɒs(ə)rəs/", quiz: "Which animal has been left in danger of dying out because of illegal hunting?"),
]
