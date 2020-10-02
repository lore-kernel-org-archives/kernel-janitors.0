From: Jaroslav Kysela <perex@perex.cz>
Date: Fri, 02 Oct 2020 09:18:46 +0000
Subject: Re: [PATCH] ALSA: usb-audio: fix spelling mistake "Frequence" -> "Frequency"
Message-Id: <8ee34833-7867-f559-0656-b4f34ea6d006@perex.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181125231208.14350-1-colin.king@canonical.com>
 <s5hmupw6y6l.wl-tiwai@suse.de>
In-Reply-To: <s5hmupw6y6l.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>, Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 26. 11. 18 v 9:27 Takashi Iwai napsal(a):
> On Mon, 26 Nov 2018 00:12:08 +0100,
> Colin King wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There are spelling mistakes in equalizer name fields, fix them.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> In general, it's not good to rename the control names even if they are
> fixes.  But these are rather device-specific ones, and they are EQ's,
> which aren't too fatal to change, so I took it as-is now.

It seems that this patch has not found a way to kernel. It is present
in #master at git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git,
but it is not present in linux-next.

					Thanks,
						Jaroslav

> 
> 
> thanks,
> 
> Takashi
> 
> 
>> ---
>>  sound/usb/mixer_us16x08.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
>> index 26ed23b18b77..4f594f9552a8 100644
>> --- a/sound/usb/mixer_us16x08.c
>> +++ b/sound/usb/mixer_us16x08.c
>> @@ -1119,7 +1119,7 @@ static const struct snd_us16x08_control_params eq_controls[] = {
>>  		.control_id = SND_US16X08_ID_EQLOWFREQ,
>>  		.type = USB_MIXER_U8,
>>  		.num_channels = 16,
>> -		.name = "EQ Low Frequence",
>> +		.name = "EQ Low Frequency",
>>  	},
>>  	{ /* EQ mid low gain */
>>  		.kcontrol_new = &snd_us16x08_eq_gain_ctl,
>> @@ -1133,7 +1133,7 @@ static const struct snd_us16x08_control_params eq_controls[] = {
>>  		.control_id = SND_US16X08_ID_EQLOWMIDFREQ,
>>  		.type = USB_MIXER_U8,
>>  		.num_channels = 16,
>> -		.name = "EQ MidLow Frequence",
>> +		.name = "EQ MidLow Frequency",
>>  	},
>>  	{ /* EQ mid low Q */
>>  		.kcontrol_new = &snd_us16x08_eq_mid_width_ctl,
>> @@ -1154,7 +1154,7 @@ static const struct snd_us16x08_control_params eq_controls[] = {
>>  		.control_id = SND_US16X08_ID_EQHIGHMIDFREQ,
>>  		.type = USB_MIXER_U8,
>>  		.num_channels = 16,
>> -		.name = "EQ MidHigh Frequence",
>> +		.name = "EQ MidHigh Frequency",
>>  	},
>>  	{ /* EQ mid high Q */
>>  		.kcontrol_new = &snd_us16x08_eq_mid_width_ctl,
>> @@ -1175,7 +1175,7 @@ static const struct snd_us16x08_control_params eq_controls[] = {
>>  		.control_id = SND_US16X08_ID_EQHIGHFREQ,
>>  		.type = USB_MIXER_U8,
>>  		.num_channels = 16,
>> -		.name = "EQ High Frequence",
>> +		.name = "EQ High Frequency",
>>  	},
>>  };
>>  
>> -- 
>> 2.19.1
>>
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
