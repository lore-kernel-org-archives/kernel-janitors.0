From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 09 Feb 2007 12:39:58 +0000
Subject: Re: [KJ] anyone interested in the "power of 2" stuff?
Message-Id: <Pine.LNX.4.64.0702090736480.11908@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081713530.5222@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 9 Feb 2007, Vignesh Babu BM wrote:

>
> On Thu, 2007-02-08 at 17:17 -0500, Robert P. J. Day wrote:
>
> > http://fsdev.net/wiki/index.php?title=Power_of_2_stuff
> >
> >   any takers?
> >
> > rday
> >
>
> I would take that up rday.

ok, have at it, and keep us up to date on the wiki page.

rday

p.s.  note that we still haven't formalized the rounding stuff so, as
i mention in the wiki page, the only changes should involve *just*
strict power of 2 testing, and not as part of a larger bit of code
that's trying to round, or anything like that.

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
