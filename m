From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Fri, 13 Nov 2020 12:02:40 +0000
Subject: Re: [PATCH] ALSA: firewire: Clean up a locking issue in copy_resp_to_buf()
Message-Id: <20201113120240.GB76672@workstation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113101241.GB168908@mwanda>
In-Reply-To: <20201113101241.GB168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>

Hi,

On Fri, Nov 13, 2020 at 01:12:41PM +0300, Dan Carpenter wrote:
> The spin_lock/unlock_irq() functions cannot be nested.  The problem is
> that presumably we would want the IRQs to be re-enabled on the second
> call the spin_unlock_irq() but instead it will be enabled at the first
> call so IRQs will be enabled earlier than expected.
> 
> In this situation the copy_resp_to_buf() function is only called from
> one function and it is called with IRQs disabled.  We can just use
> the regular spin_lock/unlock() functions.
> 
> Fixes: 555e8a8f7f14 ("ALSA: fireworks: Add command/response functionality into hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/firewire/fireworks/fireworks_transaction.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Indeed. It's bad to use the two pairs by nesting. Thanks for the patch
and your care.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireworks/fireworks_transaction.c b/sound/firewire/fireworks/fireworks_transaction.c
> index 0f533f5bd960..9f8c53b39f95 100644
> --- a/sound/firewire/fireworks/fireworks_transaction.c
> +++ b/sound/firewire/fireworks/fireworks_transaction.c
> @@ -123,7 +123,7 @@ copy_resp_to_buf(struct snd_efw *efw, void *data, size_t length, int *rcode)
>  	t = (struct snd_efw_transaction *)data;
>  	length = min_t(size_t, be32_to_cpu(t->length) * sizeof(u32), length);
>  
> -	spin_lock_irq(&efw->lock);
> +	spin_lock(&efw->lock);
>  
>  	if (efw->push_ptr < efw->pull_ptr)
>  		capacity = (unsigned int)(efw->pull_ptr - efw->push_ptr);
> @@ -190,7 +190,7 @@ handle_resp_for_user(struct fw_card *card, int generation, int source,
>  
>  	copy_resp_to_buf(efw, data, length, rcode);
>  end:
> -	spin_unlock_irq(&instances_lock);
> +	spin_unlock(&instances_lock);
>  }
>  
>  static void
> -- 
> 2.28.0


Regards

Takashi Sakamoto
