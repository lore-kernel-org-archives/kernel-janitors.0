From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 02 Jan 2011 21:57:29 +0000
Subject: Re: [PATCH 2/3] staging: keucr: Use memcpy() instead custom
Message-Id: <AANLkTin4jytjGGHex4FxzJ=vawT+DBjra=pd6eX31Kbt@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1294002097-3058-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1294002097-3058-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

>> +     if (err = 1)
>> +             memcpy(calculate_ecc, redundant_ecc, 3);
>> +
>> +     if (err = 0 || err = 2)
>> +             return 0;
>> +
>> +     return -1;
>>  }
>
> That's wrong. Before your change when correct_data returned 1 this function
> returned 0. Now it returns -1.
>
> Marcin
>
>

Yes, I'm preparing a new patchset that also corrects that. Thanks

-- 
Best regards,

-----------------------------------------
Javier Martínez Canillas
(+34) 682 39 81 69
