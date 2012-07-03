From: walter harms <wharms@bfs.de>
Date: Tue, 03 Jul 2012 18:43:06 +0000
Subject: Re: [patch] printk: remove some dead code
Message-Id: <4FF33D3A.4040005@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120703104511.GA29501@elgon.mountain>
In-Reply-To: <20120703104511.GA29501@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 03.07.2012 19:59, schrieb Kay Sievers:
> On Tue, 2012-07-03 at 13:21 +0200, Kay Sievers wrote:
>> On Tue, Jul 3, 2012 at 12:45 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>> Static checkers complain about the impossible condition here.
>>>
>>> In 084681d14e ('printk: flush continuation lines immediately to
>>> console'), we changed msg->level from being a u16 to being an unsigned
>>> 3 bit bitfield.  That means we can remove the code here to handle log
>>> levels which are in the tens or hundreds column.
>>
>> We should do that for the facility value, now that level is split up
>> in separate fields. I'll prepare a fix.
> 
> Here it is. Nice tool, very useful.
> 
> Thanks again,
> Kay
> 
> 
> From: Kay Sievers <kay@vrfy.org>
> Subject: kmsg: add the facility number to the syslog prefix
> 
> After the recent split of facility and level into separate variables,
> we miss the facility value (always 0 for kernel-originated messages)
> in the syslog prefix.
> 
> On Tue, Jul 3, 2012 at 12:45 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> Static checkers complain about the impossible condition here.
>>
>> In 084681d14e ('printk: flush continuation lines immediately to
>> console'), we changed msg->level from being a u16 to being an unsigned
>> 3 bit bitfield.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kay Sievers <kay@vrfy.org>
> ---
>  kernel/printk.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> --- a/kernel/printk.c
> +++ b/kernel/printk.c
> @@ -818,15 +818,16 @@ static size_t print_time(u64 ts, char *b
>  static size_t print_prefix(const struct log *msg, bool syslog, char *buf)
>  {
>  	size_t len = 0;
> +	unsigned int prefix = (msg->facility << 3) | msg->level;
>  
>  	if (syslog) {
>  		if (buf) {
> -			len += sprintf(buf, "<%u>", msg->level);
> +			len += sprintf(buf, "<%u>", prefix);
>  		} else {
>  			len += 3;
> -			if (msg->level > 9)
> +			if (prefix > 9)
>  				len++;
> -			if (msg->level > 99)
> +			if (prefix > 99)
>  				len++;
>  		}
>  	}
> 
> 

just for my curiosity: why not len+=5 and forget the rest ?

re,
 wh
