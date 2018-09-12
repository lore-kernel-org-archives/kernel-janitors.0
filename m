From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Wed, 12 Sep 2018 11:11:39 +0000
Subject: Re: [PATCH] s390/tape: fix spelling mistake "partion" -> "partition"
Message-Id: <20180912131139.4402f76e@mschwideX1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180911081858.27297-1-colin.king@canonical.com>
In-Reply-To: <20180911081858.27297-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 11 Sep 2018 09:18:58 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/s390/char/tape_3590.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/s390/char/tape_3590.c b/drivers/s390/char/tape_3590.c
> index cdcde18e7220..4554cdf4d6bd 100644
> --- a/drivers/s390/char/tape_3590.c
> +++ b/drivers/s390/char/tape_3590.c
> @@ -971,7 +971,7 @@ tape_3590_print_mim_msg_f0(struct tape_device *device, struct irb *irb)
>  		snprintf(exception, BUFSIZE, "Data degraded");
>  		break;
>  	case 0x03:
> -		snprintf(exception, BUFSIZE, "Data degraded in partion %i",
> +		snprintf(exception, BUFSIZE, "Data degraded in partition %i",
>  			sense->fmt.f70.mp);
>  		break;
>  	case 0x04:

Applied to linux-s390:features. Thanks.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
