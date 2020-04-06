From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 06 Apr 2020 06:54:29 +0000
Subject: Re: hwrng: omap - Delete an error message in of_get_omap_rng_device_details()
Message-Id: <e719f5df-a79d-fa91-e88f-ba32f1a64a69@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <eae7170c-4371-4865-7b85-589c0ed2b5b6@web.de>
 <2020040423261552036811@cmss.chinamobile.com>
 <e71d56f1-6fce-5e2d-9719-1385ef3b0811@web.de>
 <2020040505380926003012@cmss.chinamobile.com>
In-Reply-To: <2020040505380926003012@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?B?5ZSQ5b2s?= <tangbin@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> I don't know what is=C2=A0Coccinelle software, I will check it out.

I suggest to take another look at corresponding software development possib=
ilities.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/scr=
ipts/coccinelle/api/platform_get_irq.cocci

Do you find any information from previous clarification attempts interestin=
g?
Commit 7723f4c5ecdb8d832f049f8483beb0d1081cedf6
("driver core: platform: Add an error message to platform_get_irq*()"
by Stephen Boyd on 2019-07-29)

Are you looking for further collateral evolution?

Regards,
Markus
