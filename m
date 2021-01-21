From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 21 Jan 2021 20:42:04 +0000
Subject: Re: [PATCH] ALSA: fireface: fix info leak in hwdep_read()
Message-Id: <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAka5xudQNQgRkuC@mwanda>
In-Reply-To: <YAka5xudQNQgRkuC@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

Hi Dan,

Le 21/01/2021 à 07:10, Dan Carpenter a écrit :
> If "ff->dev_lock_changed" has not changed

According to the "while (!ff->dev_lock_changed) { ... }" just above and 
the lock in place, can this ever happen?

In other word, I wonder if the "if (ff->dev_lock_changed)" test makes 
sense and if it could be removed.


(same for your other patch against sound/firewire/oxfw/oxfw-hwdep.c)

CJ


> and "count" is too large then
> this will copy data beyond the end of the struct to user space.
> 
> Fixes: f656edd5fb33 ("ALSA: fireface: add hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   sound/firewire/fireface/ff-hwdep.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
> index 4b2e0dff5ddb..b84dde609a03 100644
> --- a/sound/firewire/fireface/ff-hwdep.c
> +++ b/sound/firewire/fireface/ff-hwdep.c
> @@ -35,12 +35,12 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>   	}
>   
>   	memset(&event, 0, sizeof(event));
> +	count = min_t(long, count, sizeof(event.lock_status));
>   	if (ff->dev_lock_changed) {
>   		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
>   		event.lock_status.status = (ff->dev_lock_count > 0);
>   		ff->dev_lock_changed = false;
>   
> -		count = min_t(long, count, sizeof(event.lock_status));
>   	}
>   
>   	spin_unlock_irq(&ff->lock);
> 
