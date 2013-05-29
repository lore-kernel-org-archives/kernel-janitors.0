From: walter harms <wharms@bfs.de>
Date: Wed, 29 May 2013 17:34:39 +0000
Subject: Re: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <51A63C2F.30203@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529070150.GC25133@debian>
In-Reply-To: <20130529070150.GC25133@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 29.05.2013 18:59, schrieb Bryan Wu:
> On Wed, May 29, 2013 at 12:45 AM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
>> On Wed, May 29, 2013 at 09:21:00AM +0200, walter harms wrote:
>>>
>>>
>>> Am 29.05.2013 09:02, schrieb Dan Carpenter:
>>>> Static checkers complain that this is declared as an unsigned long
>>>> but we only ever use the low 32 bits (ignoring sign expansion).
>>>> But from the context, it should just be an unsigned short.
>>>>
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>
>>>> diff --git a/drivers/leds/leds-renesas-tpu.c b/drivers/leds/leds-renesas-tpu.c
>>>> index 9483f1c..fe1fbd0 100644
>>>> --- a/drivers/leds/leds-renesas-tpu.c
>>>> +++ b/drivers/leds/leds-renesas-tpu.c
>>>> @@ -93,7 +93,8 @@ static inline void r_tpu_write(struct r_tpu_priv *p, int reg_nr,
>>>>  static void r_tpu_start_stop_ch(struct r_tpu_priv *p, int start)
>>>>  {
>>>>     struct led_renesas_tpu_config *cfg = p->pdev->dev.platform_data;
>>>> -   unsigned long flags, value;
>>>> +   unsigned long flags;
>>>> +   unsigned short value;
>>>>
>>>
>>>
>>> When it is using the lower 32bit may "int" is better ?
>>
>> The static checkers think it's using the lower 32 bits, but it's
>> actually using the lower 16 bits.
>>
> 
> Is "u16" better? I think we can replace all the unsigned short value
> to u16 value.
> 

int would be a more "natural" choice.

re,
 wh

