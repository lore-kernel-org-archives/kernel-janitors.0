From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Fri, 27 Feb 2015 00:36:53 +0000
Subject: Re: [patch] ALSA: oxfw: fix a condition in start_stream()
Message-Id: <54EFBC25.9020002@sakamocchi.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150226203202.GC6820@mwanda>
In-Reply-To: <20150226203202.GC6820@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Feb 27 2015 05:32, Dan Carpenter wrote:
> Static checkers complain that this function doesn't return negative
> error codes.  The comments for amdtp_stream_wait_callback() say that we
> should stop the stream if it returns false.
> 
> Fixes: f3699e2c7745 ('ALSA: oxfw: Change the way to start stream')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for this patch, while the error code should be assigned to
-ETIMEDOUT, as the other drivers do.

I post an alternative patch to fix them.


Thanks

Takashi Sakamoto

> diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
> index 29ccb36..ee67581 100644
> --- a/sound/firewire/oxfw/oxfw-stream.c
> +++ b/sound/firewire/oxfw/oxfw-stream.c
> @@ -172,7 +172,7 @@ static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream,
>  
>  	/* Wait first packet */
>  	err = amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT);
> -	if (err < 0)
> +	if (err = 0)
>  		stop_stream(oxfw, stream);
>  end:
>  	return err;
