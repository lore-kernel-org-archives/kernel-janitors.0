From: =?ISO-8859-1?Q?=22L=2E_Alberto_Gim=E9nez=22?=
Date: Wed, 21 Oct 2009 21:18:40 +0000
Subject: Re: Fix sparse warning
Message-Id: <4ADF7AB0.6070009@sysvalve.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

I understand your point, but it's not clear to me that function scope
static variables are "bad".

On 10/21/2009 01:37 PM, Ingo Molnar wrote:
 > I made that change in 4a683bf9 intentionally. In the kernel we try to
> avoid function scope statics as much as possible:
>=20
>  - Overlooking them and confusing them with local, on-stack variables is =

>    very easy and we've had subtle bugs in the past due to that.

I think that changing your code to make it "bug-safe" is a bad idea. It
comes to my mind the ugly thing that some programmers do not to
overwrite their variables by mistake when they want to compare:

if (2 =3D myvar) {
	do_things();
}


>  - They end up in .data (or .bss) and to keep data storage/bloat under
>    control it's best to see all globally allocated variables at file=20
>    scope.

That makes sense. Anyway, in our example, the definitions begin at line
706. In my opinion, that does not help to increase visibility, and since
we have syntax-aware editors, the "static" thing should be seen easily.


>  - All such variables need proper locking, as they can be re-entered=20
>    from multiple CPUs (while local stack variables cannot and generally=20
>    dont need such locking). Moving them to file scope makes sure it's=20
>    all visible and makes sure proper locking is done.

The same thing about visibility applies as above. Moreover, I can't see
any explicit lock inside the main.c file. I haven't yet dig into the
functions that use those variables, but if they do acquire some kind of
lock, the visibility problem is the same. You are already in another
funcion, far away of the one that defines the static variables (or the
one that, like in this case, has the definition close to it), and maybe
in another file.

>=20
> All in one, there's a constant trend away from statics at function=20
> scope. It can be done correctly but is subtly fragile for the above=20
> reasons.

Indeed it may be fragile. And I'm sure that you've faced tons of bugs
because of declaring static variables in funcion scope and not having it
in mind when using those variables. I'm just a newbie and I have not
faced serious challenges about kernel development, but I think that
those "sanity" things should be fixed (I'm kind of standards taliban :)
), but I need your expertise to know *how* to fix it, from the point of
view of semantics and not just syntax.

Many thanks.


Regards,
--=20
L. Alberto Gim=E9nez
GnuPG key ID 0x3BAABDE1
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
