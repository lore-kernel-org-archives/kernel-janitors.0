From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Wed, 07 Oct 2020 15:23:48 +0000
Subject: Re: [PATCH] ALSA: bebob: potential info leak in hwdep_read()
Message-Id: <20201007152348.GB73459@workstation>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201007074928.GA2529578@mwanda>
 <20201007130437.GA73459@workstation>
In-Reply-To: <20201007130437.GA73459@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Oops, I forgot to add my tag to the former message.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

On Wed, Oct 07, 2020 at 10:04:37PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> Thanks for the patch.
> 
> On Wed, Oct 07, 2020 at 10:49:28AM +0300, Dan Carpenter wrote:
> > The "count" variable needs to be capped on every path so that we don't
> > copy too much information to the user.
> > 
> > Fixes: 618eabeae711 ("ALSA: bebob: Add hwdep interface")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  sound/firewire/bebob/bebob_hwdep.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
> > index 45b740f44c45..c362eb38ab90 100644
> > --- a/sound/firewire/bebob/bebob_hwdep.c
> > +++ b/sound/firewire/bebob/bebob_hwdep.c
> > @@ -36,12 +36,11 @@ hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
> >  	}
> >  
> >  	memset(&event, 0, sizeof(event));
> > +	count = min_t(long, count, sizeof(event.lock_status));
> >  	if (bebob->dev_lock_changed) {
> >  		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
> >  		event.lock_status.status = (bebob->dev_lock_count > 0);
> >  		bebob->dev_lock_changed = false;
> > -
> > -		count = min_t(long, count, sizeof(event.lock_status));
> >  	}
> >  
> >  	spin_unlock_irq(&bebob->lock);
> > -- 
> > 2.28.0
> 
> Indeed, the bug can leak the contents of kernel memory into user space
> unintentionally for the size indicated by ALSA HwDep application...
> 
> I will check the other drivers in ALSA firewire stack later for safe.
> 
> 
> Thanks
> 
> Takashi Sakamoto
