From: Christer Beskow <chbe@kvaser.com>
Date: Tue, 06 Aug 2019 06:43:40 +0000
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check on trigger
Message-Id: <c45f56e6-9448-7023-8eca-703cb1c5050e@kvaser.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190725112509.1075-1-colin.king@canonical.com>
In-Reply-To: <20190725112509.1075-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org


Den 2019-08-05 kl. 09:21, skrev Christer Beskow:
> On 2019-08-02 14:12,  Marc Kleine-Budde wrote:
>> On 8/2/19 2:07 PM, Marc Kleine-Budde wrote:
>>> Adding the Author(s) to Cc.
>>>
>>> On 7/25/19 1:25 PM, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The check to see if trigger is less than zero is always false, trigger
>>>> is always in the range 0..255.  Hence the check is redundant and can
>>>> be removed.
>>>>
>>>> Addresses-Coverity: ("Logically dead code")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>   drivers/net/can/kvaser_pciefd.c | 3 ---
>>>>   1 file changed, 3 deletions(-)
>>>>
>>>> diff --git a/drivers/net/can/kvaser_pciefd.c 
>>>> b/drivers/net/can/kvaser_pciefd.c
>>>> index 3af747cbbde4..68e00aad0810 100644
>>>> --- a/drivers/net/can/kvaser_pciefd.c
>>>> +++ b/drivers/net/can/kvaser_pciefd.c
>>>> @@ -652,9 +652,6 @@ static void kvaser_pciefd_pwm_stop(struct 
>>>> kvaser_pciefd_can *can)
>>>>       top = (pwm_ctrl >> KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT) & 0xff;
>>>>         trigger = (100 * top + 50) / 100;
>> As Walter pointed out the above code makes no sense in the first place.
>>
>>>> -    if (trigger < 0)
>>>> -        trigger = 0;
>>>> -
>> Can someone have a deeper look at this code section and decide what to
>> do with this finding.
>
> I will look at this at once and come back with a patch later today.
>
>>>>       pwm_ctrl = trigger & 0xff;
>>>>       pwm_ctrl |= (top & 0xff) << KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT;
>>>>       iowrite32(pwm_ctrl, can->reg_base + KVASER_PCIEFD_KCAN_PWM_REG);
>>>>
To set the duty cycle to zero (i.e. pwm_stop), the trigger value shall 
be equal to the top value.

This is achieved by reading the value of the top bit field from the pwm 
register and then writing back this value to the trigger and top bit 
fields.

The current code is, as you all pointed out, a bit cumbersome. I will 
send a new patch in a new thread.

regards

Christer
