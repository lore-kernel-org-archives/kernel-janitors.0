From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Aug 2016 09:56:50 +0000
Subject: Re: [PATCH v4] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <a0ac69be-b3a1-d33a-d13e-825fb26bfee9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4dcb4cab-e2cc-87c0-9cfc-d140f185254b@users.sourceforge.net>
 <20160805075511.GN5243@dell>
 <0a2ef320-a95a-2611-2554-a2a83838fb9b@users.sourceforge.net>
 <20160809093022.GU5243@dell>
In-Reply-To: <20160809093022.GU5243@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> But the change-log in this patch says "I did some stuff".
> What stuff did you change?  Which review comments did you
> tend to?

I imagine that I could increase the description granularity
to a detail level which you might also not like.


>>>> +put_device:
>>>> +	platform_device_put(pdev);
>>>> +	dev_err(&client->dev, "failed to add device %s\n", name);
>>>
>>> ... and remove this line.
>>
>> Do you really want that this error message should be deleted?
>>
>> How does this response fit to your request to introduce such a message
>> for the function "add_numbered_child" (on 2016-06-08)?
>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1162299.html
>> https://lkml.org/lkml/2016/6/8/467
> 
> You've lost the context.

I interpreted the suggested message adjustments as separate changes.
So I wondered about a different handling for the Linux modules
"dm355evm_msp" and "twl-core".


> The "..." is meant to intimate that it
> follows on from a previous comment.  In this case:
> 
>>  > status = platform_device_add_data(pdev, pdata, pdata_len);
>>  > if (status < 0) {
>>  > 	dev_dbg(&pdev->dev, "can't add platform_data\n");
>>
>>  Please take the opportunity to convert these to dev_err()s.
> 
> So, convert the specific dev_dbg() calls to dev_err() and remove the
> contentless one at the bottom.

It seems then that you would like to get rid of an error message
at the end while increasing the importance of a related information.

Regards,
Markus
