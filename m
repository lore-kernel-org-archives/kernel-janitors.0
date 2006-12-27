From: "Badai Aqrandista" <badaiaqrandista@gmail.com>
Date: Wed, 27 Dec 2006 23:29:31 +0000
Subject: Re: [KJ] [PATCH for review] Changed DPRINTK to pr_debug
Message-Id: <4b4be04a0612271529g76a13035uf03e3f6efd6d56e3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b4be04a0612251633j4b86e7efqaa5e7742a542f64b@mail.gmail.com>
In-Reply-To: <4b4be04a0612251633j4b86e7efqaa5e7742a542f64b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jim,

> Plus, a lot of driver authors choose not to have their debug printk's tied into a global flag - you could change this
> whole patch to:
>
>
> +#undef DEBUG           /* define to enable debugging output and checks */
> -#undef VIA_DEBUG       /* define to enable debugging output and checks */
> -#ifdef VIA_DEBUG
> -/* note: prints function name for you */
> -#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __FUNCTION__ , ## args)
> +#define DPRINTK(fmt, args...) pr_debug("via82cxxx: %s(): ", fmt, __FUNCTION__, ## args)
> -#else
> -#define DPRINTK(fmt, args...)
> -#endif

Hmm... interesting... so that means keeping the DPRINTK macros and
implement them with pr_debug? So this kernel janitor's TODO point
doesn't literally mean remove all DPRINTK macros and use pr_debug
instead?

And how can I solve the problem where the device maintainer choose not
to have their debug flag linked to the global one? I'll post another
patch shortly.

> P. S. - your mail client mangled the patch - I use sendpatchset.py (http://www.speakeasy.org/~pj99/sgi/sendpatchset) to
> submit patches, and the latest version is designed to play nice with gmail...

Thanks...

PS: I'd appreciate if you can suggest a more important TODO item, if
there's any.

-- 
Thanks,
Badai Aqrandista (cheepy)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
