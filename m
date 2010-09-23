From: Joe Perches <joe@perches.com>
Date: Thu, 23 Sep 2010 07:36:53 +0000
Subject: Re: threaded patch series
Message-Id: <1285227413.7286.47.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
In-Reply-To: <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2010-09-23 at 00:11 -0700, matt mooney wrote:
> What is needed to get a patch series to be threaded?
> In the recent patch series I sent, I used "git
> send-email" in a script that listed the commands with cc's and such.
> What should I have done?

It depends on what version of git you're using.
I think 1.7 changed the defaults.

I use:
$ git format-patch --thread=shallow --cover-letter ...
then
$ git send-email --nothread --no-chain-reply-to --suppress-cc=self ...

I also sometimes use an option to send-email that generates
the cc's using a shell script with scripts/get_maintainer.pl 

$ git send-email --nothread --no-chain-reply-to --suppress-cc=self \
      --cc-cmd=<file> ...

Where <file> could be:

$ cat scripts/send-email-listed-MAINTAINERS-only
#!/bin/bash
if [[ $(basename $1) =~ ^0000- ]] ; then
    ./scripts/get_maintainer.pl --nogit $(dirname $1)/*
else
    ./scripts/get_maintainer.pl --nogit $1
fi

If the cc list is very long, vger might not accept
the cover letter 0000-<foo> email, so adding --nom
like this could be better:

$ cat scripts/send-email-listed-MAINTAINERS-only
#!/bin/bash
if [[ $(basename $1) =~ ^0000- ]] ; then
    ./scripts/get_maintainer.pl --nogit --nom $(dirname $1)/*
else
    ./scripts/get_maintainer.pl --nogit $1
fi


