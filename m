From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 22 Jan 2016 15:54:12 +0000
Subject: Re: wireless-drivers: random cleanup patches piling up
Message-Id: <87si1pvcd7.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com>
	<1453423965.3856.22.camel@perches.com>
	<87k2n1x0sf.fsf@kamboji.qca.qualcomm.com>
	<20160122151211.GB1500@tuxdriver.com>
In-Reply-To: <20160122151211.GB1500@tuxdriver.com> (John W. Linville's message
	of "Fri, 22 Jan 2016 10:12:12 -0500")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Joe Perches <joe@perches.com>, linux-wireless@vger.kernel.org, kbuild test robot <lkp@intel.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

"John W. Linville" <linville@tuxdriver.com> writes:

> On Fri, Jan 22, 2016 at 02:21:20PM +0200, Kalle Valo wrote:
>> Joe Perches <joe@perches.com> writes:
>>=20
>> > On Thu, 2016-01-21 at 16:58 +0200, Kalle Valo wrote:
>> >> Hi,
>> >>=20
>> >> I have quite a lot of random cleanup patches from new developers wait=
ing
>> >> in my queue:
>> >>=20
>> >> https://patchwork.kernel.org/project/linux-wireless/list/?state=10&de=
legate%621&order=DAte
>> >>=20
>> >> (Not all of them are cleanup patches, there are also few patches
>> >> deferred due to other reasons, but you get the idea.)
>> >>=20
>> >> These cleanup patches usually take quite a lot of my time and I'm
>> >> starting to doubt the benefit, compared to the time needed to dig
>> >> through them and figuring out what to apply. And this is of course ti=
me
>> >> away from other patches, so it's slowing down "real" development.
>> >>=20
>> >> I really don't know what to do. Part of me is saying that I just shou=
ld
>> >> drop them unless it's reviewed by a more experienced developer but on
>> >> the other hand this is a good way get new developers onboard.
>> >>=20
>> >> What others think? Are these kind of patches useful?
>> >
>> > Some yes, mostly not really.
>> >
>> > While whitespace style patches have some small value,
>> > very few of the new contributors that use tools like
>> > "scripts/checkpatch.pl -f" on various kernel files=C2=A0
>> > actually continue on to submit actual defect fixing
>> > or optimization or code clarity patches.
>>=20
>> That's also my experience from maintaining wireless-drivers for a year,
>> this seems to be a "hit and run" type of phenomenon.
>
> Should we be looking for someone to run a "wireless-driver-cleanups"
> tree?  They could handle the cleanups and trivial stuff, and send
> you a pull request a couple of times per release...?

Not a bad idea! But I don't think we need a separate tree as applying
patches from patchwork is easy. It should be doable that we add an
account to patchwork and whenever I see a this type of trivial cleanup
patch I'll assign it to the cleanup maintainer and whenever he/she
thinks it's ready he assigns the patch back to me and I'll apply it.

The only difficult part is finding a victim/volunteer to
do that ;)

--=20
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
