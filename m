From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 27 Feb 2018 17:31:19 +0000
Subject: Re: [PATCH] mei: remove dev_err message on an unsupported ioctl
Message-Id: <42c81e25-52be-a80e-f304-765c9a71b328@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180227162105.14113-1-colin.king@canonical.com>
 <5B8DA87D05A7694D9FA63FD143655C1B9422A4CC@hasmsx108.ger.corp.intel.com>
In-Reply-To: <5B8DA87D05A7694D9FA63FD143655C1B9422A4CC@hasmsx108.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Winkler, Tomas" <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 27/02/18 17:26, Winkler, Tomas wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the driver spams the kernel log on unsupported ioctls which is
>> unnecessary as the ioctl returns -ENOIOCTLCMD to indicate this anyway.
>> I suspect this was originally for debugging purposes but it really is not
>> required so remove it.
>>
> 
> This is rather strange as most of the legimit applications are using one IOCTL from kernel 3.0
> Do you have any reference where this call is originated from, frankly this is the first time I got such complain.

I hit this while stressing the kernel with my stress-ng kernel stressing
tool; this was not using the legitimate ioctls (to see if things
explode) and I got a rather full kernel log. So it was being abused
somewhat ;-)

> 
> In any case it would be maybe better to change it a warn once call.

Probably so, I can fix that up if that is preferred.

Colin

>  
> Thanks
> Tomas
> 
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/misc/mei/main.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c index
>> 758dc73602d5..7bb013644aeb 100644
>> --- a/drivers/misc/mei/main.c
>> +++ b/drivers/misc/mei/main.c
>> @@ -507,7 +507,6 @@ static long mei_ioctl(struct file *file, unsigned int
>> cmd, unsigned long data)
>>  		break;
>>
>>  	default:
>> -		dev_err(dev->dev, ": unsupported ioctl %d.\n", cmd);
>>  		rets = -ENOIOCTLCMD;
>>  	}
>>
>> --
>> 2.15.1
> 

