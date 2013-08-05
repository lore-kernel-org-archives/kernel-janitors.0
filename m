From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 05 Aug 2013 16:19:18 +0000
Subject: Re: [PATCH] trivial: adjust code alignment
Message-Id: <alpine.DEB.2.02.1308051810360.2134@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr> <1375714059-29567-5-git-send-email-Julia.Lawall@lip6.fr> <20130805160645.GI5051@mwanda>
In-Reply-To: <20130805160645.GI5051@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, corbet@lwn.net, m.chehab@samsung.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 5 Aug 2013, Dan Carpenter wrote:

> On Mon, Aug 05, 2013 at 04:47:39PM +0200, Julia Lawall wrote:
>> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
>> index e8a1ce2..4a5a5dc 100644
>> --- a/drivers/media/i2c/ov7670.c
>> +++ b/drivers/media/i2c/ov7670.c
>> @@ -1369,8 +1369,8 @@ static int ov7670_s_exp(struct v4l2_subdev *sd, int value)
>>  	unsigned char com1, com8, aech, aechh;
>>
>>  	ret = ov7670_read(sd, REG_COM1, &com1) +
>> -		ov7670_read(sd, REG_COM8, &com8);
>> -		ov7670_read(sd, REG_AECHH, &aechh);
>> +	ov7670_read(sd, REG_COM8, &com8);
>> +	ov7670_read(sd, REG_AECHH, &aechh);
>>  	if (ret)
>>  		return ret;
>>
>
> The new indenting isn't correct here and anyway the intent was to
> combine all the error codes together and return them as an error
> code jumble.  I'm not a fan of error code jumbles, probably the
> right thing is to check each function call or, barring that, to
> return -EIO.

Oops, thanks for spotting that.  I'm not sure whether it is safe to abort 
these calls as soon as the first one fails, but perhaps I could introduce 
some more variables, and test them all afterwards.

What should I do with the big patch?  Resend it with this cut out?  Or, 
considering that I might have overlooked something else, send 90 some 
little ones?

thanks,
julia
