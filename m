From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Aug 2017 20:05:37 +0000
Subject: Re: [PATCH] ALSA: via82xx: Use common error handling code in snd_via82xx_create()
Message-Id: <d9b9dc7e-9c00-3f1d-f6f8-a2e67110c449@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2332472c-61d2-8c21-bf46-5c80745d6380@users.sourceforge.net>
 <20170822190757.76e5edh5t6tgvzpu@mwanda>
In-Reply-To: <20170822190757.76e5edh5t6tgvzpu@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, alsa-devel@alsa-project.org
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>

>> @@ -1121,30 +1121,27 @@ static int snd_via82xx_create(struct snd_card *card,
>>  
>>  	if ((err = pci_request_regions(pci, card->driver)) < 0) {
>>  		kfree(chip);
>> -		pci_disable_device(pci);
>> -		return err;
>> +		goto disable_device;
>>  	}
> 
> [ snip ]
> 
>> @@ -1153,6 +1150,14 @@ static int snd_via82xx_create(struct snd_card *card,
>>  
>>  	*r_via = chip;
>>  	return 0;
>> +
>> +disable_device:
>> +	pci_disable_device(pci);
>> +	goto exit;
> 
> Why is this "goto exit" here?

Should the same return statement be reached after the proposed refactoring?

Would you like to move such a function call to this source code place?


> It's leaking now.

How do you come to this conclusion?


>> +free_chip:
>> +	snd_via82xx_free(chip);
>> +exit:
>> +	return err;
>>  }

Is this update suggestion worth for another look?

Regards,
Markus
