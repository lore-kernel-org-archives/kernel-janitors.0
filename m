From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Tue, 26 Jan 2016 05:40:23 +0000
Subject: Re: wireless-drivers: random cleanup patches piling up
Message-Id: <20160126052823.GA2053@sudip-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com>
 <1453423965.3856.22.camel@perches.com>
 <87k2n1x0sf.fsf@kamboji.qca.qualcomm.com>
 <20160122151211.GB1500@tuxdriver.com>
 <87si1pvcd7.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87si1pvcd7.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, Joe Perches <joe@perches.com>, linux-wireless@vger.kernel.org, kbuild test robot <lkp@intel.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jan 22, 2016 at 05:54:12PM +0200, Kalle Valo wrote:
> "John W. Linville" <linville@tuxdriver.com> writes:
>=20
> > On Fri, Jan 22, 2016 at 02:21:20PM +0200, Kalle Valo wrote:
> >> Joe Perches <joe@perches.com> writes:
> >>=20
> >> > On Thu, 2016-01-21 at 16:58 +0200, Kalle Valo wrote:
> >> >> Hi,
> >> >>=20
> >> >> I have quite a lot of random cleanup patches from new developers wa=
iting
> >> >> in my queue:
> >> >>=20
> >> >> https://patchwork.kernel.org/project/linux-wireless/list/?state=10&=
delegate%621&order=DAte
> >> >>=20
> >> >> (Not all of them are cleanup patches, there are also few patches
> >> >> deferred due to other reasons, but you get the idea.)
> >> >>=20
> >> >> These cleanup patches usually take quite a lot of my time and I'm
> >> >> starting to doubt the benefit, compared to the time needed to dig
> >> >> through them and figuring out what to apply. And this is of course =
time
> >> >> away from other patches, so it's slowing down "real" development.
> >> >>=20
> >> >> I really don't know what to do. Part of me is saying that I just sh=
ould
> >> >> drop them unless it's reviewed by a more experienced developer but =
on
> >> >> the other hand this is a good way get new developers onboard.
> >> >>=20
> >> >> What others think? Are these kind of patches useful?
> >> >
> >> > Some yes, mostly not really.
> >> >
> >> > While whitespace style patches have some small value,
> >> > very few of the new contributors that use tools like
> >> > "scripts/checkpatch.pl -f" on various kernel files=A0
> >> > actually continue on to submit actual defect fixing
> >> > or optimization or code clarity patches.
> >>=20
> >> That's also my experience from maintaining wireless-drivers for a year,
> >> this seems to be a "hit and run" type of phenomenon.
> >
> > Should we be looking for someone to run a "wireless-driver-cleanups"
> > tree?  They could handle the cleanups and trivial stuff, and send
> > you a pull request a couple of times per release...?
>=20
> Not a bad idea! But I don't think we need a separate tree as applying
> patches from patchwork is easy. It should be doable that we add an
> account to patchwork and whenever I see a this type of trivial cleanup
> patch I'll assign it to the cleanup maintainer and whenever he/she
> thinks it's ready he assigns the patch back to me and I'll apply it.
>=20
> The only difficult part is finding a victim/volunteer to
> do that ;)

I can be a volunteer (victim?). Though i donot know much about
wireless-drivers, but I do know a little about cleanup patches.
And maybe, in the process I will start knowing wireless-drivers.

regards
sudip
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
