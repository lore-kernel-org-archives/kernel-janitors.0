From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 09 Feb 2009 10:36:33 +0000
Subject: Re: [PATCH] kernel/irq: fix sparse warning: make symbol static
Message-Id: <154e089b0902090236y1e4f382dlddb6815312e51d39@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090208192405.8084.89231.stgit@vmbox.hanneseder.net>
	 <20090208230910.GH31509@parisc-linux.org>
	 <20090209091604.GE31890@elte.hu>
In-Reply-To: <20090209091604.GE31890@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ingo Molnar <mingo@elte.hu>
Cc: Matthew Wilcox <matthew@wil.cx>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 9, 2009 at 10:16 AM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Matthew Wilcox <matthew@wil.cx> wrote:
>
>> On Sun, Feb 08, 2009 at 08:24:47PM +0100, Hannes Eder wrote:
>> > -static inline int do_irq_select_affinity(int irq, struct irq_desc *de=
sc)
>> > +static inline int do_irq_select_affinity(unsigned int irq, struct irq=
_desc *desc)
>>
>> Does this not introduce a checkpatch warning about a line being longer
>> than 80 columns? =A0Three acceptable ways to fix this:
>
> It does - 81 cols. We could ignore it (it's close enough to the limit), b=
ut:

That's why I thought I ignore that warning.

> ----------------->
> From 548c8933801c9ee347b6f1bad2491e4286a4f3a2 Mon Sep 17 00:00:00 2001
> From: Hannes Eder <hannes@hanneseder.net>
> Date: Sun, 8 Feb 2009 20:24:47 +0100
> Subject: [PATCH] kernel/irq: fix sparse warning: make symbol static
>
> While being at it make every occurrence of 'do_irq_select_affinity'
> have the same signature in terms of signedness of the first argument.
>
> Fix this sparse warning:
> =A0kernel/irq/manage.c:112:5: warning: symbol 'do_irq_select_affinity' wa=
s not declared. Should it be static?
>
> Also rename do_irq_select_affinity() to setup_affinity() - shorter name
> and clearer naming.
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Matthew Wilcox <matthew@wil.cx>
> Signed-off-by: Ingo Molnar <mingo@elte.hu>
> ---
> =A0kernel/irq/manage.c | =A0 10 +++++-----
> =A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index 291f036..38008b8 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -109,7 +109,7 @@ int irq_set_affinity(unsigned int irq, const struct c=
pumask *cpumask)
> =A0/*
> =A0* Generic version of the affinity autoselector.
> =A0*/
> -int do_irq_select_affinity(unsigned int irq, struct irq_desc *desc)
> +static int setup_affinity(unsigned int irq, struct irq_desc *desc)
> =A0{
> =A0 =A0 =A0 =A0if (!irq_can_set_affinity(irq))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> @@ -133,7 +133,7 @@ set_affinity:
> =A0 =A0 =A0 =A0return 0;
> =A0}
> =A0#else
> -static inline int do_irq_select_affinity(unsigned int irq, struct irq_de=
sc *d)
> +static inline int setup_affinity(unsigned int irq, struct irq_desc *d)

using the following would even be more homogenous:

-static inline int do_irq_select_affinity(unsigned int irq, struct irq_desc=
 *d)
+static inline int setup_affinity(unsigned int irq, struct irq_desc *desc)


> =A0{
> =A0 =A0 =A0 =A0return irq_select_affinity(irq);
> =A0}
> @@ -149,14 +149,14 @@ int irq_select_affinity_usr(unsigned int irq)
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0spin_lock_irqsave(&desc->lock, flags);
> - =A0 =A0 =A0 ret =3D do_irq_select_affinity(irq, desc);
> + =A0 =A0 =A0 ret =3D setup_affinity(irq, desc);
> =A0 =A0 =A0 =A0spin_unlock_irqrestore(&desc->lock, flags);
>
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
> =A0#else
> -static inline int do_irq_select_affinity(int irq, struct irq_desc *desc)
> +static inline int setup_affinity(unsigned int irq, struct irq_desc *desc)
> =A0{
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -488,7 +488,7 @@ __setup_irq(unsigned int irq, struct irq_desc * desc,=
 struct irqaction *new)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0desc->status |=3D IRQ_NO_B=
ALANCING;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set default affinity mask once everythi=
ng is setup */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 do_irq_select_affinity(irq, desc);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_affinity(irq, desc);
>
> =A0 =A0 =A0 =A0} else if ((new->flags & IRQF_TRIGGER_MASK)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&& (new->flags & IRQF_TRIG=
GER_MASK)
>

Thank you.

-Hannes
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
