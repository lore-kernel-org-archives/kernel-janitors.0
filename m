From: Corentin Chary <corentin.chary@gmail.com>
Date: Thu, 15 Mar 2012 08:14:42 +0000
Subject: Re: [patch] samsung-laptop: cleanup return type: mode_t vs umode_t
Message-Id: <CAHR064i9nWy+qagj9bcAR8h_HUTcVWBMWavWaz0BCmha=XzqTg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120315071020.GA3567@elgon.mountain>
In-Reply-To: <20120315071020.GA3567@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Mar 15, 2012 at 8:10 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This function returns a umode_t (unsigned short) instead of mode_t which
> is an unsigned int on some architectures.  Cleaning this up silences a
> compile warning:
>
> drivers/platform/x86/samsung-laptop.c:1108:2: warning: initialization
>        from incompatible pointer type [enabled by default]
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index 7d7109f..0550bc5 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1086,7 +1086,7 @@ static int __init samsung_backlight_init(struct samsung_laptop *samsung)
>        return 0;
>  }
>
> -static mode_t samsung_sysfs_is_visible(struct kobject *kobj,
> +static umode_t samsung_sysfs_is_visible(struct kobject *kobj,
>                                       struct attribute *attr, int idx)
>  {
>        struct device *dev = container_of(kobj, struct device, kobj);

Thanks for the patch.

Acked-by: Corentin Chary <corentincj@iksaif.net>

Matthew, could you grab that one too ?
Thanks,


-- 
Corentin Chary
http://xf.iksaif.net
