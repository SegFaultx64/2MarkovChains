# 2 (Markov) Chains
### Procedurally generating lyrics

This is a project that uses marky_markov and rapgenius to procedurally generate lyrics. It is about ~60 lines of Ruby, and is a good way to illustrate the possibilities of Markov chains.

To find out more about this project checkout my slides [here](http://empirewindrush.com/slides/2markovchains), or my blog post on the matter which will be going up soon. If you have any thoughts, questions, or concerns feel free to tweet at me @ReluctantHipstr.

## Install

Just run.

```bash
bundler install
```

# Getting Started

## Downloading an artist

```bash
ruby ./cli.rb get "2 Chainz"
```

## Generate some text

```bash
ruby ./cli.rb "2 Chainz"
```

> "They saying that I hustle all day And who I sold dope in my league I swear I ain't real I put the fire out?""

## Download another artist

```bash
ruby ./cli.rb get "Taylor Swift"
```

## Combine them

```bash
ruby ./cli.rb "2 Chainz+Taylor Swift"
```

> "I tuck you in, turn on your chest And my homies try to never grow up Oh, don't you worry your pretty little mind"

# Advanced

## Using the server

```bash
ruby ./server.rb
```

Navigate to [http://localhost:4567/Taylor Swift+2 Chainz](http://localhost:4567/Taylor Swift+2 Chainz). You should see something like: 

> "Get out of your life You know we trynna hide the six that's why I'm feeling like there's always someone who disapproves"

## Load your own text corpus

Download a text file and put it in the same folder as the application. Then run.

```bash
ruby ./cli.rb load ./janeAusten.txt "Jane Austen"


ruby ./cli.rb "2 Chainz + Jane Austen"
```

> "Elizabeth again and again during the chief of their engagements at Rosings. Damn, I shoulda wore a condom!"
