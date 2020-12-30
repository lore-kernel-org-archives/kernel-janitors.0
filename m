From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 30 Dec 2020 12:50:44 +0000
Subject: Re: [PATCH v3] regmap: debugfs: Fix a memory leak when calling regmap_attach_dev
Message-Id: <X+x3pIanr18Ep4ga@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201229105046.41984-1-xiaolei.wang@windriver.com>
 <d516efdd-7e66-13fe-3798-cdea5ff012dc@web.de>
 <PH0PR11MB5077EC74C0A81ABF8F082BC795D70@PH0PR11MB5077.namprd11.prod.outlook.com>
 <1503f5fa-1ad6-7675-6e02-6dc1eb04c1de@web.de>
In-Reply-To: <1503f5fa-1ad6-7675-6e02-6dc1eb04c1de@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Xiaolei Wang <Xiaolei.Wang@windriver.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>, Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Wed, Dec 30, 2020 at 01:01:42PM +0100, Markus Elfring wrote:
> > Thank you very much, very good suggestion,
>=20
> Thanks for another positive feedback.
>=20
>=20
> > do I need to re-send a patch to fix this problem, or modify the previou=
s patch and send it again?
>=20
> Please convince the involved contributors to integrate a corrected patch =
version.
>=20
> * Better indentation.
>=20
> * =E2=80=A6
> >> +		if (!map->debugfs_name)
> >> +			kfree(map->debugfs_name);
>=20
>   Would this questionable null pointer check result in a memory leak?

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
