From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Dec 2017 20:36:51 +0000
Subject: Re: tps65090-charger: Delete an error message for a failed memory allocation in two functions
Message-Id: <alpine.DEB.2.20.1712162135140.17082@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <aa138aa9-d8c9-c6e3-7071-9fc642e7b248@users.sourceforge.net> <1513450432.4647.47.camel@perches.com> <4beb0d2e-adf6-5eeb-43c7-7829d54c6656@users.sourceforge.net>
In-Reply-To: <4beb0d2e-adf6-5eeb-43c7-7829d54c6656@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Joe Perches <joe@perches.com>, linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Sat, 16 Dec 2017, SF Markus Elfring wrote:

> >> Omit an extra message for a memory allocation failure in these functions.
> >
> > Because???
> >
> > Fix your commit message.
> >
> > Say _WHY_ should this be applied.
>
> I am still waiting for possibilities to improve also the corresponding
> reference documentation somehow as you know it already.

If you require someone else to update the documentation to be able to
explain why the patch is useful, then it would seem that you do not know
why the patch is useful, and thus should not submit it.

julia


>
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
