From: walter harms <wharms@bfs.de>
Date: Thu, 20 Jul 2017 16:30:20 +0000
Subject: Re: [PATCH] staging: pi433: fix bugs in register abstraction of rf69 chip
Message-Id: <5970DA9C.7070209@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <95873f94b04fbc67769c3fc0051d3304-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhbV34CV1E=-webmailer1@server02.webmailer.webmailer.hosteurope.de>
In-Reply-To: <95873f94b04fbc67769c3fc0051d3304-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhbV34CV1E=-webmailer1@server02.webmailer.webmailer.hosteurope.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 20.07.2017 18:08, schrieb Marcus Wolf:
> Hi Walter,
>  
> since the construction
> 
> WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN) |
> LNA_GAIN_MAX_MINUS_6) )
> aka
> WRITE_REG(regname, ( (READ_REG(regname) & ~regmask      ) | vale
>                ) )
> 
> is used nearly everywhere, I think, about using a more gneric macro like
> 
> #define READ_MODIFY_WRITE(reg, mask, value) /
>         WRITE_REG(reg, ((READ_REG(reg) & ~mask) | vale ))
> 
> 
> What do you think about it?

Yep, good idea.
personally i prefer functions because for a linux kernel the scope of
DEFINE is a bit large.

Small functions tend to be inlined by the compiler, so there is no speed
disadvatage. But this is a matter of taste and the maintainer has to maintain
whatever happens.

just my 2 cents
re,
 wh



> 
> Cheers,
> 
> Marcus
> 
>> walter harms <wharms@bfs.de> hat am 20. Juli 2017 um 14:22 geschrieben:
>>
>>
>>
>>
>> Am 19.07.2017 20:18, schrieb Wolf Entwicklungen:
>>> Bugfixes for rf69_set_modulation, rf69_set_deviation, rf69_set_lna_gain and
>>> rf69_get_lna_gain
>>> The fixes are cross-checked with the datasheet of the rfm69cw
>>>
>>> Fixes: 874bcba65f9a ("staging: pi433: New driver")
>>> Signed-off-by: Marcus Wolf <linux@wolf-entwicklungen.de>
>>>
>>> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
>>> --- a/drivers/staging/pi433/rf69.c
>>> +++ b/drivers/staging/pi433/rf69.c
>>> @@ -101,7 +101,7 @@ int rf69_set_modulation(struct spi_device *spi, enum
>>> modulation modulation)
>>>
>>> currentValue = READ_REG(REG_DATAMODUL);
>>>
>>> - switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE >> 3) // TODO
>>> improvement: change 3 to define
>>> + switch (currentValue & MASK_DATAMODUL_MODULATION_TYPE)
>>> {
>>> case DATAMODUL_MODULATION_TYPE_OOK: return OOK;
>>> case DATAMODUL_MODULATION_TYPE_FSK: return FSK;
>>> @@ -203,7 +203,7 @@ int rf69_set_deviation(struct spi_device *spi, u32
>>> deviation)
>>> lsb = (f_reg&0xff);
>>>
>>> // check msb
>>> - if (msb & !FDEVMASB_MASK)
>>> + if (msb & ~FDEVMASB_MASK)
>>> {
>>> dev_dbg(&spi->dev, "set_deviation: err in calc of msb");
>>> INVALID_PARAM;
>>> @@ -366,13 +366,13 @@ int rf69_set_lna_gain(struct spi_device *spi, enum
>>> lnaGain lnaGain)
>>> #endif
>>>
>>> switch(lnaGain) {
>>> - case automatic: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) & LNA_GAIN_AUTO) );
>>> - case max: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN)
>>> & LNA_GAIN_MAX) );
>>> - case maxMinus6: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_6) );
>>> - case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_12) );
>>> - case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_24) );
>>> - case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_36) );
>>> - case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) & LNA_GAIN_MAX_MINUS_48) );
>>> + case automatic: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) | LNA_GAIN_AUTO) );
>>> + case max: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) & ~MASK_LNA_GAIN)
>>> | LNA_GAIN_MAX) );
>>> + case maxMinus6: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_6) );
>>> + case maxMinus12: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_12) );
>>> + case maxMinus24: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_24) );
>>> + case maxMinus36: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_36) );
>>> + case maxMinus48: return WRITE_REG(REG_LNA, ( (READ_REG(REG_LNA) &
>>> ~MASK_LNA_GAIN) | LNA_GAIN_MAX_MINUS_48) );
>>> default: INVALID_PARAM;
>>> }
>>> }
>>
>>
>> looks resonable,
>> some nitpicking: perhaps you can can improve readability by using a helper
>> like:
>>
>> static int setstbit(int arg)
>> {
>> int get=READ_REG(REG_LNA) & ~MASK_LNA_GAIN;
>> return WRITE_REG( get| arg);
>>
>> }
>>
>> so this switch would be reduced to ...
>>
>> case maxMinus6: return setstbit(LNA_GAIN_MAX_MINUS_6);
>>
>> re,
>> wh
>>
>>
>>> @@ -387,7 +387,7 @@ enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
>>>
>>> currentValue = READ_REG(REG_LNA);
>>>
>>> - switch (currentValue & MASK_LNA_CURRENT_GAIN >> 3) // improvement: change
>>> 3 to define
>>> + switch (currentValue & MASK_LNA_GAIN)
>>> {
>>> case LNA_GAIN_AUTO: return automatic;
>>> case LNA_GAIN_MAX: return max;
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
