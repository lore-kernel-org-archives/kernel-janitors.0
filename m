From: Oleh Kravchenko <oleg@kaa.org.ua>
Date: Thu, 05 Sep 2019 12:39:38 +0000
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set() error handling
Message-Id: <78d23283-47b3-9333-ea65-9763404a9bcf@kaa.org.ua>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
In-Reply-To: <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Jacek,

> 5 вер. 2019 р. о 3:06 пп Uwe Kleine-König <u.kleine-koenig@pengutronix.de> написав(ла):
> 
> Hello,
> 
> On Thu, Sep 05, 2019 at 12:57:28PM +0300, Dan Carpenter wrote:
>> The problem is we set "led_cdev->trigger = NULL;" and then dereference
>> it when we call write_lock_irqsave():
>> 
>> 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
>>                            ^^^^^^^^^^^^^^^^^
>> 
>> Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Obviously right. Thanks for catching.
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> Did you find this at runtime or by using some static checker?

Let me summarize the chronology of the last activities below:
1. I have sent the patch for the bugs that I have found by static
analyzer at PVS-Studio
    Date: Wed, 4 Sep 2019 00:18:19 +0300
    https://www.spinics.net/lists/linux-leds/msg13181.html

2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with
the same proposal

3. Uwe Kleine-König started to discuss his results of review by asking
Dan on how he was found it.

Would you mine if you will keep me as a Original author of this patch
based on fact 1?

Best regards,
Oleh Kravchenko

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
