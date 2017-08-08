From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 08 Aug 2017 07:40:59 +0000
Subject: Re: [PATCH] i2c: imx: Remove a useless test in 'i2c_imx_init_recovery_info()'
Message-Id: <9279b880-558a-17fb-404c-98012bb0f9f1@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170806234953.30682-1-christophe.jaillet@wanadoo.fr>
 <20170807063617.5wr4i7b7k72uyrit@pengutronix.de>
In-Reply-To: <20170807063617.5wr4i7b7k72uyrit@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Le 07/08/2017 =E0 08:36, Uwe Kleine-K=F6nig a =E9crit :
> On Mon, Aug 07, 2017 at 01:49:53AM +0200, Christophe JAILLET wrote:
>> 'devm_pinctrl_get()' never returns NULL, so this test can be simplified.
> That's wrong. If CONFIG_PINCTRL is disabled devm_pinctrl_get returns
> NULL. But I think this shouldn't be considered an error, so your change
> is right, just the commit log is not.
With that said, in fact, I think that the test is correct as is.
If CONFIG_PINCTRL is disabled, we will display an info about a missing=20
functionality, but would still continue normally without it (i.e. return=20
PTR_ERR(NULL) =3D 0 =3D success), as stated in the comment in front of=20
'i2c_imx_init_recovery_info':
     "These alternative pinmux settings can be described in the device=20
tree by
      a separate pinctrl state "gpio". If this is missing this is not a big
      problem, the only implication is that we can't do bus recovery."

So, I won't propose any v2 patch with an updated commit log.
Feel free to update it yourself and apply it if you don't share my=20
analysis above.

Sorry for the noise.

CJ

>
>> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
>> index 54a47b40546f..7e84662fe1c0 100644
>> --- a/drivers/i2c/busses/i2c-imx.c
>> +++ b/drivers/i2c/busses/i2c-imx.c
>> @@ -997,7 +997,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c=
_struct *i2c_imx,
>>   	struct i2c_bus_recovery_info *rinfo =3D &i2c_imx->rinfo;
>>  =20
>>   	i2c_imx->pinctrl =3D devm_pinctrl_get(&pdev->dev);
>> -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
>> +	if (IS_ERR(i2c_imx->pinctrl)) {
>>   		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\=
n");
>>   		return PTR_ERR(i2c_imx->pinctrl);
>>   	}
> Side note: I'm not sure, this construct is valid. IIRC PTR_ERR should
> only be called for values x where IS_ERR(x) is true. Here it is at least
> surprising that an message hints to a problem but the return code is 0.
>
> @Julia: I'm sure coccinelle can find more of those?!
>
> Best regards
> Uwe
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
