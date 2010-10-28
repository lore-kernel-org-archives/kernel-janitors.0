From: Dan Carpenter <error27@gmail.com>
Date: Thu, 28 Oct 2010 08:55:22 +0000
Subject: Re: bug report: signedness issue in ds3232_update_alarm()
Message-Id: <20101028085522.GA6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101028083503.GZ6062@bicker>
In-Reply-To: <20101028083503.GZ6062@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Jack's email <jack.lan@freescale.com> is dead.  B25806, could you take
a look?

regards,
dan carpenter

On Thu, Oct 28, 2010 at 10:35:03AM +0200, Dan Carpenter wrote:
> Hi Jack,
> 
> This code was added in f46418c5cadf "drivers/rtc/rtc-ds3232.c: add alarm
> function".  Smatch complains because bcd2bin() returns an unsigned so
> it's never less than zero and the whole block is a no-op.  I'm not sure
> what was intended here, could you take a look?
> 
> drivers/rtc/rtc-ds3232.c +292 ds3232_update_alarm(13)
> 	warn: unsigned 'bcd2bin(buf[0])' is never less than zero.
>    291
>    292          buf[0] = bcd2bin(buf[0]) < 0 || (ds3232->rtc->irq_data & RTC_UF) ?
>    293									0x80 : buf[0];
>    294          buf[1] = bcd2bin(buf[1]) < 0 || (ds3232->rtc->irq_data & RTC_UF) ?
>    295									0x80 : buf[1];
>    296          buf[2] = bcd2bin(buf[2]) < 0 || (ds3232->rtc->irq_data & RTC_UF) ?
>    297									0x80 : buf[2];
>    298          buf[3] = bcd2bin(buf[3]) < 0 || (ds3232->rtc->irq_data & RTC_UF) ?
>    299									0x80 : buf[3];
>    300
> 
> regards,
> dan carpenter
