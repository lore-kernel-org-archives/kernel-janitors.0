From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 06 Mar 2018 10:03:21 +0000
Subject: Re: [PATCH] ipmi: missing error code in try_smi_init()
Message-Id: <CAK8P3a362Oq-wtaA+RfyE8nRJGx0kh=Ppx+URBc9mYWmW9gSFA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306095803.GA10474@mwanda>
In-Reply-To: <20180306095803.GA10474@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 6, 2018 at 10:58 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If platform_device_alloc() then we should return -ENOMEM instead of
> returning success.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, though I would probably remove that incorrect 'rv = 0' as well
so gcc can catch similar problems in case the function gets changed
again.

> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index f2a294f78892..ff870aa91cfe 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2071,6 +2071,7 @@ static int try_smi_init(struct smi_info *new_smi)
>                                                       new_smi->intf_num);
>                 if (!new_smi->pdev) {
>                         pr_err(PFX "Unable to allocate platform device\n");
> +                       rv = -ENOMEM;
>                         goto out_err;
>                 }
>                 new_smi->io.dev = &new_smi->pdev->dev;
