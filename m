From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 02 Oct 2012 05:31:59 +0000
Subject: Re: [PATCH 3/3] drivers/media/tuners/fc0011.c: introduce macros for i2c_msg initialization
Message-Id: <alpine.DEB.2.02.1210020730370.1929@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348990388-7413-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1348990388-7413-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks.  I'll integrate the sizeof(buf) issue and resend everything in the 
proper manner.  The one case where the name of the buffer could change 
seems like a separate patch.

julia

On Tue, 2 Oct 2012, Ryan Mallon wrote:

> On 30/09/12 17:33, Julia Lawall wrote:
>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> Introduce use of I2c_MSG_READ/WRITE/OP, for readability.
>>
>> A simplified version of the semantic patch that makes this change is as
>> follows: (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @@
>> expression a,b,c;
>> identifier x;
>> @@
>>
>> struct i2c_msg x >> - {.addr = a, .buf = b, .len = c, .flags = I2C_M_RD}
>> + I2C_MSG_READ(a,b,c)
>>  ;
>>
>> @@
>> expression a,b,c;
>> identifier x;
>> @@
>>
>> struct i2c_msg x >> - {.addr = a, .buf = b, .len = c, .flags = 0}
>> + I2C_MSG_WRITE(a,b,c)
>>  ;
>>
>> @@
>> expression a,b,c,d;
>> identifier x;
>> @@
>>
>> struct i2c_msg x >> - {.addr = a, .buf = b, .len = c, .flags = d}
>> + I2C_MSG_OP(a,b,c,d)
>>  ;
>> // </smpl>
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Looks okay. One minor comment, which could be done as a separate patch
> to keep this one as just the straight conversion.
>
> ~Ryan
>
>> ---
>>  drivers/media/tuners/fc0011.c |    9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/tuners/fc0011.c b/drivers/media/tuners/fc0011.c
>> index e488254..b0036d6 100644
>> --- a/drivers/media/tuners/fc0011.c
>> +++ b/drivers/media/tuners/fc0011.c
>> @@ -80,8 +80,7 @@ struct fc0011_priv {
>>  static int fc0011_writereg(struct fc0011_priv *priv, u8 reg, u8 val)
>>  {
>>  	u8 buf[2] = { reg, val };
>> -	struct i2c_msg msg = { .addr = priv->addr,
>> -		.flags = 0, .buf = buf, .len = 2 };
>> +	struct i2c_msg msg = I2C_MSG_WRITE(priv->addr, buf, 2);
>
> sizeof(buf)
>
>>
>>  	if (i2c_transfer(priv->i2c, &msg, 1) != 1) {
>>  		dev_err(&priv->i2c->dev,
>> @@ -97,10 +96,8 @@ static int fc0011_readreg(struct fc0011_priv *priv, u8 reg, u8 *val)
>>  {
>>  	u8 dummy;
>>  	struct i2c_msg msg[2] = {
>> -		{ .addr = priv->addr,
>> -		  .flags = 0, .buf = &reg, .len = 1 },
>> -		{ .addr = priv->addr,
>> -		  .flags = I2C_M_RD, .buf = val ? : &dummy, .len = 1 },
>> +		I2C_MSG_WRITE(priv->addr, &reg, 1),
>> +		I2C_MSG_READ(priv->addr, val ? : &dummy, 1),
>>  	};
>>
>>  	if (i2c_transfer(priv->i2c, msg, 2) != 2) {
>>
>
>
