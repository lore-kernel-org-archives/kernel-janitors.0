From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Mon, 16 Apr 2012 23:13:07 +0000
Subject: Re: [Q] warning BUG() related fixing and janitors question
Message-Id: <CA+GA0_u0D+vxfyTQAn9_R9yF-hLGUpEvARVmVUNFD_yxd4Lg+A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
In-Reply-To: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

2012/4/17 Ezequiel García <elezegarcia@gmail.com>:
> On Mon, Apr 16, 2012 at 7:16 PM, Marcin Ślusarz
> <marcin.slusarz@gmail.com> wrote:
>>
>> It's better to replace it with:
>> static inline int flat_set_persistent(unsigned long relval,
>>                                                        unsigned long *persistent)
>> {
>>        return 0;
>> }
>>
>> No warnings, same generated code, type safety.
>> Look around the code. It's a very common pattern.
>>
>
> Yes, I guess you're right.
> Plus it's even easier to understand than that #define in arch/sh.
>
> Are these changes suitable, or am I being too picky?

Well, it depends. If you see warnings from the code, go for it.
If there's none and code is trivial or in little used module, don't bother.
In other cases, it depends on the maintainer of changed code - some
maintainers apply cleanups eagerly, others... ignore them. You will soon
learn which subsystems to avoid :(

Little advice: You will learn more if you concentrate on improving
one subsystem. Find something that interest you and dive into the code.
Small cleanups are easy, but they should only be a warm up.

Marcin
