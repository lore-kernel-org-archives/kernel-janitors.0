From: john stultz <johnstul@us.ibm.com>
Date: Tue, 24 Jan 2012 00:39:50 +0000
Subject: Re: [PATCH 13/15] drivers/clocksource/cyclone.c: add missing iounmap
Message-Id: <1327365590.11738.3.camel@work-vm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326362117-29371-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

On Thu, 2012-01-12 at 10:55 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Add missing iounmap in error handling code, in a case where the function
> already preforms iounmap on some other execution path.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e;
> statement S,S1;
> int ret;
> @@
> e = \(ioremap\|ioremap_nocache\)(...)
> ... when != iounmap(e)
> if (<+...e...+>) S
> ... when any
>     when != iounmap(e)
> *if (...)
>    { ... when != iounmap(e)
>      return ...; }
> ... when any
> iounmap(e);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Looks good. I've just queued it.
Thanks for sending this in!
-john


