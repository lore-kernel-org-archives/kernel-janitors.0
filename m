From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 29 May 2019 20:53:15 +0000
Subject: Re: [PATCH][next] soc: fsl: fix spelling mistake "Firmaware" -> "Firmware"
Message-Id: <CADRPPNS5EbVrQ_ayvs=s7fYAc4JM1DfNeXwrmCXMvk6HzPouEQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190521085624.13665-1-colin.king@canonical.com>
In-Reply-To: <20190521085624.13665-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>

On Tue, May 21, 2019 at 3:57 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Regards,
Leo
> ---
>  drivers/soc/fsl/dpaa2-console.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/dpaa2-console.c b/drivers/soc/fsl/dpaa2-console.c
> index 9168d8ddc932..27243f706f37 100644
> --- a/drivers/soc/fsl/dpaa2-console.c
> +++ b/drivers/soc/fsl/dpaa2-console.c
> @@ -73,7 +73,7 @@ static u64 get_mc_fw_base_address(void)
>
>         mcfbaregs = ioremap(mc_base_addr.start, resource_size(&mc_base_addr));
>         if (!mcfbaregs) {
> -               pr_err("could not map MC Firmaware Base registers\n");
> +               pr_err("could not map MC Firmware Base registers\n");
>                 return 0;
>         }
>
> --
> 2.20.1
>
