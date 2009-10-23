From: Michal Nazarewicz <mina86@tlen.pl>
Date: Fri, 23 Oct 2009 19:41:33 +0000
Subject: Re: Write and Submit Your First Kernel Patch
Message-Id: <87vdi5uccy.fsf@erwin.mina86.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
	<87zl7hudn4.fsf@erwin.mina86.com>
	<dc1d0f40910231219l600d3579i57c7580fe798d445@mail.gmail.com>
In-Reply-To: <dc1d0f40910231219l600d3579i57c7580fe798d445@mail.gmail.com>
	("Kevyn-Alexandre =?utf-8?Q?Par=C3=A9=22's?= message of "Fri, 23 Oct 2009
 15:19:32
	-0400")
To: Kevyn-Alexandre =?utf-8?Q?Par=C3=A9?= <kevyn.alexandre.pare@gmail.com>
Cc: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, git@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

>> Kevyn-Alexandre Par=C3=A9 <kevyn.alexandre.pare@gmail.com> writes:
>>> 0001-Staging-comedi-driver-fix-coding-style.patch:27: ERROR: trailing w=
hitespace
>>> 0001-Staging-comedi-driver-fix-coding-style.patch:35: ERROR: trailing w=
hitespace
>>> 0001-Staging-comedi-driver-fix-coding-style.patch:43: ERROR: trailing w=
hitespace
>>> 0001-Staging-comedi-driver-fix-coding-style.patch:53: ERROR: trailing w=
hitespace
>>>
>>> I have done a step by step explanation of what I have done:
>>> http://kapare.blogspot.com/2009/09/write-and-submit-your-first-kernel.h=
tml>>
>>> It seem to me that the whitespace are added after I do this command:
>>> git format-patch -s -n master..mybranch

> On Fri, Oct 23, 2009 at 3:13 PM, Michal Nazarewicz <mina86@tlen.pl> wrote:
>> Do "git rebase --whitespace=3Dfix master" and git will try to fix whites=
paces.

Kevyn-Alexandre Par=C3=A9 <kevyn.alexandre.pare@gmail.com> writes:
> thx Michal,
>
> But the problem remain:

If I'm not mistaken "git rebase --whitespace=3Dfix master" should do the
trick.  I'm out of good ideas if it does not.  Best I can advice is to
fix the patch by hand -- just edit it in some decent editor and remove
trailing whitespaces from those lines.

=2D-=20
Best regards,                                         _     _
 .o. | Liege of Serenly Enlightened Majesty of      o' \,=3D./ `o
 ..o | Computer Science,  Michal "mina86" Nazarewicz   (o o)
 ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEARECAAYFAkriBvEACgkQUyzLALfG3x535wCfXiB4Rz1/uNltpt4jPUd2fn8c
aAoAnAhCF4je11wA2ABlNjfxYkiwsqwO
=0e6t
-----END PGP SIGNATURE-----
--=-=-=--
