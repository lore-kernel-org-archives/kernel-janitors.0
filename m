From: Christer Beskow <chbe@kvaser.com>
Date: Mon, 05 Aug 2019 07:21:17 +0000
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check on trigger
Message-Id: <db550f33-fac6-5e2b-c623-3587976e2d51@kvaser.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190725112509.1075-1-colin.king@canonical.com>
In-Reply-To: <20190725112509.1075-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2019-08-02 14:12,=C2=A0 Marc Kleine-Budde wrote:
> On 8/2/19 2:07 PM, Marc Kleine-Budde wrote:
>> Adding the Author(s) to Cc.
>>
>> On 7/25/19 1:25 PM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The check to see if trigger is less than zero is always false, trigger
>>> is always in the range 0..255.  Hence the check is redundant and can
>>> be removed.
>>>
>>> Addresses-Coverity: ("Logically dead code")
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>   drivers/net/can/kvaser_pciefd.c | 3 ---
>>>   1 file changed, 3 deletions(-)
>>>
>>> diff --git a/drivers/net/can/kvaser_pciefd.c b/drivers/net/can/kvaser_p=
ciefd.c
>>> index 3af747cbbde4..68e00aad0810 100644
>>> --- a/drivers/net/can/kvaser_pciefd.c
>>> +++ b/drivers/net/can/kvaser_pciefd.c
>>> @@ -652,9 +652,6 @@ static void kvaser_pciefd_pwm_stop(struct kvaser_pc=
iefd_can *can)
>>>   	top =3D (pwm_ctrl >> KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT) & 0xff;
>>>  =20
>>>   	trigger =3D (100 * top + 50) / 100;
> As Walter pointed out the above code makes no sense in the first place.
>
>>> -	if (trigger < 0)
>>> -		trigger =3D 0;
>>> -
> Can someone have a deeper look at this code section and decide what to
> do with this finding.

I will look at this at once and come back with a patch later today.

>>>   	pwm_ctrl =3D trigger & 0xff;
>>>   	pwm_ctrl |=3D (top & 0xff) << KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT;
>>>   	iowrite32(pwm_ctrl, can->reg_base + KVASER_PCIEFD_KCAN_PWM_REG);
>>>
> regards,
> Marc

regards,

Christer Beskow
