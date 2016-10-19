From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 07:25:44 +0000
Subject: Re: Challenges around the usage of different "HOSTCFLAGS" for kernel build configuration and module 
Message-Id: <4fe8b518-6145-5322-a852-beeb61abd559@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
 <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
 <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
In-Reply-To: <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Can it be that the passing of the adjusted parameter "HOSTCFLAGS" has go=
t a significant
>> influence (with unwanted side effects) in this use case?
>=20
> That's probably it.  If I strip down your advanced original example to ju=
st
>=20
> make defconfig
> make HOSTCFLAGS=3D-S
>=20
> then I get a similar error:
>=20
>   HOSTCC  scripts/basic/fixdep
> scripts/basic/fixdep: 1: scripts/basic/fixdep: .file: not found
=E2=80=A6
> and so forth.

Thanks that you could reproduce my observation also with a simple example
on your test system.


> The problem is that, with -S, fixdep isn't build as an executable:
>=20
> jim@krebstar:~/linux-next/scripts/basic$ file fixdep
> fixdep: assembler source, ASCII text

Are you interested that a software generation parameter like "-S"
(for output of assembler source files) could be directly supported
for a special build variant?

* Does this issue indicate further development challenges?

* How are the chances that the involved software dependencies can be
  handled better in more detail?


> I'm guessing that in your original example you wanted to look at the
> assembly output gcc produced;

Yes. - I became interested in this use case once more.


> you'd probably have better luck using objdump for that.

This approach can occasionally work to some degree. I am looking for
a better (or more convenient) solution.

I got the impression that I need to put special build parameters into
the make files directly so far while I would prefer to pass extra settings
as command line arguments for the tool "make".

Will it make sense to distinguish such parameters for development phases
(or stages) like "kernel build configuration" and corresponding
"module generation" any more?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
