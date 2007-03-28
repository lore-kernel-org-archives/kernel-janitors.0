From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 28 Mar 2007 12:50:43 +0000
Subject: Re: [KJ] What do "#if 1" and "#if 0" do?
Message-Id: <Pine.LNX.4.64.0703280849230.3574@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e57070790703280024t4df3694cu8babcd12053779eb@mail.gmail.com>
In-Reply-To: <e57070790703280024t4df3694cu8babcd12053779eb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 28 Mar 2007, Yoann Padioleau wrote:

> Matthias Kaehlcke <matthias.kaehlcke@gmail.com> writes:
>
> > El Wed, Mar 28, 2007 at 07:24:35AM +0000 Guanqun Lu ha dit:
> >
> >> I found the webpage:
> >> http://fsdev.net/wiki/index.php?title=If_0_or_if_1_directives
> >> And I'm just wondering what do the two directives do.
> >
> > my interpretation is that they are used for activating (#if 1) and
> > deactivating (#if 0) code.
>
> We often use #if 0 ... #endif for commenting a big region of code.
> One might think that we could also use /* ... */ but if what is in
> the middle contain some C comments, then you can not, because C does
> not handle nested comments.

there's that, and there's also that there are unquestionably
*hundreds* of those "#if 0" tests that have been there for a long time
and lost any value they might have had once.

and let's not even talk about all those "#if 1"s ... :-)

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
