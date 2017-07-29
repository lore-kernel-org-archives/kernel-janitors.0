From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Sat, 29 Jul 2017 11:25:04 +0000
Subject: Re: Concerning [PATCH] staging: pi433: fix bugs in register abstraction of rf69 chip
Message-Id: <1924105600.11473.1501327505104@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <648573072.11146.1501319771774@ox.hosteurope.de>
In-Reply-To: <648573072.11146.1501319771774@ox.hosteurope.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,
 
the "big" patch, I was telling about yesterday will touch exactly that file.
So if you are planning deep changes, we will most probably run into conflicts.
 
If I'll find some time (maybe tomorrow), I'll try to send that long patch, so
you can see.
Already nervous about next failing patch :-(
 
Cheers,
 
Marcus

> Dan Carpenter <dan.carpenter@oracle.com> hat am 29. Juli 2017 um 12:52
> geschrieben:
>
>
> On Sat, Jul 29, 2017 at 11:16:11AM +0200, Marcus Wolf wrote:
> > Hi Greg,
> >
> > there is another patch from me (see subject). I sent it 19/07/2017.
> >
> > Most probably, there is also something wrong with the patch, but maybe you
> > can
> > get it to work.
> >
> > The patch would be important. It doesn't fix any warnings or errors of
> > static
> > code analysis, but it fixes true implementation errors (wrong access of
> > registers).
>
> It does fix some static checker warnings for me... ;) And I've been
> working on making add even more checker complaints inspired by that
> patch but haven't finished.
>
> > From my point of view, that is one of the most important changes to
> > the code, we had during the last weeks.
>
> The patch applies fine so no worries.
>
> Anyway, just send some patches to yourself and try applying them with
> `git am`. That's what everyone is doing on the recieving end.
>
> regards,
> dan carpenter
>
>
>
