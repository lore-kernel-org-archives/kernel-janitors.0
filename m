From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 13:25:01 +0000
Subject: Re: [PATCH] USB: emi26: Delete an error message for a failed memory allocation in emi26_writememory(
Message-Id: <c873917f-0264-f4c5-3753-dc6a588cfb51@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <244f8baf-0cd7-89f5-b210-7c321e180f11@users.sourceforge.net>
In-Reply-To: <244f8baf-0cd7-89f5-b210-7c321e180f11@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, linux-usb@vger.kernel.org
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -42,10 +42,9 @@ static int emi26_writememory (struct usb_device *dev, int address,
>>  	int result;
>>  	unsigned char *buffer =  kmemdup(data, length, GFP_KERNEL);
>>
>> -	if (!buffer) {
>> -		dev_err(&dev->dev, "kmalloc(%d) failed.\n", length);
> 
> I guess the length information would not be so easy to find in the backtrace.

Why do you “guess”?


>> +	if (!buffer)
>>  		return -ENOMEM;
>> -	}

Would we like to achieve another consensus on the data which are provided by
a default Linux allocation failure report?

Regards,
Markus
