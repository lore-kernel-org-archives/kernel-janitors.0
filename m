From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Mon, 21 Nov 2011 16:55:11 +0000
Subject: Re: [patch] ath6kl: use a larger buffer for debug output
Message-Id: <4ECA826F.8010605@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111118140906.GA9685@elgon.mountain>	 (sfid-20111118_150942_354029_4789F63D) <1321625461.10266.57.camel@jlt3.sipsolutions.net>
In-Reply-To: <1321625461.10266.57.camel@jlt3.sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/18/2011 04:11 PM, Johannes Berg wrote:
> On Fri, 2011-11-18 at 17:09 +0300, Dan Carpenter wrote:
>> This function makes the static checkers grumble.  The return value of
>> snprintf() is the number of bytes which would have been copied if
>> there was enough space.  In theory, a %u can take take 10 digits so
>> len could be larger than 16 and it would be a small information
>> leak.
>>
>> We may as well make the buffer larger as well since that is very
>> easy to do.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/net/wireless/ath/ath6kl/debug.c b/drivers/net/wireless/ath/ath6kl/debug.c
>> index 9eff0d0..e632008 100644
>> --- a/drivers/net/wireless/ath/ath6kl/debug.c
>> +++ b/drivers/net/wireless/ath/ath6kl/debug.c
>> @@ -1551,11 +1551,12 @@ static ssize_t ath6kl_listen_int_read(struct file *file,
>>  						size_t count, loff_t *ppos)
>>  {
>>  	struct ath6kl *ar = file->private_data;
>> -	char buf[16];
>> +	char buf[32];
>>  	int len;
>>  
>>  	len = snprintf(buf, sizeof(buf), "%u %u\n", ar->listen_intvl_t,
>>  					ar->listen_intvl_b);
>> +	len = min(sizeof(buf), len);
> 
> Maybe that should be scnprintf instead then?

Yeah, I agree. And most likely debug.c has even more cases where
scnprintf() is needed.

Kalle
