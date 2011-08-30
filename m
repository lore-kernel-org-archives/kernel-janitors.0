From: "John W. Linville" <linville@tuxdriver.com>
Date: Tue, 30 Aug 2011 17:50:55 +0000
Subject: Re: [PATCH] net/mac80211/debugfs: Convert to kstrou8_from_user
Message-Id: <20110830175054.GB2660@tuxdriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1307478974-32727-1-git-send-email-peterhuewe@gmx.de>
 <201108282152.32180.PeterHuewe@gmx.de>
In-Reply-To: <201108282152.32180.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>
Cc: Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 28, 2011 at 09:52:31PM +0200, Peter H=FCwe wrote:
> Am Dienstag 07 Juni 2011, 22:36:14 schrieb Peter Huewe:
> > This patch replaces the code for getting an number from a
> > userspace buffer by a simple call to kstrou8_from_user.
> > This makes it easier to read and less error prone.
> >=20
> > Since the old buffer was only 10 bytes long and the value is masked by a
> > nibble-mask anyway, we don't need to use kstrtoul but rather kstrtou8.
> >=20
> > Kernel Version: v3.0-rc2
> >=20
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
>=20
> Any updates on this one?
> Still applies to the latest linus' tree

I merged it to wireless-next yesterday.

Thanks for the reminder!

John
--=20
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
