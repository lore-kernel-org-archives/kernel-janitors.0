From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Nov 2017 14:20:09 +0000
Subject: Re: Sony-laptop: Adjustments for sony_nc_setup_rfkill()
Message-Id: <2c1996c5-0833-dcd3-c747-62eca46a433d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
 <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com>
 <340e5426-a9ba-2193-2735-85e918773785@users.sourceforge.net>
 <CAHp75VeyLnKG43g0LiDqirkehH4bLK7x216NV1+C8Oktp7D5UQ@mail.gmail.com>
In-Reply-To: <CAHp75VeyLnKG43g0LiDqirkehH4bLK7x216NV1+C8Oktp7D5UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

>> Do you find the following details useful for further clarification?
>>
>> text: -32
>> data: 0
>> bss:  0
> 
> ...but kernel is compiled with -O2 which,

Did you try to compare results for my update suggestion also with
the default build configuration?


> I suppose, will eliminate these repeats.

My build results did not fit to your expectations.


> So, the main question is "WHY" you are doing this change.
> 
> I didn't find any convinced explanation (yet?).

Do you find a reduction of 32 bytes for the object code not interesting
enough just by achieving such a small effect because of the replacement
of three function calls “rfkill_destroy” with goto statements?

Regards,
Markus
