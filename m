From: WANG Cong <xiyou.wangcong@gmail.com>
Date: Tue, 24 Jul 2007 13:32:12 +0000
Subject: Re: [KJ][PATCH]dev->mem_start default value (~0) test (final go)
Message-Id: <20070724133212.GB3505@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46A5C2FE.6040602@codefidence.com>
In-Reply-To: <46A5C2FE.6040602@codefidence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Jul 24, 2007 at 03:03:14PM +0200, H??kon L??vdal wrote:
>On 24/07/07, Ravid Baruch Naali <ravid@codefidence.com> wrote:
>>
>>-       if (dev->mem_start)
>>+       /*dev->mem_start can also be ~0 which is the default*/
>>+       if (dev->mem_start && dev->mem_start !=3D ~0)
>>                dev->mem_end =3D dev->mem_start + EL2_MEMSIZE;
>>
>
>In my oppinion there are three ways to write code:
>
>1. Write unreadable code
>
>       if (answer =3D 42)
>
>2. Write unreadable code and try to comment it readable
>
>       if (answer =3D 42)    // life, the universe and everything
>
>3. Write readable code
>       #define LIFE_THE_UNIVERSE_AND_EVERYTHING 42
>       ...
>       if (answer =3D LIFE_THE_UNIVERSE_AND_EVERYTHING)
>

Are you also a fan of The Hitchhiker=A1=AFs Guide to the Galaxy?

It's really a good science fiction.

>
>I think your patch would be better by not hardcoding ~0 with
>a corresponding comment.
>

I recommend the book named "The Practice of Programming" for you.
It tells you how to write readable and nice code.

--=20
To do great work, you have to have a pure mind. You can think only about the
mathematics. Everything else is human weakness. Accepting prizes is showing
weakness.

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will b=
e discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructio=
ns.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
