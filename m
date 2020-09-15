From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 15 Sep 2020 17:14:42 +0000
Subject: Re: [PATCH] media: rc: fix check on dev->min_timeout for LIRC_GET_MIN_TIMEOUT ioctl
Message-Id: <dc1fed82-d0dd-9dd3-d33c-1225ea7b80c3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200915153608.35154-1-colin.king@canonical.com>
 <20200915171256.GA681@gofer.mess.org>
In-Reply-To: <20200915171256.GA681@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/09/2020 18:12, Sean Young wrote:
> On Tue, Sep 15, 2020 at 04:36:08PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the LIRC_GET_MIN_TIMEOUT is checking for a null dev->max_timeout
>> and then accessing dev->min_timeout, hence we may have a potential null
>> pointer dereference issue.  This looks like a cut-n-paste typo, fix it
>> by checking on dev->min_timeout before accessing it.
> 
> max_timeout and min_timeout are both u32, not pointers. So, the commit 
> message is wrong: there is no null pointer dereference issue.
> 
> Every driver which has max_timeout also has min_timeout set (I've checked
> for this). So technically this is not wrong, but maybe it looks wrong?

Oops. I totally misread the analysis report. My bad.

> 
> Thanks,
> 
> Sean
>>
>> Addresses-Coverity: ("Copy-paste error")
>> Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/media/rc/lirc_dev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
>> index 220363b9a868..d230c21e1d31 100644
>> --- a/drivers/media/rc/lirc_dev.c
>> +++ b/drivers/media/rc/lirc_dev.c
>> @@ -533,7 +533,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>  
>>  	/* Generic timeout support */
>>  	case LIRC_GET_MIN_TIMEOUT:
>> -		if (!dev->max_timeout)
>> +		if (!dev->min_timeout)
>>  			ret = -ENOTTY;
>>  		else
>>  			val = dev->min_timeout;
>> -- 
>> 2.27.0
