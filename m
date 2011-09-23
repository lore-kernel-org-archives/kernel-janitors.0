From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 23 Sep 2011 06:32:01 +0000
Subject: Re: [patch 2/2] ALSA: hdspm - cleanup __user tags in ioctl()
Message-Id: <s5hipojg466.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923062504.GJ4387@elgon.mountain>
In-Reply-To: <20110923062504.GJ4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Adrian Knoth <adi@drcomp.erfurt.thur.de>, Florian Faber <faber@faberman.de>, Fredrik Lingvall <fredrik.lingvall@gmail.com>

At Fri, 23 Sep 2011 09:25:05 +0300,
Dan Carpenter wrote:
> 
> This makes the code cleaner and silences a Sparse complaint:
> sound/pci/rme9652/hdspm.c:6341:23: warning: incorrect type in assignment (incompatible argument 4 (different address spaces))
> sound/pci/rme9652/hdspm.c:6341:23:    expected int ( *ioctl )( ... )
> sound/pci/rme9652/hdspm.c:6341:23:    got int ( static [toplevel] *<noident> )( ... )
> sound/pci/rme9652/hdspm.c:6102:44: warning: dereference of noderef expression
> sound/pci/rme9652/hdspm.c:6225:50: warning: dereference of noderef expression
> sound/pci/rme9652/hdspm.c:6264:50: warning: dereference of noderef expression
> sound/pci/rme9652/hdspm.c:6283:50: warning: dereference of noderef expression
> sound/pci/rme9652/hdspm.c:6289:59: warning: dereference of noderef expression
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi


> diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
> index bf438d1..6e2f7ef 100644
> --- a/sound/pci/rme9652/hdspm.c
> +++ b/sound/pci/rme9652/hdspm.c
> @@ -6097,7 +6097,7 @@ static inline int copy_u32_le(void __user *dest, void __iomem *src)
>  }
>  
>  static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
> -		unsigned int cmd, unsigned long __user arg)
> +		unsigned int cmd, unsigned long arg)
>  {
>  	void __user *argp = (void __user *)arg;
>  	struct hdspm *hdspm = hw->private_data;
> @@ -6222,7 +6222,7 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
>  		info.line_out = hdspm_line_out(hdspm);
>  		info.passthru = 0;
>  		spin_unlock_irq(&hdspm->lock);
> -		if (copy_to_user((void __user *) arg, &info, sizeof(info)))
> +		if (copy_to_user(argp, &info, sizeof(info)))
>  			return -EFAULT;
>  		break;
>  
> @@ -6261,7 +6261,7 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
>  			break;
>  		}
>  
> -		if (copy_to_user((void __user *) arg, &status, sizeof(status)))
> +		if (copy_to_user(argp, &status, sizeof(status)))
>  			return -EFAULT;
>  
>  
> @@ -6280,13 +6280,13 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
>  		if (hdspm->tco)
>  			hdspm_version.addons |= HDSPM_ADDON_TCO;
>  
> -		if (copy_to_user((void __user *) arg, &hdspm_version,
> +		if (copy_to_user(argp, &hdspm_version,
>  					sizeof(hdspm_version)))
>  			return -EFAULT;
>  		break;
>  
>  	case SNDRV_HDSPM_IOCTL_GET_MIXER:
> -		if (copy_from_user(&mixer, (void __user *)arg, sizeof(mixer)))
> +		if (copy_from_user(&mixer, argp, sizeof(mixer)))
>  			return -EFAULT;
>  		if (copy_to_user((void __user *)mixer.mixer, hdspm->mixer,
>  					sizeof(struct hdspm_mixer)))
> 
