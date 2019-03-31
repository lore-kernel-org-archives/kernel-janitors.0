From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 31 Mar 2019 04:03:59 +0000
Subject: Re: [PATCH v2] irqchip/irq-ls1x: Missing error code in ls1x_intc_of_init()
Message-Id: <10aca36f-bb1c-0eae-76ab-e4d47632f02c@flygoat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190329062136.GQ32613@kadam>
In-Reply-To: <20190329062136.GQ32613@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mukesh Ojha <mojha@codeaurora.org>

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

--

Jiaxun Yang

=D4=DA 2019/3/29 14:21, Dan Carpenter =D0=B4=B5=C0:
> Currently, when irq_domain_add_linear() fails, the error code does not
> get so it returns zero which is wrong.  Fix it by setting appropriate
> error code.
>
> Fixes: 9e543e22e204 ("irqchip: Add driver for Loongson-1 interrupt contro=
ller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
> ---
> V2: Improve the commit message
>
>   drivers/irqchip/irq-ls1x.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
> index 86b72fbd3b45..353111a10413 100644
> --- a/drivers/irqchip/irq-ls1x.c
> +++ b/drivers/irqchip/irq-ls1x.c
> @@ -130,6 +130,7 @@ static int __init ls1x_intc_of_init(struct device_nod=
e *node,
>   					     NULL);
>   	if (!priv->domain) {
>   		pr_err("ls1x-irq: cannot add IRQ domain\n");
> +		err =3D -ENOMEM;
>   		goto out_iounmap;
>   	}
>  =20
