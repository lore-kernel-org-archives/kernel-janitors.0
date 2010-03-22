From: =?ISO-8859-1?Q?Richard_R=F6jfors?= <richard.rojfors@pelagicore.com>
Date: Mon, 22 Mar 2010 12:37:54 +0000
Subject: Re: [patch] mfd: off by one calculating size
Message-Id: <4BA764A2.6080400@pelagicore.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322121242.GL21571@bicker>
In-Reply-To: <20100322121242.GL21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/22/2010 01:12 PM, Dan Carpenter wrote:
> I'm pretty sure that it should be + 1 here.  It's an off by one, because
> we start counting at zero.

You are completely right, fortunately we don't access the last register.

> Signed-off-by: Dan Carpenter<error27@gmail.com>

Acked-by: Richard R=F6jfors <richard.rojfors@pelagicore.com>

> ---
> Found by a static checker and untested.  Please review carefully.
>
> diff --git a/drivers/mfd/timberdale.h b/drivers/mfd/timberdale.h
> index 8d27ffa..902c451 100644
> --- a/drivers/mfd/timberdale.h
> +++ b/drivers/mfd/timberdale.h
> @@ -66,7 +66,7 @@
>
>   #define CHIPCTLOFFSET	0x800
>   #define CHIPCTLEND	0x8ff
> -#define CHIPCTLSIZE	(CHIPCTLEND - CHIPCTLOFFSET)
> +#define CHIPCTLSIZE	(CHIPCTLEND - CHIPCTLOFFSET + 1)
>
>   #define INTCOFFSET	0xc00
>   #define INTCEND		0xfff
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
