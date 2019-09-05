From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 13:32:34 +0000
Subject: Re: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set() error handling
Message-Id: <20190905133233.GF3093@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905095728.GA26005@mwanda>
 <20190905120626.hyegecmy6hf5lvhj@pengutronix.de>
 <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
In-Reply-To: <BC1CA967-2B9F-44A4-A1A9-FD9C6E874991@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 05, 2019 at 03:23:21PM +0300, Oleh Kravchenko wrote:
> Let me summarize the chronology of the last activities below:
> 1. I have sent the patch for the bugs that I have found by static analyze=
r at PVS-Studio
>     Date: Wed, 4 Sep 2019 00:18:19 +0300
>     https://www.spinics.net/lists/linux-leds/msg13181.html
>=20
> 2. At 5 Sep 2019 12:57:19 +0300 Time Dan Cartpen has sent the patch with =
the same proposal
> 3. Uwe Kleine-K=F6nig started to discuss his results of review by asking =
Dan on how he was found it.
>=20
> Would you mine if you will keep me as a Original author of this patch bas=
ed on fact 1?

Heh.

No, I didn't steal your patch.  :P  I am the author of the Smatch static
analysis tool and mostly fix things found by Smatch.  I don't use other
static analysis tools except to do a final QC of my patches.

It's super common for people to send duplicate fixes when it's based on
static analysis.  Most of the static analysis people hang out on
kernel-janitors so we don't send duplicate patches.  For a while people
were getting annoyed by all the duplicates but now they accept it as
their punishment for introducing a bug in the first place.

Anyway, the rule for kernel development is that normally the first
person's patch goes in, so we will take your patch.

regards,
dan carpenter
