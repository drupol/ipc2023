#import "imports/preamble.typ": *

#focus-slide[
  #set text(size:2em, fill: white, font: "Virgil 3 YOFF")
  #set align(center + horizon)

  Welcome!

  #pdfpc.speaker-note(```md
    Hello everyone,

    Thanks for being here... for being here during lunch time, double bravo for
    you! I'm so glad to be here, it's been a while I wanted to make such a talk
    and I can't wait to start.

    You know I love the PHP language, I love Nix... and I'm extremely
    enthousiastict to present my first presentation on those two subjects
    together. During one hour, you'll be my alpha audience.

    I guess most of you here knows PHP right? And I also guess you all want to
    know more about what Nix is... Well, I hope you like stories, because I'm
    going to start with a story, my story. Don't worry, it's not going to be
    long, it's just to explain some context.

    So... how did I end up here, in Munich talking about a piece of software
    that I didn't even know existed 3 years ago?

    Today, I will explain what led me to that discovery, how it changed my life,
    and hopefully how it can change yours too.

    Let's jump back 10 years ago, in 2013.
  ```)
]

#focus-slide(background-img: image("../../resources/images/IMG_20130527_210513.jpg"))[
  #set text(fill: white, font: "Virgil 3 YOFF")

  #align(top)[
    The

    Drupal

    era
  ]

  #pdfpc.speaker-note(```md
    This is what I call "the Drupal era".

    I was employee of a consultancy company, taking care of their intranet
    running Drupal 7.

    The picture you see there is genuine, I was in Portland for the DrupalCon.
    I city I wish to revisit one day.

    And yeah, I was using Drupal a lot back then. Drupal 7 was the mainstream
    version, and Drupal 8 was still in the making.
    It was the good time, and it was fun to use it, it was somehow the
    "goldenDrupal era"... this is most probably not the same anymore, but OK,
    this is another subject.

    At the time, PHP 5.3 was massively used everywhere and no Composer was
    required to run it.
  ```)
]

#focus-slide(background-img: image("../../resources/images/IMG_20140930_102359.jpg", fit: "cover"))[
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")

  #align(bottom)[
    Drupal 8
  ]

  #pdfpc.speaker-note(```md
    Back in Belgium, we are now september 2014... and... Ho my gosh time is
    passing so quickly... anyway...

    I was playing with the development version of Drupal 8 on my good old
    Thinkpad X230 running Gentoo.

    By looking at the URL, I remember the setup I had for testing various Drupal
    versions.
    I created multiple directories within my coding folder, each serving a
    different version of Drupal.
    These directories were mapped to a unique Apache virtual host configuration.

    At the time, PHP 5.6 was just released and Composer was required for
    installing Drupal 8...
    The PHP landscape was clearly evolving, challenging us to adapt and learn
    new ways of doing things.
  ```)
]

#focus-slide(background-img: image("../../resources/images/DSC_0959.jpg", fit: "cover"))[
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")
  #align(top)[EASME]

  #pdfpc.speaker-note(```md
    During the same year, the first turn in my carreer happened. I was hired
    as an external consultant by the European Commission, in the EASME agency
    in Brussels.

    I was in charge of a huge mostly static Drupal 7 intranet website and a
    couple of others internal Drupal websites.

    And during my work there, I've started to get some interestes into
    automation. I've setup a automated deployment system based on Aegir, a
    Drupal hosting and deployment system.
    It was a bit of a pain to setup, but it was working quite well for our
    needs.

    I stayed there 3 years, and at the end, I was out of job since most of the
    things were automated.
    It was time for me to move on to something else and challenging myself
    again.
  ```)
]

#focus-slide(background-img: image("../../resources/images/IMG_20180627_132556.jpg", fit: "cover"))[
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")
  #align(top)[Digit]

  #pdfpc.speaker-note(```md
    In 2017, I had the pleasure to join Digit, the ministry of IT, the
    European Commission's IT department.

    There,I became part of a development team focused on the European
    Commission's Drupal 7 platform.
    There, I re-discovered the joy of working in a team, making
    code-reviews,... and the pain of working with a legacy codebase.

    This was a wonderful time for me, I learned a lot about Drupal, about the
    European Commission, about the way things are done there.

    I was moslty driven by the desire to improve the way we were working, make
    the project more stable and reliable, and automatize most of the things...
    like... the coding standards! You cannot imagine the time we've spent on
    fixing coding standards issues... and the time we've spent on arguing on
    how to fix them!

    Technologically, we were, if I may say, on the cutting edge! Almost.

    Using PHP 7 and using Composer for Drupal 7 installations.

    And, unlike traditional corporate settings, our team had the liberty to
    use their personal computers for development.
    This was facilitated by the open-source nature of our work, freeing us
    from the constraints of using standard-issue
    corporate machines running Microsoft software.

    Some colleagues were using Linux, some other Mac, and some other Windows.
    and this variety of ecosystem created a lot of issues when it comes to
    deploy the application, or fixing bugs.
  ```)
]

#focus-slide(background-img: image("../../resources/images/IMG_20180416_161227-01.jpg", fit: "cover"))[
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")
  #align(bottom + center)[Digit]

  #pdfpc.speaker-note(```md
    I don't know if you ever worked with Drupal 7 and with its theming layer... but there were a lot of weird things.

    So, I decided to publish a Drupal module called "registry on steroids" that was fixing the flaws in the theming registry... as you can see in this picture, my colleague Robert and I were about to release the the version 1.1...

    And yes, working in that team was working hard and a lot of fun.
  ```)
]

#focus-slide(background-img: image("../../resources/images/IMG_20170922_155142.jpg", fit: "cover"))[
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")
  #align(bottom)[Digit]

  #pdfpc.speaker-note(```md
    While we were having a lot of fun as you can see on this picture, we also
    had a lot of issues with the way we were working.

    Since we were using a lot of different tools, we had different state of mind
    on how the code should be structured... and we were not always agreeing on
    the way we should work. This is how I got into functional programming, but
    this is another story, maybe for another talk!

    We were spending quite a lot of time on adjusting each other's code to make
    it work on our own machine.

    At some point, we decided to create a new platform running Drupal 8,
    PHP 7.4, and using Composer for everything.

    Therefore, we decided to also embrace the DevOps culture and to automate as
    much as possible our workflow... and that means using Docker for pretty much
    everything.

    It took me some time to accept that it was the optimal way to work together,
    and to make sure that we were all working in the same environment...
    Nevertheless, using Docker for the least thing was quite a pain for me,
    especially on my good old thinkpad.

    This new way of working was quite difficult to adopt, I never liked doing
    everything in container, I always preferred to have a local environment. It
    was so much faster and easy to use.

    Then at some point, I got fed up of Drupal 8, maybe mostly because of all
    these technical issues, I decided to join another team in Digit.
    It was time for me to say Goodbye to Drupal and to move on to some new
    horizon... once again.
  ```)
]

#focus-slide(background-img: image("../../resources/images/PXL_20220905_134209654.jpg", fit: "cover"))[
  #set text(size: 2em, fill: white, font: "Virgil 3 YOFF")
  #align(top + center)[Digit]

  #pdfpc.speaker-note(```md
    And speaking of horizon, this photo is taken from the cafetaria of the building I'm now working in, ... quite impressive isn't it ?! It's at 100m high... Now when I'm being asked what I do for a living, I just reply: I work in the clouds!

    I joined the Digit PHP competency center where I'm in charge of helping teams to migrate their applications from ColdFusion to PHP,
    making sure that their experience with PHP is successful.

    I quickly notice the same kind of issues, the same "class", type of problems, that I was having in the previous team.
    Some developers were using Windows, some others Linux, some others Mac.
    Most of the time none of these environments are not aligned with the rest of the team... and therefore,
    this create a lot of issues when it comes to use a specific PHP extension (Oracle, I'm looking at you), deploy the application, or fixing bugs.

    Attempts to fix this issue were made using Ansible, but it was not enough, and in the end, almost nobody uses it.

    And I was like "There must be a way to fix this gracefuly..." and I started to search for a solution...

    Today, I'm still working in the same team, and I can say that I have found a solution!
    It's not perfect, but things are a much better than before... we'll see together how we got there.
  ```)
]

#focus-slide[
  #set align(center + horizon)
  #set par(justify: true)
  #set text(font: "Virgil 3 YOFF")

  #uncover("1-")[Hello, my name is *Pol Dellaiera*]

  #uncover("2-")[I'm here to talk about]

  #uncover("3-")[*Nix*]

  #set align(right + horizon)

  #uncover("4-")[#text(size:.3em, font: "Virgil 3 YOFF")[...and a little bit about PHP]]

  #pdfpc.speaker-note(```md
    So, hello everyone, I'm Pol Dellaiera, I live in Belgium and I work as an external consultant for European
    Commission since a decade and I'm here to talk about Nix... a piece of software I discovered not so long ago and
    which is helping me everyday in my life. And yeah, we are going to talk just a little bit of PHP... so don't expect
    a talk on why classes should be final by default!

    As a linux user, I was a long time devoted Gentoo user and I began to
    experience system slowdowns on my laptop. Each update increasingly demanded tedious, time-consuming recompilations.
    There has been countless nights when I would leave my computer to grinding through the compilation of KDE,
    Firefox, and the rest. This process was no longer sustainable, and it became clear to me that I needed a faster,
    more eco-friendly binary packages based distribution.

    And As I was anxiously awaiting the release of the Thinkpad X13G2 in Belgium, which, spoiler alert, never happened,
    I decided to explore a tool I've been hearing about since my tribulations with functional programming: Nix.

    So, I discovered Nix 2 years ago, during the Covid period, in June 2021, it's not that far away!

    The thing when it comes to Nix, is that you can either use Nix, the tool on your existing operating system...
    or you can use NixOS, the operating system built around the Nix tool. There are sayings that you can't really use
    NixOS without using Nix before, and I'm here to tell you that it's not true.

    I decided to go down to the rabbit hole immediately... I bought a new hard disk drive and gave NixOS a test run.

    To my surprise, I found myself not wanting to return to my old Gentoo. A companion of 10 years now gathering dust.
    Rest in peace, little angel. Of course Gentoo is great, but it's nothing to compare to NixOS, NixOS is just pure
    awesomeness in every aspect.

    All of this is great... but what is Nix? I guess if you're here, it's to know more about it... and the time has
    come!

    The thing is that, explaining Nix to people who never heard of it, or even use it is somehow quite difficult and I
    underestimated the task... Why? Look at those carefully chosen screenshots...
  ```)
]

#focus-slide(background-color: rgb("#111111"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231019_224304.png"),
      caption: [
        #link("https://main.elk.zone/mathstodon.xyz/@clerie@fem.social/111063172442171910")[https://main.elk.zone/mathstodon.xyz/@clerie@fem.social/111063172442171910]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    This screenshot from Mastodon... to give you a glimpse on how hard the task to explain nix is.

    I've got some other examples...
  ```)
  ]

