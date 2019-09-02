From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 02 Sep 2019 15:12:07 +0000
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix condition in charge_threshold_store()
Message-Id: <CAHp75Vf=8L8fk0a=9auX5RboF8yCnfmz3JH9OGT7yAV3ZX1ybw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190902143850.GA607@mwanda>
In-Reply-To: <20190902143850.GA607@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 2, 2019 at 5:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This error handling is reversed so we return early.
>

I will squash to the original commit since it's not yet upstream.

Are you okay with this?

> Fixes: 84d8e80b0a36 ("platform/x86: asus-wmi: Refactor charge_threshold_store()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 14467748b343..848b23764fc3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2068,7 +2068,7 @@ static ssize_t charge_threshold_store(struct device *dev,
>                 return -EINVAL;
>
>         ret = asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, value, &rv);
> -       if (!ret)
> +       if (ret)
>                 return ret;
>
>         if (rv != 1)
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
