From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 23 Sep 2011 06:31:50 +0000
Subject: Re: [patch 1/2] ALSA: hdspm - potential info leak in snd_hdspm_hwdep_ioctl()
Message-Id: <s5hk48zg46h.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110923062421.GI4387@elgon.mountain>
In-Reply-To: <20110923062421.GI4387@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Adrian Knoth <adi@drcomp.erfurt.thur.de>, Florian Faber <faber@faberman.de>, Fredrik Lingvall <fredrik.lingvall@gmail.com>

At Fri, 23 Sep 2011 09:24:21 +0300,
Dan Carpenter wrote:
> 
> Smatch has a new check for Rosenberg type information leaks where
> structs are copied to the user with uninitialized stack data in them.
> 
> The status struct has a hole in it, and on some paths not all the
> members were initialized.
> 
> struct hdspm_status {
>         unsigned char              card_type;            /*     0     1 */
>         /* XXX 3 bytes hole, try to pack */
>         enum hdspm_syncsource      autosync_source;      /*     4     4 */
>         long long unsigned int     card_clock;           /*     8     8 */
> 
> The hdspm_version struct had holes in it as well.
> 
> struct hdspm_version {
>         unsigned char              card_type;            /*     0     1 */
>         char                       cardname[20];         /*     1    20 */
>         /* XXX 3 bytes hole, try to pack */
>         unsigned int               serial;               /*    24     4 */
>         short unsigned int         firmware_rev;         /*    28     2 */
>         /* XXX 2 bytes hole, try to pack */
>         int                        addons;               /*    32     4 */
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi


> diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
> index 214110d..bf438d1 100644
> --- a/sound/pci/rme9652/hdspm.c
> +++ b/sound/pci/rme9652/hdspm.c
> @@ -6227,6 +6227,8 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
>  		break;
>  
>  	case SNDRV_HDSPM_IOCTL_GET_STATUS:
> +		memset(&status, 0, sizeof(status));
> +
>  		status.card_type = hdspm->io_type;
>  
>  		status.autosync_source = hdspm_autosync_ref(hdspm);
> @@ -6266,6 +6268,8 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
>  		break;
>  
>  	case SNDRV_HDSPM_IOCTL_GET_VERSION:
> +		memset(&hdspm_version, 0, sizeof(hdspm_version));
> +
>  		hdspm_version.card_type = hdspm->io_type;
>  		strncpy(hdspm_version.cardname, hdspm->card_name,
>  				sizeof(hdspm_version.cardname));
> 