#focus-slide(background-color: rgb("#111111"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231019_224108.png"),
      caption: [
        #link("https://main.elk.zone/darmstadt.social/@Atemu/111063395928947898")[https://main.elk.zone/darmstadt.social/@Atemu/111063395928947898]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    And another one here...

    So don't worry, I'm not going to write a PHD to explain what Nix is or how it works... I'm just going to give you a glimpse of what it is and how, hopefully, it can help you as well.
  ```)
]

#focus-slide(background-color: rgb("#080808"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231005_120226.png"),
      caption: [
        #link("https://twitter.com/matyo91/status/1501500584242860032")[https://twitter.com/matyo91/status/1501500584242860032]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    Here's a french Symfony developer...
  ```)
]

#focus-slide(background-color: rgb("#313543"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #figure(
    image("../../resources/screenshots/Screenshot_20231005_120003.png"),
    caption: [
      #link("https://mastodon.social/@php_discussions/109576203192335392")[https://mastodon.social/@php_discussions/109576203192335392]
    ]
  )

  #pdfpc.speaker-note(```md
    Here's a german PHP developer...

    Fortunately, I'm not the only one advocating Nix in the PHP ecosystem...
  ```)
]

#focus-slide(background-color: rgb("#111111"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231005_213801.png"),
      caption: [
        #link("https://main.elk.zone/mathstodon.xyz/@danielsiepmann@friendica.daniel-siepmann.de/111184067773971992")[https://main.elk.zone/mathstodon.xyz/@danielsiepmann@friendica.daniel-siepmann.de/111184067773971992]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    Here's another developer...
  ```)
]

