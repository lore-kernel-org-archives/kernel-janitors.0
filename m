From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 11 Oct 2010 11:59:45 +0000
Subject: Re: [patch 2/2] OSS: soundcard: fix return value of sound_open()
Message-Id: <s5hr5fxgcsu.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101010173422.GC5851@bicker>
In-Reply-To: <20101010173422.GC5851@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Sun, 10 Oct 2010 19:34:22 +0200,
Dan Carpenter wrote:
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.  Thanks.


Takashi


> diff --git a/sound/oss/soundcard.c b/sound/oss/soundcard.c
> index a5ab61e..46c0d03 100644
> --- a/sound/oss/soundcard.c
> +++ b/sound/oss/soundcard.c
> @@ -249,7 +249,7 @@ static int sound_open(struct inode *inode, struct file *file)
>  	}
>  
>  	mutex_unlock(&soundcard_mutex);
> -	return 0;
> +	return retval;
>  }
>  
>  static int sound_release(struct inode *inode, struct file *file)
> 
