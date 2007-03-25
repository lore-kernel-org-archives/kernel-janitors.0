From: Mike Isely <isely@isely.net>
Date: Sun, 25 Mar 2007 22:16:21 +0000
Subject: Re: [KJ] [PATCH] dvb: remove coding style comments on indentation
Message-Id: <Pine.LNX.4.64.0703251702560.15083@cnc.isely.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-1463811561-386511452-1174860981=:15083"
List-Id: <kernel-janitors.vger.kernel.org>
References: <4606E766.3090100@linuxtv.org>
In-Reply-To: <4606E766.3090100@linuxtv.org>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811561-386511452-1174860981=:15083
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


The setting I know is called indent-tabs-mode, not c-indent-tabs-mode. =20
It's also not better or worse than c-basic-offset; it's complementary. =20
The following all work together:

1. indent-tabs-mode if not nil instructs emacs to fill with tab=20
characters where it can.  If this setting it nil, indentation is done=20
only with space characters.

2. c-basic-offset specifies the number of columns to indent by -=20
independant of how / if tabs are being used.

3. tab-width specifies the number of columns defined by a tab character.

Thus for (a contrived) example, if you did this:

indent-tabs-mode t
c-basic-offset 4
tab-width 8

Then every indentation level is 4 columns, and tabs will be used=20
wherever 8 columns of total indentation can be combined.  Said another=20
way, the first level of indentation would be 4 spaces, the next level=20
would be 1 tab, the next level would be 1 tab plus 4 spaces, etc.

Obviously that is probably not what anyone would want, but it should=20
illustrate the relationship among those settings.  So just "eliminating"=20
c-basic-offset and replacing it with indent-tabs-mode doesn't accomplish=20
what one might expect.

I think it's good form to have all those settings in a source file (with=20
c-basic-offset set to 8 not four like the example above).  It's not=20
redundant with the documented style.  It causes anyone who loads the=20
file with emacs to automatically adopt the indentation conventions=20
intended for that source file and that has to be a good thing.

I for one work in environments other than v4l-dvb, and those other=20
environments don't always have the same coding style.  To me it makes=20
perfect sense that the coding style can be encoded into the source file=20
itself.  Then I don't have to worry about manually reconfiguring my=20
editor setup when moving in/out of v4l-dvb work.  One can argue against=20
this sort of thing (i.e. I should just worry about this myself and=20
always manually switch), but then you're just opening the door for more=20
indentation accidents in the future.  I would much prefer these sorts of=20
things to be in the source file; at least this way it helps to ensure=20
others (who use emacs) will automatically use the same indentation that=20
is already in the file.

  -Mike


On Sun, 25 Mar 2007, Michael Krufky wrote:

> Bernd Petrovitsch wrote:
> > On Sun, 2007-03-25 at 17:19 -0400, Michael Krufky wrote:
> >> Charles Cl=E9ment wrote:
> >>> Remove comments on setting indentation for emacs in bt8xx driver.
> >> What do we gain by this patch?  The "c-basic-offset: 8" helps us
> >> to enforce tabbing style.  Why would anybody want this removed?
> >=20
> > I don't know.
> >=20
> > Adding "c-indent-tabs-mode: t" is probably even better.
> >=20
>=20
> Then, in my opinion, it would be better to submit a patch that makes that
> change, instead of removing them altogether.
>=20
> Regards,
>=20
> Mike Krufky
>=20
> --
> video4linux-list mailing list
> Unsubscribe mailto:video4linux-list-request@redhat.com?subject=3Dunsubscr=
ibe
> https://www.redhat.com/mailman/listinfo/video4linux-list
>=20

--=20
                        |         Mike Isely          |     PGP fingerprint
     Spammers Die!!     |                             | 03 54 43 4D 75 E5 C=
C 92
                        |   isely @ pobox (dot) com   | 71 16 01 E2 B5 F5 C=
1 E8
                        |                             |
---1463811561-386511452-1174860981=:15083
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

---1463811561-386511452-1174860981=:15083--
