From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Apr 2017 10:48:15 +0000
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: simple-card: Use devm_kcalloc() in asoc_simple_card_parse_aux_dev
Message-Id: <49bbbcac-f970-bbb9-c66b-c9c25229cc6a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8b5e37d1-17c5-4551-801f-ca7939d5efd7@users.sourceforge.net>
 <8c8c6979-0368-9ef5-2e10-57199f0bc03e@users.sourceforge.net>
 <20170428085735.i7xpxph24t5v5f5q@piout.net>
In-Reply-To: <20170428085735.i7xpxph24t5v5f5q@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

>> @@ -334,8 +334,8 @@ static int asoc_simple_card_parse_aux_devs(struct device_node *node,
>>  	if (n <= 0)
>>  		return -EINVAL;
>>  
>> -	card->aux_dev = devm_kzalloc(dev,
>> -			n * sizeof(*card->aux_dev), GFP_KERNEL);
>> +	card->aux_dev = devm_kcalloc(dev, n, sizeof(*card->aux_dev),
>> +				     GFP_KERNEL);
> 
> Do you realize that this change has absolutely no value

We can have different software development opinions about such a source code adjustment.
Does it improve the indentation for the parameters which are passed to this function call?


> and just makes the code slower (one more test in the allocation path)?

Do we stumble on a target conflict for the shown implementation detail?

Does the previous size calculation contain the general possibility for
an integer overflow?
https://cwe.mitre.org/data/definitions/190.html

The value for the variable “len” (and also “n”) might be small enough so that
the computed value will usually not exceed the data type limit in this use case.

Regards,
Markus
