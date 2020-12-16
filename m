From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Wed, 16 Dec 2020 09:38:36 +0000
Subject: Re: [PATCH] media: allegro: Fix use after free on error
Message-Id: <7f7011dd-ceb2-67de-1f9b-9edd0777c04d@xs4all.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9dShwq8PrThDpn9@mwanda> <20201214171627.GE1861@pengutronix.de>
In-Reply-To: <20201214171627.GE1861@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Tretter <m.tretter@pengutronix.de>, Dan Carpenter <dan.carpenter@oracle.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On 14/12/2020 18:16, Michael Tretter wrote:
> On Mon, 14 Dec 2020 14:54:47 +0300, Dan Carpenter wrote:
>> The "channel" is added to the "dev->channels" but then if
>> v4l2_m2m_ctx_init() fails then we free "channel" but it's still on the
>> list so it could lead to a use after free.  Let's not add it to the
>> list until after v4l2_m2m_ctx_init() succeeds.
> 
> Thanks.
> 
> The patch conflicts with the series that moves the driver from staging to
> mainline [0]. I'm not sure, which patch should go in first.

I'll take care of the conflict.

Regards,

	Hans

> 
> It is also correct to not change the order of list_del and
> v4l2_m2m_ctx_release in allegro_release. The list is used to relate messages
> from the VCU to their destination channel and this should be possible until
> the context has been released and no further messages are expected for that
> channel.
> 
> [0] https://lore.kernel.org/linux-media/20201202133040.1954837-1-m.tretter@pengutronix.de/
> 
>>
>> Fixes: cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> 
>> ---
>> From static analysis.  Not tested.
>>
>>  drivers/staging/media/allegro-dvt/allegro-core.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
>> index 9f718f43282b..640451134072 100644
>> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
>> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
>> @@ -2483,8 +2483,6 @@ static int allegro_open(struct file *file)
>>  	INIT_LIST_HEAD(&channel->buffers_reference);
>>  	INIT_LIST_HEAD(&channel->buffers_intermediate);
>>  
>> -	list_add(&channel->list, &dev->channels);
>> -
>>  	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
>>  						allegro_queue_init);
>>  
>> @@ -2493,6 +2491,7 @@ static int allegro_open(struct file *file)
>>  		goto error;
>>  	}
>>  
>> +	list_add(&channel->list, &dev->channels);
>>  	file->private_data = &channel->fh;
>>  	v4l2_fh_add(&channel->fh);
>>  
>> -- 
>> 2.29.2
>>
>>
