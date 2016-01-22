From: Joe Perches <joe@perches.com>
Date: Fri, 22 Jan 2016 18:05:26 +0000
Subject: Re: wireless-drivers: random cleanup patches piling up
Message-Id: <1453485926.13870.27.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com>
	 <1453423965.3856.22.camel@perches.com>
	 <87k2n1x0sf.fsf@kamboji.qca.qualcomm.com>
	 <20160122151211.GB1500@tuxdriver.com>
In-Reply-To: <20160122151211.GB1500@tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "John W. Linville" <linville@tuxdriver.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kbuild test robot <lkp@intel.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, 2016-01-22 at 10:12 -0500, John W. Linville wrote:
> On Fri, Jan 22, 2016 at 02:21:20PM +0200, Kalle Valo wrote:
> > Joe Perches <joe@perches.com> writes:
> >=20
> > > On Thu, 2016-01-21 at 16:58 +0200, Kalle Valo wrote:
> > > > Hi,
> > > >=20
> > > > I have quite a lot of random cleanup patches from new developers wa=
iting
> > > > in my queue:
> > > >=20
> > > > https://patchwork.kernel.org/project/linux-wireless/list/?state=10&=
delegate%621&order=DAte
> > > >=20
> > > > (Not all of them are cleanup patches, there are also few patches
> > > > deferred due to other reasons, but you get the idea.)
> > > >=20
> > > > These cleanup patches usually take quite a lot of my time and I'm
> > > > starting to doubt the benefit, compared to the time needed to dig
> > > > through them and figuring out what to apply. And this is of course =
time
> > > > away from other patches, so it's slowing down "real" development.
> > > >=20
> > > > I really don't know what to do. Part of me is saying that I just sh=
ould
> > > > drop them unless it's reviewed by a more experienced developer but =
on
> > > > the other hand this is a good way get new developers onboard.
> > > >=20
> > > > What others think? Are these kind of patches useful?
> > >=20
> > > Some yes, mostly not really.
> > >=20
> > > While whitespace style patches have some small value,
> > > very few of the new contributors that use tools like
> > > "scripts/checkpatch.pl -f" on various kernel files=A0
> > > actually continue on to submit actual defect fixing
> > > or optimization or code clarity patches.
> >=20
> > That's also my experience from maintaining wireless-drivers for a year,
> > this seems to be a "hit and run" type of phenomenon.
>=20
> Should we be looking for someone to run a "wireless-driver-cleanups"
> tree?=A0=A0They could handle the cleanups and trivial stuff, and send
> you a pull request a couple of times per release...?

If you are really interested in this sort of code cleanup,
and not in a new developer that might show up because of
a "my first kernel patch" process, maybe it'd be better
to do a preemptive run of something like:

$ git ls-files drivers/net/wireless | \
=A0 while read file ; do \
=A0 =A0 ./scripts/checkpatch.pl -f --fix-inplace --types=3Dspacing $file ; \
=A0 done

with git diff -w, compile every modified file, use objdiff, etc.
and a commit per subdirectory or driver.

A problem with that is checkpatch messages really aren't
dicta and there are some things that maybe look nicer
before the script mucks them up.

For instance, in the first file from that pass:

drivers/net/wireless/admtek/adm8211.c
[]
@@ -273,7 +273,7 @@ static void adm8211_write_sram_bytes(struct ieee80211_h=
w *dev
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
=A0=A0=A0=A0=A0=A0=A0=A0} else {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0for (i =3D 0; i < len; i +=
=3D 4) {
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u32 v=
al =3D (buf[i + 0] << 0 ) | (buf[i + 1] << 8 ) |
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0u32 v=
al =3D (buf[i + 0] << 0) | (buf[i + 1] << 8 ) |
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0(buf[i + 2] << 16) | (buf[i + 3] << 24);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0adm=
8211_write_sram(dev, addr + i / 4, val);
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}

You could reasonably argue that the "<< 0 )" was used
for alignment and doesn't need to be changed. =A0Perhaps
this should be "<< =A00)" instead.

But a better change would be not be a whitespace change
but "get_unaligned_le32(buf + i)", maybe removing the
temporary too.

And there's an equivalent change that could use
get_unaligned_le16 in the preceding block that
checkpatch doesn't flag.

Anyway, a trivial change like the first block I looked
at could be done automatically, but it really doesn't
improve the code much.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
