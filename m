From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Mon, 25 Jan 2021 13:45:38 +0000
Subject: Re: [PATCH v2 2/2] ALSA: fireface: remove unnecessary condition in hwdep_read()
Message-Id: <20210125134538.GA24062@workstation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210122071354.GI20820@kadam>
 <YA6n6I8EcNAO5ZFs@mwanda>
In-Reply-To: <YA6n6I8EcNAO5ZFs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Hi,

On Mon, Jan 25, 2021 at 02:13:44PM +0300, Dan Carpenter wrote:
> Smatch complains that "count" is not clamped when "ff->dev_lock_changed"
> and it leads to an information leak.  Fortunately, that's not actually
> possible and the condition can be deleted.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: just delet the condition
> 
>  sound/firewire/fireface/ff-hwdep.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

ALSA firewire stack includes some drivers. Although some of them implement
unique event as well as the lock event, the others supports the lock
event only. The condition statement comes from the former, I guess.
ALSA BeBoB, OXFW, and Fireface drivers are the latter. Later I'll post
the similar patch for ALSA BeBoB driver.

Anyway, thank you to find the issue ;)

> diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
> index 4b2e0dff5ddb..ea64a2a41eea 100644
> --- a/sound/firewire/fireface/ff-hwdep.c
> +++ b/sound/firewire/fireface/ff-hwdep.c
> @@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>  	}
>  
>  	memset(&event, 0, sizeof(event));
> -	if (ff->dev_lock_changed) {
> -		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> -		event.lock_status.status = (ff->dev_lock_count > 0);
> -		ff->dev_lock_changed = false;
> +	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> +	event.lock_status.status = (ff->dev_lock_count > 0);
> +	ff->dev_lock_changed = false;
>  
> -		count = min_t(long, count, sizeof(event.lock_status));
> -	}
> +	count = min_t(long, count, sizeof(event.lock_status));
>  
>  	spin_unlock_irq(&ff->lock);
>  
> -- 
> 2.29.2
 
Thanks

Takashi Sakamoto
