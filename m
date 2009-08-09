From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Date: Sun, 09 Aug 2009 09:24:21 +0000
Subject: Re: [Linux-fbdev-devel] [PATCH 3/3] drivers/video: Correct use of
Message-Id: <10f740e80908090224p13d2119do9e4f4d7730ed001e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908090943560.13271@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908090943560.13271@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org

On Sun, Aug 9, 2009 at 09:44, Julia Lawall<julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> request_region should be used with release_region, not request_mem_region.
>
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r1@
> expression start;
> @@
>
> request_region(start,...)
>
> @b1@
> expression r1.start;
> @@
>
> request_mem_region(start,...)
>
> @depends on !b1@
> expression r1.start;
> expression E;
> @@
>
> - release_mem_region
> + release_region
>  (start,E)
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
>  drivers/video/gbefb.c  |    4 ++--
>  drivers/video/tdfxfb.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff -u -p a/drivers/video/gbefb.c b/drivers/video/gbefb.c
> --- a/drivers/video/gbefb.c
> +++ b/drivers/video/gbefb.c
> @@ -1246,7 +1246,7 @@ out_tiles_free:
>  out_unmap:
>        iounmap(gbe);
>  out_release_mem_region:
> -       release_mem_region(GBE_BASE, sizeof(struct sgi_gbe));
> +       release_region(GBE_BASE, sizeof(struct sgi_gbe));

GBE_BASE seems to be MMIO (it's mapped using ioremap()), so it looks like the
release_mem_region() is actually correct, while the request_region() should be
request_mem_region() instead

>  out_release_framebuffer:
>        framebuffer_release(info);
>
> @@ -1265,7 +1265,7 @@ static int __devexit gbefb_remove(struct
>                iounmap(gbe_mem);
>        dma_free_coherent(NULL, GBE_TLB_SIZE * sizeof(uint16_t),
>                          (void *)gbe_tiles.cpu, gbe_tiles.dma);
> -       release_mem_region(GBE_BASE, sizeof(struct sgi_gbe));
> +       release_region(GBE_BASE, sizeof(struct sgi_gbe));

Ditto.

> diff -u -p a/drivers/video/tdfxfb.c b/drivers/video/tdfxfb.c
> --- a/drivers/video/tdfxfb.c
> +++ b/drivers/video/tdfxfb.c
> @@ -1571,8 +1571,8 @@ out_err_iobase:
>        if (default_par->mtrr_handle >= 0)
>                mtrr_del(default_par->mtrr_handle, info->fix.smem_start,
>                         info->fix.smem_len);
> -       release_mem_region(pci_resource_start(pdev, 2),
> -                          pci_resource_len(pdev, 2));
> +       release_region(pci_resource_start(pdev, 2),
> +                      pci_resource_len(pdev, 2));
>  out_err_screenbase:
>        if (info->screen_base)
>                iounmap(info->screen_base);

This one looks OK.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
