From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 09 Jan 2020 14:32:57 +0000
Subject: Re: [PATCH] trace: code optimization
Message-Id: <20200109093257.681271c9@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <27225bf0ec9b4e2f3d313456aee75e294361d550.1578561009.git.liuyang34@xiaomi.com>
        <4f4bed1d-9dc0-0665-4b61-8afc9ebf8201@web.de>
In-Reply-To: <4f4bed1d-9dc0-0665-4b61-8afc9ebf8201@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: yangliuxm34@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, liuyang34@xiaomi.com, Ingo Molnar <mingo@redhat.com>

On Thu, 9 Jan 2020 14:16:46 +0100
Markus Elfring <Markus.Elfring@web.de> wrote:

> > use scnprintf instead of snprinr and no need to check =20
>=20
> Will a typo be avoided in the final change description?
>=20
>=20
> > Signed-off-by: liuyang34 =E2=80=A6 =20
>=20
> Will this information need also an adjustment for the desired specificati=
on
> of a real name?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=B07f636fca1c8fbba124b0082487=
c0b3890a0e0c#n458
>=20

Correct. Please resend the patch with the typo fix and a real name for
the Signed-off-by.

Thanks!

-- Steve
