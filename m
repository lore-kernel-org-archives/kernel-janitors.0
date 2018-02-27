From: Krzysztof Opasiak <k.opasiak@samsung.com>
Date: Tue, 27 Feb 2018 13:24:44 +0000
Subject: Re: [PATCH] usbip: vudc: fix null pointer dereference on udc->lock
Message-Id: <b021604f-06e0-e595-23c5-cf40e7a02268@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180222173917.10841-1-colin.king@canonical.com>
In-Reply-To: <20180222173917.10841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shuah@kernel.org, Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>



On 02/26/2018 05:40 PM, Shuah Khan wrote:
> On 02/22/2018 10:39 AM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the driver attempts to spin lock on udc->lock before a NULL
>> pointer check is performed on udc, hence there is a potential null
>> pointer dereference on udc->lock.  Fix this by moving the null check
>> on udc before the lock occurs.
>>
>> Fixes: ea6873a45a22 ("usbip: vudc: Add SysFS infrastructure for VUDC")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/usb/usbip/vudc_sysfs.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
>> index d86f72bbbb91..6dcd3ff655c3 100644
>> --- a/drivers/usb/usbip/vudc_sysfs.c
>> +++ b/drivers/usb/usbip/vudc_sysfs.c
>> @@ -105,10 +105,14 @@ static ssize_t usbip_sockfd_store(struct device *dev, struct device_attribute *a
>>   	if (rv != 0)
>>   		return -EINVAL;
>>   
>> +	if (!udc) {
>> +		dev_err(dev, "no device");
>> +		return -ENODEV;
>> +	}
>>   	spin_lock_irqsave(&udc->lock, flags);
>>   	/* Don't export what we don't have */
>> -	if (!udc || !udc->driver || !udc->pullup) {
>> -		dev_err(dev, "no device or gadget not bound");
>> +	if (!udc->driver || !udc->pullup) {
>> +		dev_err(dev, "gadget not bound");
>>   		ret = -ENODEV;
>>   		goto unlock;
>>   	}
>>
> 
> Thanks for the patch. Looks good to me.
> 
> Acked-by: Shuah Khan <shuahkh@osg.samsung.com>

Reviewed-by: Krzysztof Opasiak <k.opasiak@samsung.com>

but you could fix also a similar bug one one function above 
(dev_desc_read()) ;)

Best regards,
-- 
Krzysztof Opasiak
Samsung R&D Institute Poland
Samsung Electronics
