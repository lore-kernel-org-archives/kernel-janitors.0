From: Joe Perches <joe@perches.com>
Date: Fri, 22 Jan 2016 00:52:45 +0000
Subject: Re: wireless-drivers: random cleanup patches piling up
Message-Id: <1453423965.3856.22.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wpr3x9ln.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: kbuild test robot <lkp@intel.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, 2016-01-21 at 16:58 +0200, Kalle Valo wrote:
> Hi,
>=20
> I have quite a lot of random cleanup patches from new developers waiting
> in my queue:
>=20
> https://patchwork.kernel.org/project/linux-wireless/list/?state=10&delega=
te%621&order=DAte
>=20
> (Not all of them are cleanup patches, there are also few patches
> deferred due to other reasons, but you get the idea.)
>=20
> These cleanup patches usually take quite a lot of my time and I'm
> starting to doubt the benefit, compared to the time needed to dig
> through them and figuring out what to apply. And this is of course time
> away from other patches, so it's slowing down "real" development.
>=20
> I really don't know what to do. Part of me is saying that I just should
> drop them unless it's reviewed by a more experienced developer but on
> the other hand this is a good way get new developers onboard.
>=20
> What others think? Are these kind of patches useful?

Some yes, mostly not really.

While whitespace style patches have some small value,
very few of the new contributors that use tools like
"scripts/checkpatch.pl -f" on various kernel files=A0
actually continue on to submit actual defect fixing
or optimization or code clarity patches.

Whitespace patches, where git diff -w does not show
any difference and objdiff on the objects for a few
randconfigs are identical, maybe could be sifted
into a separate category from other patches.

Maybe the kbuild test robot could help identify the
whitespace style
patches that can be easily applied.

Maybe the kernel-janitors list should be used and
also maybe some maintainers that want these style
patches could opt-in to getting these applied after
some milestone like an -rc1.

Fengguang?

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
