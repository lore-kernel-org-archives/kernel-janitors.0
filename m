From: Jiri Slaby <jirislaby@gmail.com>
Date: Fri, 30 Jul 2010 12:49:25 +0000
Subject: Re: [PATCH 3/9] staging: otus: check kmalloc() return value
Message-Id: <4C52CA55.4000204@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280488080-20777-1-git-send-email-segooon@gmail.com> <4C52C614.4030803@bfs.de>
In-Reply-To: <4C52C614.4030803@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Kulikov Vasiliy <segooon@gmail.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On 07/30/2010 02:31 PM, walter harms wrote:
> 
> 
> Kulikov Vasiliy schrieb:
>> kmalloc() may fail, if so return error from zfwUsbSubmitControl().
>>
>> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
>> ---
>>  drivers/staging/otus/wrap_usb.c |    5 +++++
>>  1 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/staging/otus/wrap_usb.c b/drivers/staging/otus/wrap_usb.c
>> index 93459ca..9f04047 100644
>> --- a/drivers/staging/otus/wrap_usb.c
>> +++ b/drivers/staging/otus/wrap_usb.c
>> @@ -104,6 +104,11 @@ u32_t zfwUsbSubmitControl(zdev_t *dev, u8_t req, u16_t value, u16_t index,
>>  
>>  	if (size > 0) {
>>  		buf = kmalloc(size, GFP_KERNEL);
>> +		if (buf = NULL) {
>> +			pr_err("zfwUsbSubmitControl() failed, "
>> +				  "kmalloc() returned NULL\n");
>> +			return 1;
>> +		}
>>  		memcpy(buf, (u8_t *)data, size);
>>  	} else
>>  		buf = NULL;
> 
> 
> We had a memdup() somewhere had'nt we ?

Yes, but it is not what he is changing. (Patches welcome.)

The patch is OK, except try to avoid function names in printks next
time. Function names are constantly changing, but developers tend not to
change printk strings. (%s + __func__)

regards,
-- 
js
