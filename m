From: walter harms <wharms@bfs.de>
Date: Fri, 21 Sep 2012 11:47:54 +0000
Subject: Re: sound/pci/hda/patch_ca0132.c: potential null dereference 'dma_engine'
Message-Id: <505C53EA.2090206@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921102242.GA11865@localhost>
In-Reply-To: <20120921102242.GA11865@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 21.09.2012 13:46, schrieb Takashi Iwai:
> At Fri, 21 Sep 2012 18:22:42 +0800,
> Fengguang Wu wrote:
>>
>> Hi Ian,
>>
>> FYI, there are new smatch warnings show up in
>>
>> commit 0b37d4c7982442730061a737c16939e8cc363861
>> Author:     Ian Minett <ian_minett@creativelabs.com>
>> Commit:     Takashi Iwai <tiwai@suse.de>
>> CommitDate: Fri Sep 21 09:54:29 2012 +0200
>>
>> + sound/pci/hda/patch_ca0132.c:2056 dspxfr_image() error: potential null dereference 'dma_engine'.  (kzalloc returns null)
>> + sound/pci/hda/patch_ca0132.c:2056 dspxfr_image() error: we previously assumed 'dma_engine' could be null (see line 1963)
> 
> Fixed with the patch below.  Thanks!
> 
> 
> Takashi
> 
> => Subject: [PATCH] ALSA: hda - Fix NULL dereference in error path of patch_ca0132.c
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/patch_ca0132.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
> index 5c6a056..03f57c9 100644
> --- a/sound/pci/hda/patch_ca0132.c
> +++ b/sound/pci/hda/patch_ca0132.c
> @@ -1960,10 +1960,8 @@ static int dspxfr_image(struct hda_codec *codec,
>  		return -EINVAL;
>  
>  	dma_engine = kzalloc(sizeof(*dma_engine), GFP_KERNEL);
> -	if (!dma_engine) {
> -		status = -ENOMEM;
> -		goto exit;
> -	}
> +	if (!dma_engine)
> +		return -ENOMEM;
>  	memset((void *)dma_engine, 0, sizeof(*dma_engine));
>  

Why do you need that memset() ? kzalloc() should fill the buffer with 0.

re,
 wh
>  	dma_engine->dmab = kzalloc(sizeof(*dma_engine->dmab), GFP_KERNEL);
