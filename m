From: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed, 22 Jul 2020 13:16:31 +0000
Subject: Re: [PATCH][next][V2] media: allegro: fix potential null dereference on header
Message-Id: <20200722131631.GA18419@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722130903.818041-1-colin.king@canonical.com>
In-Reply-To: <20200722130903.818041-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

On Wed, 22 Jul 2020 14:09:03 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer header is an alias to msg and msg is being null checked.
> However, if msg is null then header is also null and this can lead to
> a null pointer dereference on the assignment type = header->type. Fix
> this just using header->type after the null check and removing the need
> for type as it is only used once.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 3de16839669f ("media: allegro: add explicit mail encoding and decoding")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> 
> V2: remove need for variable type, as suggested by Michael Tretter
> 
> ---
>  drivers/staging/media/allegro-dvt/allegro-mail.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
> index 4ac65de12463..9286d2162377 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-mail.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
> @@ -462,13 +462,12 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
>  ssize_t allegro_encode_mail(u32 *dst, void *msg)
>  {
>  	const struct mcu_msg_header *header = msg;
> -	enum mcu_msg_type type = header->type;
>  	ssize_t size;
>  
>  	if (!msg || !dst)
>  		return -EINVAL;
>  
> -	switch (type) {
> +	switch (header->type) {
>  	case MCU_MSG_TYPE_INIT:
>  		size = allegro_enc_init(&dst[1], msg);
>  		break;
> -- 
> 2.27.0
> 
> 
