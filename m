From: Zang Roy-R61911 <r61911@freescale.com>
Date: Fri, 29 Oct 2010 02:28:09 +0000
Subject: RE: [patch] rtc: ds3232: remove unneeded check
Message-Id: <3850A844E6A3854C827AC5C0BEC7B60A2FC7F9@zch01exm23.fsl.freescale.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028140713.GF6062@bicker>
In-Reply-To: <20101028140713.GF6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> -----Original Message-----
> From: Dan Carpenter [mailto:error27@gmail.com]
> bcd2bin() returns unsigned values so they're never less than zero.  I
> asked Jack Lan and he said I could just remove that part of the check.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
> index 5706355..7767b4f 100644
> --- a/drivers/rtc/rtc-ds3232.c
> +++ b/drivers/rtc/rtc-ds3232.c
> @@ -289,14 +289,10 @@ static void ds3232_update_alarm(struct
i2c_client
> *client)
>  	if (ret < 0)
>  		goto unlock;
> 
> -	buf[0] = bcd2bin(buf[0]) < 0 || (ds3232->rtc->irq_data & RTC_UF)
?
> -								0x80 :
buf[0];
> -	buf[1] = bcd2bin(buf[1]) < 0 || (ds3232->rtc->irq_data & RTC_UF)
?
> -								0x80 :
buf[1];
> -	buf[2] = bcd2bin(buf[2]) < 0 || (ds3232->rtc->irq_data & RTC_UF)
?
> -								0x80 :
buf[2];
> -	buf[3] = bcd2bin(buf[3]) < 0 || (ds3232->rtc->irq_data & RTC_UF)
?
> -								0x80 :
buf[3];
> +	buf[0] = (ds3232->rtc->irq_data & RTC_UF) ? 0x80 : buf[0];
> +	buf[1] = (ds3232->rtc->irq_data & RTC_UF) ? 0x80 : buf[1];
> +	buf[2] = (ds3232->rtc->irq_data & RTC_UF) ? 0x80 : buf[2];
> +	buf[3] = (ds3232->rtc->irq_data & RTC_UF) ? 0x80 : buf[3];


Acked-by: Roy Zang <tie-fei.zang@freescale.com>

Thanks.
Roy

