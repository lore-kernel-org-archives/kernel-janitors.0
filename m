From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 31 Oct 2017 14:24:05 +0000
Subject: Re: [PATCH] Sony-laptop: Use common error handling code in sony_nc_setup_rfkill()
Message-Id: <dadb7068-e4ed-b91d-ce31-aca2d6afd9f3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
In-Reply-To: <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Apparently this patch done without reading the actual code.

I performed another simple software refactoring.


> NAK.
> 
> -1 is EPERM which sounds wrong here. If you would like to fix it,
> propagate a real error codes from sony_call_snc_handle().

I do not know at the moment why an error code which you find
questionable was suggested by Marco Chiappero on 2012-05-19
and committed by Matthew Garrett on 2012-05-31 (according the
commit d6f15ed876b83a1a0eba1d0473eef58acc95444a: use soft rfkill
status stored in hw).


>>         if (!rfk)
>>                 return -ENOMEM;
> 
> Okay error code.

Can any other identifier make more sense there?


>> -       }
>> +       if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0)
>> +               goto destroy_rfk;
>> +
>>         hwblock = !(result & 0x1);
>>
>>         if (sony_call_snc_handle(sony_rfkill_handle,
>> -                               sony_rfkill_address[nc_type],
>> -                               &result) < 0) {
>> -               rfkill_destroy(rfk);
>> -               return -1;
> 
> Not okay and it might be different from previous case.

The shown function call was repeated with an other parameter.
Which error reporting would you find more appropriate then?


> P.S. Don't bother us with patches on which you didn't do your home work.

Do we occasionally need to distinguish better between an ordinary
refactoring and the adjustments for additional software improvements?

Regards,
Markus
