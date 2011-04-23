From: Dan Carpenter <error27@gmail.com>
Date: Sat, 23 Apr 2011 14:51:28 +0000
Subject: Re: Getting started as a janitor
Message-Id: <BANLkTi=nF+RLxY812rq3d-S8WL9qDvGPPA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BANLkTi=1H5-RpvfWbfCMQBn4EktZOWvdCw@mail.gmail.com>
In-Reply-To: <BANLkTi=1H5-RpvfWbfCMQBn4EktZOWvdCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/22/11, Manuel Mejia <me@manuelmejia.com> wrote:
> That makes sense. So gar, I feel comfortable with C, but need to get a
> better feel for system calls and the like.

There are a couple books on the linux kernel.  Linux Device Drivers
is good and a free download.  Robert Love's book is good.
lwn.net has good information.

>
> Would you happen to have a link to get more info on staging drivers?

http://linuxdriverproject.org/foswiki/bin/view
Look through the mailing list archive to see what people are working on.

> Ultimately, my goal is to contribute towards hardware drivers and display (x
> server) once I gain enough knowledge. Currentfy going to school for computer
> engineering Maybe you have other suggestions based on that? I've been
> looking around for a while, googling, but there isn't a whole lot on how to
> get started (info looks outdated usually) or points to kernel newbies.
>

In the end the mailing lists are the only up to date sources of information.

If you downloaded linux-next and used Smatch to check the code from
3 weeks ago and the code from today and then used the new_bugs.sh
script to show the difference the two runs, you would probably find quite
a few valid bugs.  I haven't been checking Smatch output for a while.

regards,
dan carpenter
