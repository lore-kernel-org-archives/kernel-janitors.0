From: Corey Minyard <minyard@acm.org>
Date: Wed, 06 Jun 2018 14:05:55 +0000
Subject: Re: [PATCH] ipmi_si: fix potential integer overflow on large shift
Message-Id: <83676bc2-3e07-8516-5c9a-5b089305790d@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180605165108.26379-1-colin.king@canonical.com>
In-Reply-To: <20180605165108.26379-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 06/05/2018 11:51 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Shifting unsigned char b by an int type can lead to sign-extension
> overflow. For example, if b is 0xff and the shift is 24, then top
> bit is sign-extended so the final value passed to writeq has all
> the upper 32 bits set.  Fix this by casting b to a 64 bit unsigned
> before the shift.

Queued for next release.=C2=A0 Thanks.

-corey

> Detected by CoverityScan, CID#1465246 ("Unintended sign extension")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/char/ipmi/ipmi_si_mem_io.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/ipmi_si_mem_io.c b/drivers/char/ipmi/ipmi_=
si_mem_io.c
> index 1b869d530884..fd0ec8d6bf0e 100644
> --- a/drivers/char/ipmi/ipmi_si_mem_io.c
> +++ b/drivers/char/ipmi/ipmi_si_mem_io.c
> @@ -51,7 +51,7 @@ static unsigned char mem_inq(const struct si_sm_io *io,=
 unsigned int offset)
>   static void mem_outq(const struct si_sm_io *io, unsigned int offset,
>   		     unsigned char b)
>   {
> -	writeq(b << io->regshift, (io->addr)+(offset * io->regspacing));
> +	writeq((u64)b << io->regshift, (io->addr)+(offset * io->regspacing));
>   }
>   #endif
>  =20


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
