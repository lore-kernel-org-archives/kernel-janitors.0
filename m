From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:57:45 +0000
Subject: Re: [PATCH 9/18] staging: rtl8723au: Use kmemdup instead of kmalloc + memcpy
Message-Id: <20140526155528.GA29520@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
 <1401117687-28911-10-git-send-email-benoit.taine@lip6.fr>
 <wrfjy4xo35qm.fsf@ultrasam.lan.trained-monkey.org>
In-Reply-To: <wrfjy4xo35qm.fsf@ultrasam.lan.trained-monkey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jes Sorensen <Jes.Sorensen@redhat.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 26/05/2014 17:43, Jes Sorensen wrote:
> Benoit Taine <benoit.taine@lip6.fr> writes:
> > This issue was reported by coccicheck using the semantic patch=20
> > at scripts/coccinelle/api/memdup.cocci
> >
> > Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
> > ---
> > Tested by compilation without errors.
> >
> >  drivers/staging/rtl8723au/hal/rtl8723a_hal_init.c |    3 +--
> >  drivers/staging/rtl8723au/os_dep/ioctl_cfg80211.c |   16 ++++++-------=
---
> >  2 files changed, 7 insertions(+), 12 deletions(-)
>=20
> Benoit,
>=20
> I believe this was already applied to staging-next - if you feel
> something is missing. Could you please re-diff against the latest
> staging-next tree.

Agreed, it is mostly 80 chars per line compliance. I will resend.

--=20
Beno=C3=AEt Taine
Master cycle intern
Regal Team. LIP6
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
