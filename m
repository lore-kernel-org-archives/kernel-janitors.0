From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Mon, 05 Feb 2007 23:41:30 +0000
Subject: Re: [KJ] so ... when are all the pending patches unleashed?
Message-Id: <9a8748490702051541g37d34ef9m74d633608f172a3f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702050203150.8027@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/02/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> On Mon, 5 Feb 2007, Randy Dunlap wrote:
>
> > On Mon, 5 Feb 2007 12:21:26 -0500 (EST) Robert P. J. Day wrote:
> >
> > > On Mon, 5 Feb 2007, Randy Dunlap wrote:
> > >
> > > > And lastly, the schedule for everyone to send non-bug-fixes is
> > > > "within 2 weeks of the 2.6.20 announcement" AFAIK.
> > >
> > > that's what i'd heard.  so what this means is that, now that
> > > 2.6.20 is out, there's a 2-week window to try to ram in all of the
> > > non-bugfix related cleanup that we've discussing to get it into
> > > 2.6.21, is that right?
> >
> > Yes, and it won't all go in at one time.  Having it spread out makes
> > bug detection more feasible.
>
> among other things i was wondering is why nothing seems to have gone
> into linus' tree since 2.6.20 was officially released.
>
> typically, i build my patches against the latest "git pull", and i
> would have thought that, once 2.6.20 was tagged, that git repo would
> open and start to pull the next set of patches on its way to 2.6.21.
> but, as of one day later, that tree hasn't changed at all.
>
> is there some reason it's unchanged since yesterday?  i'm just trying
> to get a feel both for the patch flow and the timing.
>

Probably a case of (or rather, a combination of)

 - Linus being too busy with other stuff to pull patches.
 - People not asking Linus to pull.
 - People not resending their patches.
 - kernel.org servers being slow to mirror out changes.
 - The phase of the moon being wrong ;)


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
