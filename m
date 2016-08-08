From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Aug 2016 11:36:44 +0000
Subject: Re: [PATCH v4] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <0a2ef320-a95a-2611-2554-a2a83838fb9b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4dcb4cab-e2cc-87c0-9cfc-d140f185254b@users.sourceforge.net>
 <20160805075511.GN5243@dell>
In-Reply-To: <20160805075511.GN5243@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> v4: Further feedback was integrated into this message.
> 
> This is not a good change-log.  What actually changed?

Which kind of information would you find more useful in this case?


>> @@ -222,19 +222,20 @@ static struct device *add_child(struct i2c_client *client, const char *name,
>>  		status = platform_device_add_resources(pdev, &r, 1);
>>  		if (status < 0) {
>>  			dev_dbg(&pdev->dev, "can't add irq\n");
>> -			goto err;
>> +			goto put_device;
>>  		}
>>  	}
>>  
>>  	status = platform_device_add(pdev);
>> +	if (status)
>> +		goto put_device;
>>  
>> -err:
>> -	if (status < 0) {
>> -		platform_device_put(pdev);
>> -		dev_err(&client->dev, "can't add %s dev\n", name);
>> -		return ERR_PTR(status);
>> -	}
>>  	return &pdev->dev;
>> +
>> +put_device:
>> +	platform_device_put(pdev);
>> +	dev_err(&client->dev, "failed to add device %s\n", name);
> 
> ... and remove this line.

Do you really want that this error message should be deleted?

How does this response fit to your request to introduce such a message
for the function "add_numbered_child" (on 2016-06-08)?
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1162299.html
https://lkml.org/lkml/2016/6/8/467

Regards,
Markus
