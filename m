From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 26 Apr 2020 17:00:54 +0000
Subject: Re: [PATCH] sound:hdmi:fix without unlocked before return
Message-Id: <475cb7a9-0992-3a79-a0ad-d3f8922ba3cb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wu Bo <wubo40@huawei.com>, alsa-devel@alsa-project.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Nikhil Mahale <nmahale@nvidia.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Aaron Plattner <aplattner@nvidia.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Feilong Lin <linfeilong@huawei.com>, Libin Yang <libin.yang@linux.intel.com>, Zhiqiang Liu <liuzhiqiang26@huawei.com>

> After add sanity check to pass klockwork check,
> The spdif_mutex should be unlock before return true
> in check_non_pcm_per_cvt().

How do you think about a wording variant like the following?

   Subject:
   [PATCH v2] ALSA: hda/hdmi: Unlock a mutex always before returning from check_non_pcm_per_cvt()

   Change description (according to a solution alternative):
   The exception handling was incomplete in an if branch for
   a null pointer check of the variable “spdif”.
   Thus assign an appropriate value to the local variable “non_pcm”
   by using a conditional operator instead.
   A mutex is also appropriately unlocked then.


…
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1848,8 +1848,10 @@ static bool check_non_pcm_per_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
…
> -	if (WARN_ON(spdif == NULL))
> +	if (WARN_ON(spdif == NULL)) {
> +		mutex_unlock(&codec->spdif_mutex);
>  		return true;
> +	}
>  	non_pcm = !!(spdif->status & IEC958_AES0_NONAUDIO);

-	if (WARN_ON(spdif == NULL))
-		return true;
-	non_pcm = !!(spdif->status & IEC958_AES0_NONAUDIO);
+	non_pcm = WARN_ON(!spdif)
+		  ? true
+		  : !!(spdif->status & IEC958_AES0_NONAUDIO);
 	mutex_unlock(&codec->spdif_mutex);
 	return non_pcm;
 }


Would you like to add the tag “Fixes” to the change description?

Regards,
Markus
