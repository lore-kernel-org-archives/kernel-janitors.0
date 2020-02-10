From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Feb 2020 14:41:11 +0000
Subject: Re: [PATCH] media: tda10071: fix unsigned sign extension overflow
Message-Id: <20200210144110.GA1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200210142646.431957-1-colin.king@canonical.com>
In-Reply-To: <20200210142646.431957-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 10, 2020 at 02:26:46PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of buf[3] by 24 bits to the left will be promoted to
> a 32 bit signed int and then sign-extended to an unsigned long. In
> the unlikely event that the the top bit of buf[3] is set then all
> then all the upper bits end up as also being set because of
> the sign-extension and this affect the ev->post_bit_error sum.
> Fix this by using the temporary u32 variable bit_error to avoid
> the sign-extension promotion. This also removes the need to do the
> computation twice.
> 
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: 267897a4708f ("[media] tda10071: implement DVBv5 statistics")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/dvb-frontends/tda10071.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
> index 1953b00b3e48..685c0ac71819 100644
> --- a/drivers/media/dvb-frontends/tda10071.c
> +++ b/drivers/media/dvb-frontends/tda10071.c
> @@ -470,10 +470,11 @@ static int tda10071_read_status(struct dvb_frontend *fe, enum fe_status *status)
>  			goto error;
>  
>  		if (dev->delivery_system = SYS_DVBS) {
> -			dev->dvbv3_ber = buf[0] << 24 | buf[1] << 16 |
> -					 buf[2] << 8 | buf[3] << 0;
> -			dev->post_bit_error += buf[0] << 24 | buf[1] << 16 |
> -					       buf[2] << 8 | buf[3] << 0;
> +			u32 bit_error = buf[0] << 24 | buf[1] << 16 |
> +					buf[2] << 8 | buf[3] << 0;

This driver has a bunch of endian conversions (probably from big endian
to little endian) and so it's probably buggy on big endian CPUs.

regards,
dan carpenter
