From: Daniel Barkalow <barkalow@iabervon.org>
Date: Fri, 23 Oct 2009 20:33:04 +0000
Subject: Re: Write and Submit Your First Kernel Patch
Message-Id: <alpine.LNX.2.00.0910231621550.14365@iabervon.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1547844168-581943078-1256329969=:14365"
List-Id: <kernel-janitors.vger.kernel.org>
References: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
In-Reply-To: <dc1d0f40910231146y14028f4el9753debdf334103@mail.gmail.com>
To: =?ISO-8859-15?Q?Kevyn-Alexandre_Par=E9?= <kevyn.alexandre.pare@gmail.com>
Cc: linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, git@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1547844168-581943078-1256329969=:14365
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.LNX.2.00.0910231633001.14365@iabervon.org>

On Fri, 23 Oct 2009, Kevyn-Alexandre Par=E9 wrote:

> Hi,
>=20
> Just before I send my patch I got this error with:
> ./scripts/checkpatch.pl --terse --file
> 0001-Staging-comedi-driver-fix-coding-style.patch

You're using checkpatch --file on a patch. I hope you don't intend your=20
patch to be added to the kernel source as a file, but rather applied to=20
the kernel source, changing other files. (I bet "gcc 0001-Staging*.patch"=20
will get interesting errors, too...) The patch format adds a single=20
character at the beginning of each line to say whether it's a addition, a=20
deletion, or a context line, and the context lines are identified by a=20
space character. This means that a blank context line consists of just=20
this space character, which is therefore a trailing space. We get the same =

type of complaints when we have expected diff output in our test scripts.

I'm kind of surprised that checkpatch doesn't completely blow up when it's =

expecting a source file and getting a patch (and maybe tell you what=20
you've done). But that's the source of your errors, anyway.

	-Daniel
*This .sig left intentionally blank*
--1547844168-581943078-1256329969=:14365--
