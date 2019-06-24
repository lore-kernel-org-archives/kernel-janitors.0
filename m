From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 24 Jun 2019 09:07:59 +0000
Subject: Re: [PATCH][next] clocksource: davinci-timer: fix memory leak of clockevent on error return
Message-Id: <c80982ee-c1e1-2f12-ad75-90f1fe6c9bae@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617113109.24689-1-colin.king@canonical.com>
 <CAMpxmJVxg2+2mdAQDSo5LTq=w7+ccXnwRmK+iz=4zkNhepE6pQ@mail.gmail.com>
 <20190624090339.GW28859@kadam>
In-Reply-To: <20190624090339.GW28859@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 24/06/2019 10:03, Dan Carpenter wrote:
> On Mon, Jun 24, 2019 at 10:28:10AM +0200, Bartosz Golaszewski wrote:
>> pon., 17 cze 2019 o 13:31 Colin King <colin.king@canonical.com> napisa=
=C5=82(a):
>>>
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> Currently when the call to request_irq falls there is a memory leak of
>>> clockevent on the error return path. Fix this by kfree'ing clockevent.
>>>
>>> Addresses-Coverity: ("Resource leak")
>>> Fixes: fe3b8194f274 ("clocksource: davinci-timer: add support for clock=
events")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  drivers/clocksource/timer-davinci.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/clocksource/timer-davinci.c b/drivers/clocksource/=
timer-davinci.c
>>> index a9ca02390b66..8512f12e250a 100644
>>> --- a/drivers/clocksource/timer-davinci.c
>>> +++ b/drivers/clocksource/timer-davinci.c
>>> @@ -300,6 +300,7 @@ int __init davinci_timer_register(struct clk *clk,
>>>                          "clockevent/tim12", clockevent);
>>>         if (rv) {
>>>                 pr_err("Unable to request the clockevent interrupt");
>>> +               kfree(clockevent);
>>>                 return rv;
>>>         }
>>>
>>> --
>>> 2.20.1
>>>
>>
>> Hi Colin,
>>
>> I omitted the error checking in this driver on purpose - it doesn't
>> make sense as the system won't boot without a timer.
>=20
> One way to silence these static checker warnings is to use
> "GFP_KERNEL | __GFP_NOFAIL".

/me notes that down to for future reference, thanks again Dan for your
wise input.

>=20
> regards,
> dan carpenter
>=20
