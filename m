From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 18:40:11 +0000
Subject: Re: [PATCH 3/9] staging: ks7010: Return directly after a failed kmalloc()
Message-Id: <2071ae3b-9878-c798-6ead-897d1dd0d116@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <3aa380a9-afe6-6dc8-7533-6747afeb1bdc@users.sourceforge.net>
 <alpine.DEB.2.10.1607172057500.3177@hadrien> <20160720154756.GC1688@katana>
In-Reply-To: <20160720154756.GC1688@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> @@ -713,10 +713,8 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
>>>  	unsigned char *data_buf;
>>>
>>>  	data_buf = kmalloc(sizeof(u32), GFP_KERNEL);
>>> -	if (!data_buf) {
>>> -		rc = 1;
>>> -		goto error_out;
>>> -	}
>>> +	if (!data_buf)
>>> +		return 1;
>>
>> One could rather wonder why the function has such strange error values...
> 
> Agreed. Markus, can you check if we can use -ENOMEM in those places.

I find that I do not know this software good enough at the moment
so that I could safely decide on the shown special error values.
I guess that further clarification might be needed for affected
implementation details.

Regards,
Markus
