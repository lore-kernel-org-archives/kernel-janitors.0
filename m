From: "Arend van Spriel" <arend@broadcom.com>
Date: Sat, 29 Oct 2011 09:36:55 +0000
Subject: Re: [PATCH 3/5] drivers/hid/hid-roccat.c: eliminate a null
Message-Id: <4EABC937.60600@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1319846297-2985-3-git-send-email-julia@diku.dk>
 <20111029062412.GG14881@longonot.mountain>
In-Reply-To: <20111029062412.GG14881@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <julia@diku.dk>, Jiri Kosina <jkosina@suse.cz>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 10/29/2011 08:24 AM, Dan Carpenter wrote:
> On Sat, Oct 29, 2011 at 01:58:15AM +0200, Julia Lawall wrote:
>> diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
>> index 2596321..36a28b8 100644
>> --- a/drivers/hid/hid-roccat.c
>> +++ b/drivers/hid/hid-roccat.c
>> @@ -163,14 +163,15 @@ static int roccat_open(struct inode *inode, struct file *file)
>>  
>>  	device = devices[minor];
>>  
>> -	mutex_lock(&device->readers_lock);
>> -
>>  	if (!device) {
>>  		pr_emerg("roccat device with minor %d doesn't exist\n", minor);
>> -		error = -ENODEV;
>> -		goto exit_err;
>> +		kfree(reader);
>> +		mutex_lock(&devices_lock);
> 
> Typo.  mutex_unlock() instead of mutex_lock().

This is no typo, but simply wrong. Remove the mutex_lock() as we are
leaving the function here in error flow.

>> +		return -ENODEV;
>>  	}
>>  
>> +	mutex_lock(&device->readers_lock);
>> +
>>  	if (!device->open++) {
>>  		/* power on device on adding first reader */
>>  		error = hid_hw_power(device->hid, PM_HINT_FULLON);
>>
> 
> regards,
> dan carpenter

Gr. AvS

