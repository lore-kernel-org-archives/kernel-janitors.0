From: Tabi Timur-B04825 <B04825@freescale.com>
Date: Mon, 15 Aug 2011 22:55:00 +0000
Subject: Re: [PATCH 8/9] arch/powerpc/sysdev/ehv_pic.c: add missing kfree
Message-Id: <CAOZdJXX_BS7GMtmyqiS91QByhrjANtKpbqrstR8g-L80r_N8qg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312802283-9107-8-git-send-email-julia@diku.dk>
In-Reply-To: <1312802283-9107-8-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kumar Gala <galak@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 8, 2011 at 7:18 AM, Julia Lawall <julia@diku.dk> wrote:

> diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
> index af1a5df..b6731e4 100644
> --- a/arch/powerpc/sysdev/ehv_pic.c
> +++ b/arch/powerpc/sysdev/ehv_pic.c
> @@ -280,6 +280,7 @@ void __init ehv_pic_init(void)
>
> =A0 =A0 =A0 =A0if (!ehv_pic->irqhost) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0of_node_put(np);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(ehv_pic);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}

Although the fix is correct, I think there is another bug in this
function.  'np' is not released when the function finishes
successfully.   I've looked at other functions that use
irq_alloc_host(), and most of them do the same thing: they don't call
of_node_put() on the device node pointer.  The only exception I've
found is mpc5121_ads_cpld_pic_init().

Ben, Kumar: am I missing something?  irq_alloc_host() calls of_node_get():

	host->of_node =3D of_node_get(of_node);

so doesn't that mean that the caller of irq_alloc_host() should
release the device node pointer?

--=20
Timur Tabi
Linux kernel developer at Freescale
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
