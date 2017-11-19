From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 06:37:37 +0000
Subject: Re: [PATCH] ALSA: via82xx: Use common error handling code in snd_via82xx_create()
Message-Id: <3a2f0905-231d-b2af-d1e8-1635158c6e53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2332472c-61d2-8c21-bf46-5c80745d6380@users.sourceforge.net>
 <s5hpobnscx1.wl-tiwai@suse.de>
In-Reply-To: <s5hpobnscx1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> @@ -1153,6 +1150,14 @@ static int snd_via82xx_create(struct snd_card *card,
>>  
>>  	*r_via = chip;
>>  	return 0;
>> +
>> +disable_device:
>> +	pci_disable_device(pci);
>> +	goto exit;
>> +free_chip:
>> +	snd_via82xx_free(chip);
>> +exit:
>> +	return err;
> 
> Doubly goto doesn't look like an improvement.

Would you like to integrate another software update with the statement
“return err;” instead of “goto exit;” at this place?

Regards,
Markus
