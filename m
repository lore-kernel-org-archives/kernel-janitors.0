From: "Franky Lin" <frankyl@broadcom.com>
Date: Tue, 14 Jun 2011 17:02:52 +0000
Subject: Re: [PATCH] staging: remove unnecessary code
Message-Id: <4DF7943C.7090809@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1307988707-15757-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1307988707-15757-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Acked-by: Franky Lin <frankyl@broadcom.com>

On 6/13/2011 11:11:47 AM, Greg Dietsche <Gregory.Dietsche@cuw.edu> wrote:
> Compile tested.
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
>
> Signed-off-by: Greg Dietsche<Gregory.Dietsche@cuw.edu>
> ---
>   drivers/staging/bcm/Misc.c                       |   10 ++--------
>   drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c |    8 +-------
>   drivers/staging/comedi/comedi_fops.c             |    2 +-
>   drivers/staging/comedi/drivers/usbdux.c          |    5 +----
>   drivers/staging/tm6000/tm6000-cards.c            |    6 +-----
>   5 files changed, 6 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/staging/bcm/Misc.c b/drivers/staging/bcm/Misc.c
> index c5003b6..c5b3a36 100644
> --- a/drivers/staging/bcm/Misc.c
> +++ b/drivers/staging/bcm/Misc.c
> @@ -1447,16 +1447,10 @@ static void convertEndian(B_UINT8 rwFlag, PUINT puiBuffer, UINT uiByteCount)
>
>   int rdm(PMINI_ADAPTER Adapter, UINT uiAddress, PCHAR pucBuff, size_t sSize)
>   {
> -	INT uiRetVal =0;
> -
> -	uiRetVal = Adapter->interface_rdm(Adapter->pvInterfaceAdapter,
> +	return Adapter->interface_rdm(Adapter->pvInterfaceAdapter,
>   			uiAddress, pucBuff, sSize);
> -
> -	if(uiRetVal<  0)
> -		return uiRetVal;
> -
> -	return uiRetVal;
>   }
> +
>   int wrm(PMINI_ADAPTER Adapter, UINT uiAddress, PCHAR pucBuff, size_t sSize)
>   {
>   	int iRetVal;
> diff --git a/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c b/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
> index 1827b0b..9e9d152 100644
> --- a/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
> +++ b/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
> @@ -4148,13 +4148,7 @@ s32 wl_cfg80211_down(void)
>
>   static s32 wl_dongle_probecap(struct wl_priv *wl)
>   {
> -	s32 err = 0;
> -
> -	err = wl_update_wiphybands(wl);
> -	if (unlikely(err))
> -		return err;
> -
> -	return err;
> +	return wl_update_wiphybands(wl);
>   }
>
>   static void *wl_read_prof(struct wl_priv *wl, s32 item)
> diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
> index e7e72b8..15a209f 100644
> --- a/drivers/staging/comedi/comedi_fops.c
> +++ b/drivers/staging/comedi/comedi_fops.c
> @@ -1291,10 +1291,10 @@ static int do_lock_ioctl(struct comedi_device *dev, unsigned int arg,
>   		s->lock = file;
>   	spin_unlock_irqrestore(&s->spin_lock, flags);
>
> +#if 0
>   	if (ret<  0)
>   		return ret;
>
> -#if 0
>   	if (s->lock_f)
>   		ret = s->lock_f(dev, s);
>   #endif
> diff --git a/drivers/staging/comedi/drivers/usbdux.c b/drivers/staging/comedi/drivers/usbdux.c
> index 1d09bfa..6637698 100644
> --- a/drivers/staging/comedi/drivers/usbdux.c
> +++ b/drivers/staging/comedi/drivers/usbdux.c
> @@ -1935,11 +1935,8 @@ static int usbdux_pwm_cancel(struct comedi_device *dev,
>   	dev_dbg(&this_usbduxsub->interface->dev,
>   		"comedi %d: sending pwm off command to the usb device.\n",
>   		dev->minor);
> -	res = send_dux_commands(this_usbduxsub, SENDPWMOFF);
> -	if (res<  0)
> -		return res;
>
> -	return res;
> +	return send_dux_commands(this_usbduxsub, SENDPWMOFF);
>   }
>
>   static void usbduxsub_pwm_irq(struct urb *urb)
> diff --git a/drivers/staging/tm6000/tm6000-cards.c b/drivers/staging/tm6000/tm6000-cards.c
> index a69c82e..9c516cd 100644
> --- a/drivers/staging/tm6000/tm6000-cards.c
> +++ b/drivers/staging/tm6000/tm6000-cards.c
> @@ -994,11 +994,7 @@ static int fill_board_specific_data(struct tm6000_core *dev)
>   	if (rc<  0)
>   		return rc;
>
> -	rc = v4l2_device_register(&dev->udev->dev,&dev->v4l2_dev);
> -	if (rc<  0)
> -		return rc;
> -
> -	return rc;
> +	return v4l2_device_register(&dev->udev->dev,&dev->v4l2_dev);
>   }
>
>


