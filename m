From: "Luis R. Rodriguez" <mcgrof@gmail.com>
Date: Mon, 12 Jul 2010 17:06:55 +0000
Subject: Re: [patch] prism54: call BUG_ON() earlier
Message-Id: <AANLkTikJ9Ae2HRIwdcc8oVgAc2zoVHUL7ZY9k2QO2QpS@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710085338.GQ19184@bicker>
In-Reply-To: <20100710085338.GQ19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, =?UTF-8?Q?Andr=C3=A9_Goddard_Rosa?= <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 10, 2010 at 1:53 AM, Dan Carpenter <error27@gmail.com> wrote:
> This test is off by one because strlen() doesn't include the NULL
> terminator.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/net/wireless/prism54/isl_ioctl.c b/drivers/net/wireless/prism54/isl_ioctl.c
> index 8d1190c..1051268 100644
> --- a/drivers/net/wireless/prism54/isl_ioctl.c
> +++ b/drivers/net/wireless/prism54/isl_ioctl.c
> @@ -2067,7 +2067,7 @@ send_simple_event(islpci_private *priv, const char *str)
>        memptr = kmalloc(IW_CUSTOM_MAX, GFP_KERNEL);
>        if (!memptr)
>                return;
> -       BUG_ON(n > IW_CUSTOM_MAX);
> +       BUG_ON(n >= IW_CUSTOM_MAX);
>        wrqu.data.pointer = memptr;
>        wrqu.data.length = n;
>        strcpy(memptr, str);
>

send_simple_event() never passes a NULL terminated string though. What
does this fix today? If nothing then better leave as-is.

  Luis
