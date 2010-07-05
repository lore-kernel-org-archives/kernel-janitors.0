From: Mauro Carvalho Chehab <mchehab@infradead.org>
Date: Mon, 05 Jul 2010 17:14:06 +0000
Subject: Re: [patch] V4L/DVB: remove unneeded null check in anysee_probe()
Message-Id: <4C3212DE.7060803@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100531192632.GZ5483@bicker> <alpine.LNX.2.00.1006161755560.12271@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1006161755560.12271@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: Dan Carpenter <error27@gmail.com>, Antti Palosaari <crope@iki.fi>, =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Em 16-06-2010 12:56, Jiri Kosina escreveu:
> On Mon, 31 May 2010, Dan Carpenter wrote:
> 
>> Smatch complained because "d" is dereferenced first and then checked for
>> null later .  The only code path where "d" could be a invalid pointer is
>> if this is a cold device in dvb_usb_device_init().  I consulted Antti 
>> Palosaari and he explained that anysee is always a warm device.
>>
>> I have added a comment and removed the unneeded null check.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>>
>> diff --git a/drivers/media/dvb/dvb-usb/anysee.c b/drivers/media/dvb/dvb-usb/anysee.c
>> index faca1ad..aa5c7d5 100644
>> --- a/drivers/media/dvb/dvb-usb/anysee.c
>> +++ b/drivers/media/dvb/dvb-usb/anysee.c
>> @@ -463,6 +463,11 @@ static int anysee_probe(struct usb_interface *intf,
>>  	if (intf->num_altsetting < 1)
>>  		return -ENODEV;
>>  
>> +	/*
>> +	 * Anysee is always warm (its USB-bridge, Cypress FX2, uploads
>> +	 * firmware from eeprom).  If dvb_usb_device_init() succeeds that
>> +	 * means d is a valid pointer.
>> +	 */
>>  	ret = dvb_usb_device_init(intf, &anysee_properties, THIS_MODULE, &d,
>>  		adapter_nr);
>>  	if (ret)
>> @@ -479,10 +484,7 @@ static int anysee_probe(struct usb_interface *intf,
>>  	if (ret)
>>  		return ret;
>>  
>> -	if (d)
>> -		ret = anysee_init(d);
>> -
>> -	return ret;
>> +	return anysee_init(d);
> 
> Doesn't seem to be present in linux-next as of today. Mauro, will you 
> take it?
> Or I can take it if you ack it.

Sorry, I'm delayed on applying patches on my tree, due to two long trips and
the huge amount of patches that were sent those days.

I'm applying it on my tree right now.

Cheers,
Mauro.
