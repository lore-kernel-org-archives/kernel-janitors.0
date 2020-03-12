From: Adam Ford <aford173@gmail.com>
Date: Thu, 12 Mar 2020 11:58:31 +0000
Subject: Re: [PATCH] spi: spi-nxp-fspi: Fix a NULL vs IS_ERR() check in probe
Message-Id: <CAHCN7xKSc7spZyq=mySWHDmSrGMkQo8FYRbn-NzYRa7iB-0BoQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113154.GC20562@mwanda>
In-Reply-To: <20200312113154.GC20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Yogesh Gaur <yogeshgaur.83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-spi <linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Mar 12, 2020 at 6:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The platform_get_resource_byname() function returns NULL on error, it
> doesn't return error pointers.
>
> Fixes: d166a73503ef ("spi: fspi: dynamically alloc AHB memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The commit message for commit d166a73503ef ("spi: fspi: dynamically
> alloc AHB memory") is not very good.  Why is it necessary to allocate
> the AHB memory dynamically instead of during probe?  Also I suspect that
> Adam should have recieved authorship credit for that patch.

It wasn't my patch, I just pulled it in from NXP's repo.  The true
author is Han Xu.  When I pulled in the series from NXP, I found the
flexSPI on the i.MX8MM to become functional, and my company has a
board with a qspi flash on it.

adam

>
>  drivers/spi/spi-nxp-fspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 019f40e2917c..1ccda82da206 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -1019,8 +1019,8 @@ static int nxp_fspi_probe(struct platform_device *pdev)
>
>         /* find the resources - controller memory mapped space */
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fspi_mmap");
> -       if (IS_ERR(res)) {
> -               ret = PTR_ERR(res);
> +       if (!res) {
> +               ret = -ENODEV;
>                 goto err_put_ctrl;
>         }
>
> --
> 2.20.1
>
