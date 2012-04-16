From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Mon, 16 Apr 2012 22:16:47 +0000
Subject: Re: [Q] warning BUG() related fixing and janitors question
Message-Id: <CA+GA0_uV5_P7OqNO1d3nkei5whP1Rk_WL-sC2A_0DU8P-Q50gw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
In-Reply-To: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

2012/4/16 Ezequiel García <elezegarcia@gmail.com>:
> I'll explain better. flat_set_persistent() is used by no-one, except
> from blackfin arch
> where it has something in it. So it gets defined to nothing in every
> architecture, except
> from blackfin.
>
> Now, arch/sh/include/asm/flat.h defines it like:
>
> #define    flag_set_persisten(relval,p)    { (void)p; 0; })
>
> while the rest of them just defines it to zero:
>
> #define    flag_set_persisten(relval,p)    0
>
> This will cause a warning for unused variable p, in fs/binfmt_flat.c
> and IMO the arch/sh is doing it right (just to avoid the warning).
>
> I tested both definitions with bloat-o-metering and it showed no
> extra code.

It's better to replace it with:
static inline int flat_set_persistent(unsigned long relval,
							unsigned long *persistent)
{
	return 0;
}

No warnings, same generated code, type safety.
Look around the code. It's a very common pattern.

Marcin
