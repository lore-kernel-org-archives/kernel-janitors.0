From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 08 Aug 2016 09:11:49 +0000
Subject: Re: mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <20160808091149.GH5243@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e4eaf0b4-e539-b400-c8a2-70f210cee1fa@users.sourceforge.net>
 <75c1cc23-3a2d-db78-d0f2-b5934b18e828@users.sourceforge.net>
 <20160628150725.GL24982@dell>
 <c220895b-e56f-dc95-500d-0cf9d2f51777@users.sourceforge.net>
 <20160628163146.GG29166@dell>
 <69e96aa0-f3d9-d70d-c3ec-d39b5e9d9f14@users.sourceforge.net>
 <20160701091732.GK1707@dell>
 <8c0c2f06-4746-33d4-e40c-987ca3ca51dc@users.sourceforge.net>
 <20160805075016.GM5243@dell>
 <59b148eb-6a14-0721-7e4e-60b438fe8ec6@users.sourceforge.net>
In-Reply-To: <59b148eb-6a14-0721-7e4e-60b438fe8ec6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Fri, 05 Aug 2016, SF Markus Elfring wrote:

> > I'm unsure if you're not re-submitting because you're waiting for an
> > answer for me or not.
>=20
> I found your five commits (on 2016-06-29) for this patch series
> sufficient in principle.
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?=
id=D313cdde71ec9a5c327a515c37a0dca2cca00de5
>=20
>=20
> > If you are, here it is.  And, don't do that. :)
>=20
> I find this feedback a bit strange.
>=20
>=20
> > Please submit your patch-set *not* connected to this, now very
> > tangled web of submissions, complete with all the Acks you've
> > accrued.
>=20
> I would find it nice if another one of my update suggestions
> could be integrated after a bit of feedback evolved for a special
> source code search pattern.
>=20
> https://patchwork.kernel.org/patch/9199519/
> https://patchwork.kernel.org/patch/9208925/
> https://patchwork.kernel.org/patch/9210291/
>=20
> It seems to be harder to achieve acceptance similar to the others.

I'm not entirely sure what you're trying to say.

Please rebase all of your unaccepted patches on v4.8-rc1.  Apply any
Acks that you've collected along the way and re-submit the set.

Please ensure, when you re-submit, you do so using `git format-patch`
and `git send-email`.  Also ensure you do not send them attached to
any other patch that you've previously sent.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
