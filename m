From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Date: Thu, 22 Apr 2004 00:36:34 +0000
Subject: [Kernel-janitors] Re: [janitor] use kernel min/max (2/2)
Message-Id: <200404220236.34329.bzolnier@elka.pw.edu.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040316163520.048ce536.rddunlap@osdl.org> <20040421144605.517d5834.rddunlap@osdl.org> <40870462.5070807@gmx.net>
In-Reply-To: <40870462.5070807@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Veeck <michael.veeck@gmx.net>, "Randy.Dunlap" <rddunlap@osdl.org>
Cc: linux-ide@vger.kernel.org, Kernel-janitors@lists.osdl.org

On Thursday 22 of April 2004 01:31, Michael Veeck wrote:
> > Michael hasn't replied on this AFAIK.
>
> Sorry for being quiet, I'm busy right now looking for a new job.

No problem.

> Anyway, IIRC I choose 'long' because of the jiffies.h too, but I'm
> willing to change that back to 'unsigned long'.

I'll revert it for now.

> > | ide-timing.h:
> > | get rid of MIN()/MAX() macros, this should be done very carefully
> > | as they are used for calculating timings
>
> Where's the risk in that? An example would be very helpful.

Well... break something and kiss your data good bye... :-)
(If wrong timings get calculated and programmed)

Thanks,
Bartlomiej

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
