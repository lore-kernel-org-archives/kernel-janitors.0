From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 28 Sep 2015 12:42:58 +0000
Subject: Re: [Cocci] [PATCH v2] coccinelle: assign signed result to unsigned variable
Message-Id: <alpine.DEB.2.10.1509281440320.3108@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1509261106040.2737@hadrien>
 <1443437687-16559-1-git-send-email-a.hajda@samsung.com>
 <56092D7B.4030106@users.sourceforge.net> <56092E98.9000103@samsung.com>
 <560930A7.2070400@users.sourceforge.net>
In-Reply-To: <560930A7.2070400@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Mon, 28 Sep 2015, SF Markus Elfring wrote:

> >> How do you think about the reuse of the parameter "--recursive-includes" here?
> >
> > Last time I have tried it, kernel source check took more than 10 hours,
> > so I gave up.
>
> This is interesting background information.
>
> There are opportunities for more fine-tuning of such a source code analysis,
> aren't there?

I guess parallelism would be helpful?  You could try the following
options:

-j n --chunksize 10 --recursive-includes --include-headers-for-types

where n is the number of cores that you want to use.  Parsed header files
will be cached within chunks.  I don't really know what is the best
chunksize.

julia


>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
