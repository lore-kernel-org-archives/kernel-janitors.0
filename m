From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Jul 2010 10:31:00 +0000
Subject: Re: [PATCH 07/10] ALSA: sb: check get_user() return value
Message-Id: <s5h62zytw9n.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280335251-23385-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280335251-23385-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Wed, 28 Jul 2010 20:40:51 +0400,
Kulikov Vasiliy wrote:
> 
> get_user() may fail, if so return -EFAULT.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Thanks, applied this one (with one additional fix for get_user() there).


Takashi

> ---
>  sound/isa/sb/emu8000_pcm.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
> index ccedbfe..ae6fa9f 100644
> --- a/sound/isa/sb/emu8000_pcm.c
> +++ b/sound/isa/sb/emu8000_pcm.c
> @@ -433,7 +433,8 @@ static int emu8k_transfer_block(struct snd_emu8000 *emu, int offset, unsigned sh
>  	while (count > 0) {
>  		unsigned short sval;
>  		CHECK_SCHEDULER();
> -		get_user(sval, buf);
> +		if (get_user(sval, buf))
> +			return -EFAULT;
>  		EMU8000_SMLD_WRITE(emu, sval);
>  		buf++;
>  		count--;
> @@ -525,7 +526,8 @@ static int emu8k_pcm_copy(struct snd_pcm_substream *subs,
>  	while (count-- > 0) {
>  		unsigned short sval;
>  		CHECK_SCHEDULER();
> -		get_user(sval, buf);
> +		if (get_user(sval, buf))
> +			return -EFAULT;
>  		EMU8000_SMLD_WRITE(emu, sval);
>  		buf++;
>  		if (rec->voices > 1) {
> -- 
> 1.7.0.4
> 
