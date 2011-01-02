From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 02 Jan 2011 21:21:36 +0000
Subject: Re: [PATCH 1/3] staging: keucr: Use memcmp() instead custom
Message-Id: <AANLkTinyHKVt+SYSu3gaZwuShtfKBb9grWFeu=1=T6+_@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1294002097-3058-2-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1294002097-3058-2-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>>  int Check_D_ReadError(BYTE *redundant)
>>  {
>> -    // Driver 䣰 ECC Check
>> -    return(SUCCESS);
>> -    if (!StringCmp((char *)(redundant+0x0D),(char *)EccBuf,3))
>> -        if (!StringCmp((char *)(redundant+0x08),(char *)(EccBuf+0x03),3))
>> -            return(SUCCESS);
>> +     /* Driver ECC Check */
>> +     if (memcmp(redundant + 0x0D, EccBuf, 3) ||
>> +         memcmp(redundant + 0x08, EccBuf + 0x03, 3))
>> +             return ERROR;
>>
>> -    return(ERROR);
>> +     return SUCCESS;
>>  }
>
> This code isn't the same.
>
> Before, the return was always SUCCESS and the code
> after the first return was ignored.
>
> You deleted that return and now you do the driver ECC check.
> Is that correct?
>

You are right Joe, sorry for that. Should I remove the dead code after
the return SUCCESS or keep it?

-- 
Best regards,

-----------------------------------------
Javier Martínez Canillas
(+34) 682 39 81 69
