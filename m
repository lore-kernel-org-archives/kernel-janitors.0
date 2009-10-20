From: walter harms <wharms@bfs.de>
Date: Tue, 20 Oct 2009 07:24:24 +0000
Subject: Re: Fix sparse warning
Message-Id: <4ADD65A8.4090500@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



L. Alberto Gim=C3=A9nez schrieb:
> Hi,
>=20
> I'm starting to do some cleanup for the project, and I'd like to begin
> fixing sparse errors.
>=20
> By the way, at first glance, it seems that the warnings that sparse
> catches may need some depth look (i.e. not a newbiew) not to mess things.
>=20
> For example, my first compilation sparse checking throws this:
>=20
>=20
> init/main.c:763:13: warning: symbol 'call' shadows an earlier one
> init/main.c:710:31: originally declared here
> init/main.c:793:13: warning: symbol 'call' shadows an earlier one
> init/main.c:710:31: originally declared here
>=20
> If you take a look at the code, the global "call" variable is defined as:
>=20
> static struct boot_trace_call call;
>=20
> And what makes sparse whine is a local variable definition, totally
> unrelated (i think):
>=20
> static void __init do_initcalls(void)
> {
>     initcall_t *call;
>=20
>     for (call =3D __early_initcall_end; call < __initcall_end; call++)
>         do_one_initcall(*call);
>=20
>     /* Make sure there is no pending stuff from the initcall sequence */
>     flush_scheduled_work();
> }
>=20
> So, it seems that I could "fix" this by changing the local variable
> name. The question is: is this _really_ needed apart from "code
> hygiene"? Should I "fix" (if you agree to call that "to fix") that issue?
>=20
> Or would you otherwise recommend me to start with the official janitor
> TODO list and address more mechanical work at first? Thanks in advance.
>=20


Having two variables with the same name is bad practice at least.
But before renaming "initcall_t *call;" (the easy way) you should check
if the global "struct boot_trace_call call;" really really is needed (globa=
l is evil).

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
