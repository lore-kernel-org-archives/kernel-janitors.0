From: "Chas Williams (CONTRACTOR)" <chas@cmf.nrl.navy.mil>
Date: Fri, 18 Apr 2008 14:55:45 +0000
Subject: Re: [PATCH] Removal of debug code containing deprecated calls to cli()/sti()
Message-Id: <200804181455.m3IEtje2032231@cmf.nrl.navy.mil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1208530262-8555-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1208530262-8555-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, asselsm@gmail.com

In message <1208530262-8555-1-git-send-email-mark.asselstine@windriver.com>,Mar
k Asselstine writes:
>-#else /* !NS_DEBUG_SPINLOCKS */
> #define ns_grab_int_lock(card,flags) \
>         spin_lock_irqsave(&(card)->int_lock,(flags))
> #define ns_grab_res_lock(card,flags) \
>         spin_lock_irqsave(&(card)->res_lock,(flags))
> #define ns_grab_scq_lock(card,scq,flags) \
>         spin_lock_irqsave(&(scq)->lock,flags)
>-#endif /* NS_DEBUG_SPINLOCKS */

this patch should probably go one step farther and just remove these
spin_lock wrappers as well.  most people consider this bad form.
