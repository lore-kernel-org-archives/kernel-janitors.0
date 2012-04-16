From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Date: Mon, 16 Apr 2012 21:12:07 +0000
Subject: Re: [Q] warning BUG() related fixing and janitors question
Message-Id: <CALF0-+VuoPA==o4DynZZwGWh22FY3_ZQy4f4CWh7M0AgnndH6w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
In-Reply-To: <CALF0-+VyPmN03xhkQ_aQf_Zdc+J=DT1_MvKzQCVri4Fwbi83RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

2012/4/16 Dan Carpenter <dan.carpenter@oracle.com>:
>
> Don't start messing in scheduler code if you have any doubts about
> what you are doing. =A0My advise is don't send a patch for this
> warning. =A0Most times people leave BUG() enabled so we don't really
> care about the warning.

Okey. Perhaps I picked the wrong example, there are a whole bunch of warnin=
gs
related to the same BUG() stuff, here's a template example:

void *p;

switch (something) {
  case a:
    p =3D foo();
  case b:
    p =3D bar();
  default:
    BUG();
}

dosomething(p);

--

This will trigger warning "p could be used uninitialized" or something.
I know most of us just leave BUG on, so you say these warnings aren't impor=
tant?

>> ---
>> 2.
>> Another one is flat_set_persistent() which is only IMO properly defined =
in
>> arch/sh/. The current
>> definition produces a warning in other architectures if binary flat form=
at
>> is used.
>>
>> So, I guess I should send a patch to each arch-specific list, right? usi=
ng
>> arch-specific git trees?
>> I would like to have just one git tree, and not ten :)
>
> I'm not sure what you mean here. =A0What is the warning? =A0It sounds
> like something is wrong in a Kconfig file.
>

I'll explain better. flat_set_persistent() is used by no-one, except
from blackfin arch
where it has something in it. So it gets defined to nothing in every
architecture, except
from blackfin.

Now, arch/sh/include/asm/flat.h defines it like:

#define    flag_set_persisten(relval,p)    { (void)p; 0; })

while the rest of them just defines it to zero:

#define    flag_set_persisten(relval,p)    0

This will cause a warning for unused variable p, in fs/binfmt_flat.c
and IMO the arch/sh is doing it right (just to avoid the warning).

I tested both definitions with bloat-o-metering and it showed no
extra code.

Do you see my point now?

Thanks for your help,
Ezequiel.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
