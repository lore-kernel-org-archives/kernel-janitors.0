From: Olof Johansson <olof@lixom.net>
Date: Wed, 17 Jun 2020 20:10:25 +0000
Subject: Re: [PATCH] pcmcia/electra_cf: Fix some return values in 'electra_cf_probe()' in case of error
Message-Id: <CAOesGMjC_KttO0T89UbWpnsWsGqWeSnpqJr9JTEn2OtQ=xWtoQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200617195326.732863-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200617195326.732863-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 17, 2020 at 12:54 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'status' is known to be 0 at this point. It must be set to a meaningful
> value in order to return an error code if one of the 'of_get_property()'
> call fails.
>
> Return -EINVAL in such a case.
>
> Fixes: 2b571a066a2f("pcmcia: CompactFlash driver for PA Semi Electra boards")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/pcmcia/electra_cf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
> index 35158cfd9c1a..40a5cffe24a4 100644
> --- a/drivers/pcmcia/electra_cf.c
> +++ b/drivers/pcmcia/electra_cf.c
> @@ -229,6 +229,8 @@ static int electra_cf_probe(struct platform_device *ofdev)
>
>         cf->socket.pci_irq = cf->irq;
>
> +       status = -EINVAL;
> +
>         prop = of_get_property(np, "card-detect-gpio", NULL);
>         if (!prop)
>                 goto fail1;

The pcmcia_register_socket() call site sets status explicitly before
jumping to fail1, which is a bit clearer.

Still, this is a legacy driver, I'm not sure there are any active
users of it these days, and surely nobody that's tinkering around and
editing the device tree (it comes from CFE on these systems, not from
a .dts in the kernel tree). The fix isn't invalid, but it's also not
likely to be an issue in the real world. So, let's just say:

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
