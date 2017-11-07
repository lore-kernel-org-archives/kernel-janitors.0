From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 07 Nov 2017 12:49:48 +0000
Subject: Re: Sony-laptop: Adjustments for sony_nc_setup_rfkill()
Message-Id: <CAHp75VcU2+cbWDkt+6gd9+bHjxDpA-hA5KuQNVCn-AJr1SLANQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
 <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com>
 <340e5426-a9ba-2193-2735-85e918773785@users.sourceforge.net>
 <CAHp75VeyLnKG43g0LiDqirkehH4bLK7x216NV1+C8Oktp7D5UQ@mail.gmail.com> <2c1996c5-0833-dcd3-c747-62eca46a433d@users.sourceforge.net>
In-Reply-To: <2c1996c5-0833-dcd3-c747-62eca46a433d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

On Sun, Nov 5, 2017 at 4:20 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> Do you find the following details useful for further clarification?
>>>
>>> text: -32
>>> data: 0
>>> bss:  0

...

>> So, the main question is "WHY" you are doing this change.
>>
>> I didn't find any convinced explanation (yet?).
>
> Do you find a reduction of 32 bytes for the object code not interesting
> enough just by achieving such a small effect because of the replacement
> of three function calls “rfkill_destroy” with goto statements?

Okay, it's something.

Update a commit message in your patch, use bloat-o-meter (and put its
output to the commit message) and resend, we might reconsider then.

-- 
With Best Regards,
Andy Shevchenko
