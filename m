From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Date: Mon, 16 Apr 2012 22:35:31 +0000
Subject: Re: [Q] warning BUG() related fixing and janitors question
Message-Id: <CALF0-+XuorNO=R3RhGjZy3kjk0yp=yzGPn5ZrbuwCuzAZQ_qKw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
In-Reply-To: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 16, 2012 at 7:16 PM, Marcin Ślusarz
<marcin.slusarz@gmail.com> wrote:
>
> It's better to replace it with:
> static inline int flat_set_persistent(unsigned long relval,
>                                                        unsigned long *persistent)
> {
>        return 0;
> }
>
> No warnings, same generated code, type safety.
> Look around the code. It's a very common pattern.
>

Yes, I guess you're right.
Plus it's even easier to understand than that #define in arch/sh.

Are these changes suitable, or am I being too picky?

Thanks both.
Ezequiel.