#focus-slide(background-color: rgb("#000000"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231005_113953.png"),
      caption: [
        #link("https://twitter.com/Ocramius/status/1504406934664921089")[https://twitter.com/Ocramius/status/1504406934664921089]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    There's also Marco Pivette - Ocramius - advocating for the Nix adoption... I guess you all know him.
  ```)
]

#focus-slide(background-color: rgb("#000000"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231012_224915.png"),
      caption: [
        #link("https://twitter.com/mitchellh/status/1649503702456340483")[https://twitter.com/mitchellh/status/1649503702456340483]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    Here you can see a message from Mitchell Hashimoto... the creator of Vagrant, Terraform, etc etc...

    I totally share his views. In 20 years of IT, I could count on a single hand the most impactful technologies that happened
    in my life... php, git, nix... looks like all the great things are in three letters, isn't it ?
  ```)
]

#focus-slide(background-color: rgb("#000000"))[
  #set align(center + horizon)
  #set text(size: .2em)

  #pad(2em)[
    #figure(
      image("../../resources/screenshots/Screenshot_20231012_225714.png"),
      caption: [
        #link("https://twitter.com/mitchellh/status/1491102567296040961")[https://twitter.com/mitchellh/status/1491102567296040961]
      ]
    )
  ]

  #pdfpc.speaker-note(```md
    And a last message here still from him.

    Let's stop here...

    This intro was here just to show you where I come from and why technologies
    like Nix are useful and problem solving.

    From there, I've summarized my needs, in the context of PHP.

    Typically, a PHP developper need:

    - The PHP interpreter
    - A package manager, Composer obviously
    - A cool command line with contextual information
    - The freedom to customize its environment
    - All of this aligned with it's colleagues...

    Typically, a PHP developper do not need:

    - Spending too much time learning new tools to setup its develpment
      environments
    - Dependencies conflicts
    - Being told which tool to use to develop

    Given all of this, let's see how we can leverage Nix to improve the
    developer experience.

    Let's unravel all together the mistery of Nix!

    By the way, this presentation will be available online at some point, it
    contains many links, especially in the figure captions. I encourage you to
    visit to learn more about something or to just verify what I'm saying.

    Oh and this presentation is totally reproducible for anyone, but we'll come
    to that later ;)
  ```)
]
