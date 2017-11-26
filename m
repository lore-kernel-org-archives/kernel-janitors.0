From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 26 Nov 2017 18:17:36 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711261912150.2111@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com> <alpine.DEB.2.20.1711260648130.2387@hadrien> <85bdbab8-8b7e-91a9-7199-a0e39041aef1@deltatee.com> <alpine.DEB.2.20.1711261807590.2111@hadrien> <3fc88c02-b9b6-80a3-0c41-63e0806d34aa@deltatee.com>
In-Reply-To: <3fc88c02-b9b6-80a3-0c41-63e0806d34aa@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>



On Sun, 26 Nov 2017, Logan Gunthorpe wrote:

>
>
> On 26/11/17 10:09 AM, Julia Lawall wrote:
> > I don't know.  In any case, a Coccinelle script would get run by the 0-day
> > build testing service, which checks lots of trees.  Perhaps both are
> > useful, since Joe had some conerns about the amount of relevant context
> > available in a patch.
>
> Yup, both could certainly be useful. A coccinelle script would likely be
> able to catch a few false negatives that might pass through the
> checkpatch script. It'll likely have similar difficulties with
> KERN_CONTs though.

Not sure why.  I just assume that a printk that has no KERN_ is adding a
newline, which is my understanding of Joe's comment.

The main limitation that is likely to remain in my script is that
Coccinelle doesn't always understand ifdefs properly.  So
#ifdef
printk("xxx");
#else
printk("yyy");
#endif
pr_cont("zzz");

may give a warning about the first printk.

> Also, I don't really know, but it might be tough enabling a script to
> run on 0-day with the ~6000 potential errors already existing.

0-day only runs on changed files and only reports on changed code, to
the best of my understanding, so I don't think it is a problem.

julia

>
> Logan
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
