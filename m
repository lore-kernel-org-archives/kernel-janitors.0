From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Thu, 05 Dec 2019 08:06:11 +0000
Subject: Re: [PATCH] media: meson: add missing allocation failure check on new_buf
Message-Id: <20191205080611.GY93017@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204141159.1432387-1-colin.king@canonical.com>
In-Reply-To: <20191204141159.1432387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devel@driverdev.osuosl.org, Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

On (19/12/04 14:11), Colin King wrote:
[..]
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 0a1a04fd5d13..8dd1396909d7 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -133,6 +133,8 @@ vdec_queue_recycle(struct amvdec_session *sess, struct vb2_buffer *vb)
>  	struct amvdec_buffer *new_buf;
>
>  	new_buf = kmalloc(sizeof(*new_buf), GFP_KERNEL);
> +	if (!new_buf)
> +		return;
>  	new_buf->vb = vb;

So the buffer is not getting recycled? IOW is leaked?

	-ss
