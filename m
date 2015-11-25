From: walter harms <wharms@bfs.de>
Date: Wed, 25 Nov 2015 10:10:56 +0000
Subject: Re: [PATCH] s390-ctcm: Delete unnecessary checks before the function call "channel_remove"
Message-Id: <56558930.6000209@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <564B7DEF.6050005@users.sourceforge.net>
In-Reply-To: <564B7DEF.6050005@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 25.11.2015 10:37, schrieb Ursula Braun:
> Applied to our local git. Thanks. It will be part of my next patch
> submission for net-next.
> 
> Kind regards, Ursula Braun, IBM Germany
> 
> On Tue, 2015-11-17 at 20:20 +0100, SF Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Tue, 17 Nov 2015 20:10:02 +0100
>>
>> The channel_remove() function tests whether its argument is NULL
>> and then returns immediately. Thus the test around the calls is not needed.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>  drivers/s390/net/ctcm_main.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/s390/net/ctcm_main.c b/drivers/s390/net/ctcm_main.c
>> index 05c37d6..c3e2252 100644
>> --- a/drivers/s390/net/ctcm_main.c
>> +++ b/drivers/s390/net/ctcm_main.c
>> @@ -1677,11 +1677,8 @@ static int ctcm_shutdown_device(struct ccwgroup_device *cgdev)
>>
>>  	ccw_device_set_offline(cgdev->cdev[1]);
>>  	ccw_device_set_offline(cgdev->cdev[0]);

while you are at it ..

could it be that
	cgdev->cdev[1] = cgdev->cdev[CTCM_WRITE]

if yes you may want to fix that also.

re,
 wh

>> -
>> -	if (priv->channel[CTCM_READ])
>> -		channel_remove(priv->channel[CTCM_READ]);
>> -	if (priv->channel[CTCM_WRITE])
>> -		channel_remove(priv->channel[CTCM_WRITE]);
>> +	channel_remove(priv->channel[CTCM_READ]);
>> +	channel_remove(priv->channel[CTCM_WRITE]);
>>  	priv->channel[CTCM_READ] = priv->channel[CTCM_WRITE] = NULL;
>>
>>  	return 0;
> 
> 
