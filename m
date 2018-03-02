From: Corey Minyard <minyard@acm.org>
Date: Fri, 02 Mar 2018 14:39:28 +0000
Subject: Re: [PATCH] ipmi: use ARRAY_SIZE for poweroff_functions array sizing calculation
Message-Id: <73ab71b3-a2dd-1aa9-4c4c-57b761c6cdab@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180302141451.656-1-colin.king@canonical.com>
In-Reply-To: <20180302141451.656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/02/2018 08:14 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Use the ARRAY_SIZE macro on a array poweroff_functions to determine
> size of the array. Improvement suggested by Coccinelle.

Queued for next release.=C2=A0 Thanks!

-corey

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/char/ipmi/ipmi_poweroff.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_p=
oweroff.c
> index 07fa366bc8f0..fccb1e9fd3b7 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -519,8 +519,7 @@ static struct poweroff_function poweroff_functions[] =
=3D {
>   	  .detect		=3D ipmi_chassis_detect,
>   	  .poweroff_func	=3D ipmi_poweroff_chassis },
>   };
> -#define NUM_PO_FUNCS (sizeof(poweroff_functions) \
> -		      / sizeof(struct poweroff_function))
> +#define NUM_PO_FUNCS ARRAY_SIZE(poweroff_functions)
>  =20
>  =20
>   /* Called on a powerdown request. */


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
