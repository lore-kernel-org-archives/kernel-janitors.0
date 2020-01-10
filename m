From: Paul Burton <paulburton@kernel.org>
Date: Fri, 10 Jan 2020 19:36:06 +0000
Subject: Re: [PATCH 08/10] MIPS: use resource_size
Message-Id: <5e18d227.1c69fb81.44066.9d0d@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Ralf Baechle <ralf@linux-mips.org>

Hello,

Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
>=20
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>

Applied to mips-next.

> commit ecb983790fe8
> https://git.kernel.org/mips/c/ecb983790fe8
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
