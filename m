From: Stefan Wahren <stefan.wahren@i2se.com>
Date: Mon, 31 Jul 2017 05:55:16 +0000
Subject: Re: [PATCH 12/12] mmc: bcm2835: constify mmc_host_ops structures
Message-Id: <0beb2ef0-0a2d-5289-2956-af106d092cf6@i2se.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501307981-29745-1-git-send-email-Julia.Lawall@lip6.fr>
 <1501307981-29745-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501307981-29745-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Am 29.07.2017 um 07:59 schrieb Julia Lawall:
> The mmc_host_ops structure is only stored in the ops field of an
> mmc_host structure, which is declared as const.  Thus the mmc_host_ops
> structure itself can be const.
>
> Done with the help of Coccinelle.
>
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct mmc_host_ops i@p = { ... };
>
> @ok1@
> struct mmc_host *mmc;
> identifier r.i;
> position p;
> @@
> mmc->ops = &i@p
>
> @bad@
> position p != {r.p,ok1.p};
> identifier r.i;
> struct mmc_host_ops e;
> @@
> e@i@p
>
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct mmc_host_ops i = { ... };
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
