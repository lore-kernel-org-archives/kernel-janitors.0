From: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Thu, 26 Nov 2020 23:52:08 +0000
Subject: Re: [PATCH] x86/cpu: correct values for GDT_ENTRY_INIT
Message-Id: <3d9f41b1-9687-4aae-ad7d-2e38a33132ba@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201126115459.28980-1-lukas.bulwahn@gmail.com>
 <947b02eb-536f-16a0-fbb1-87b62ab8c13e@citrix.com>
 <CAKXUXMybmC=JE3uDnekAuHfRUZcrzSLJ04xB3nR=3BqHCsNVqA@mail.gmail.com>
 <CALCETrUyoaJyJ8mGpq9bdanKKfHgjg_1B=N0rtmuHCmCP9Q9=g@mail.gmail.com>
In-Reply-To: <CALCETrUyoaJyJ8mGpq9bdanKKfHgjg_1B=N0rtmuHCmCP9Q9=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andy Lutomirski <luto@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Joerg Roedel <jroedel@suse.de>, "H . Peter Anvin" <hpa@zytor.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 26/11/2020 19:15, Andy Lutomirski wrote:
> On Thu, Nov 26, 2020 at 11:07 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> =
wrote:
>> On Thu, Nov 26, 2020 at 6:16 PM Andrew Cooper <andrew.cooper3@citrix.com=
> wrote:
>>> On 26/11/2020 11:54, Lukas Bulwahn wrote:
>>>> Commit 1e5de18278e6 ("x86: Introduce GDT_ENTRY_INIT()") unintentionally
>>>> transformed a few 0xffff values to 0xfffff (note: five times "f" inste=
ad of
>>>> four) as part of the refactoring.
>>> The transformation in that change is correct.
>>>
>>> Segment bases are 20 bits wide in x86,

I of course meant segment limits here, rather than bases.

>>> Does:
>>>
>>> diff --git a/arch/x86/include/asm/desc_defs.h
>>> b/arch/x86/include/asm/desc_defs.h
>>> index f7e7099af595..9561f3c66e9e 100644
>>> --- a/arch/x86/include/asm/desc_defs.h
>>> +++ b/arch/x86/include/asm/desc_defs.h
>>> @@ -22,7 +22,7 @@ struct desc_struct {
>>>
>>>  #define GDT_ENTRY_INIT(flags, base, limit)                     \
>>>         {                                                       \
>>> -               .limit0         =3D (u16) (limit),                \
>>> +               .limit0         =3D (u16) (limit) & 0xFFFF,       \
>>>                 .limit1         =3D ((limit) >> 16) & 0x0F,       \
>>>                 .base0          =3D (u16) (base),                 \
>>>                 .base1          =3D ((base) >> 16) & 0xFF,        \
>>>
>>> fix the warning?
>>>
>> Thanks, I will try that out, and try compiling a 32-bit kernel as well.
> You should also try comparing the objdump output before and after your
> patch.  objdump -D will produce bizarre output but should work.

Expanding on this a little, if that does indeed fix the sparse warning,
then I'd make an argument for this being a bug in sparse.=C2=A0 Explicitly
casting to u16 is semantically and intentionally identical to & 0xffff.

~Andrew
