From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 23 Jan 2009 15:56:43 +0000
Subject: Re: [PATCH] Fix warning in aty128fb
Message-Id: <80b317760901230756h6c290d48r71e17116beeb9f2b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090120161859.GA31365@milesteg.arr>
In-Reply-To: <20090120161859.GA31365@milesteg.arr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2009/1/23 Richard Genoud <richard.genoud@gmail.com>:
> 2009/1/23 Daniele Venzano <venza@brownhat.org>:
>> I changed the patch to not define backlight only in case the driver is
>> compiled as module. Now it compiles both statically or as module without
>> errors or warnings.
>>
>> Patch is against 2.6.28.1
>>
>> Signed-off-by: Daniele Venzano <venza@brownhat.org>
>>
>> --- linux-2.6.28.1/drivers/video/aty/aty128fb.c.old     2009-01-20 16:08:06.000000000 +0100
>> +++ linux-2.6.28.1/drivers/video/aty/aty128fb.c 2009-01-23 11:34:16.000000000 +0100
>> @@ -360,8 +360,10 @@ static int mtrr = 1;
>>  #ifdef CONFIG_PMAC_BACKLIGHT
>>  static int backlight __devinitdata = 1;
>>  #else
>> +#ifndef MODULE
>>  static int backlight __devinitdata = 0;
>>  #endif
>> +#endif
>>
>>  /* PLL constants */
>>  struct aty128_constants {
>>
>
> [Added CC:Brad]
>
> Reviewed-by: Richard Genoud <richard.genoud@gmail.com>
>

sorry, there's still an error in the path (I reviewed a little bit to fast...).
the compilation breaks if "ATI Rage128 display support" is compile as
a module and "Support for backlight control (FB_ATY128_BACKLIGHT)" is
set
(cf line 1997)
