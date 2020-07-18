From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 18 Jul 2020 06:45:51 +0000
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
In-Reply-To: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Sat, 18 Jul 2020, Markus Elfring wrote:

> > Applied.
>
> Do you care for patch review concerns according to this SmPL script adjustment?
>
> * https://lore.kernel.org/cocci/5c0dae88-e172-3ba6-f86c-d1a6238bb4c4@web.de/
>   https://lkml.org/lkml/2020/6/9/568

This one it complete nonsense.

>
> * https://lore.kernel.org/cocci/c3464cad-e567-9ef5-b4e3-a01e3b11120b@web.de/
>   https://lkml.org/lkml/2020/6/8/637

This on is indeed a problem.  I think it was not detected in testing,
because in the current kernel the rule never applies.  But Denis, in

-  to = \(kmalloc\|kzalloc\)
                (size,\(GFP_KERNEL\|GFP_USER\|
                      \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));

you do indeed need to put - in front of the second and third lines as
well.

Markus, if you would limit your comments to suggesting SmPL code that is
actually correct, ie that you have tested, and 2) stop suggesting stupid
things over and over like that putting all of the virtual declarations on
the same line would save space (it does, but who cares), then I would take
your suggestions more seriously.

julia

> Regards,
> Markus
>
