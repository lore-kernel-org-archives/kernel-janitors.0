From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Oct 2016 09:27:30 +0000
Subject: Re: FRV-setup: Clarification for "source code clean-up"?
Message-Id: <20161021092730.GJ4418@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
 <81f557b2-40f3-0625-331d-c5b115f1971c@users.sourceforge.net>
 <alpine.LNX.2.00.1610210923330.31629@cbobk.fhfr.pm>
 <20161021075142.GS4469@mwanda>
 <139f8031-4823-8de4-1a79-0af80f82cd89@users.sourceforge.net>
In-Reply-To: <139f8031-4823-8de4-1a79-0af80f82cd89@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Jiri Kosina <jikos@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 21, 2016 at 11:11:54AM +0200, SF Markus Elfring wrote:
> > It's all about ratios...  Each clean up patch has chance of introducing
> > a bug.
> 
> Each update suggestion contains a possibility for mistakes.
> 

Yes.  But bug fix patches make up for it by fixing stuff.

> 
> > If you only send clean up patches then you only introduce bugs.
> 
> I find such a conclusion questionable with the wording "only".
> 

How are you going to fix bugs if you only send clean ups?

> 
> > We really don't want people sending patches if they introduce more bugs
> > than they fix.
> 
> How do you think about to discuss corresponding software development
> statistics in more detail?

I think normal developers should fix 10 bugs or add a few features for
every regression they introduce.  I introduced a regression just last
week, so that's a normal part of life, but I was at least *trying* to
fix a bug when I did it.

regards,
dan carpenter

