From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 Nov 2019 13:47:48 +0000
Subject: Re: [PATCH 4/4] pwm: omap-dmtimer: Allow compiling with COMPILE_TEST
Message-Id: <f01b3443-9dcc-6485-4a05-a658d93326da@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111071952.6pbswbboqreen6im@pengutronix.de>
 <20191111090357.13903-1-u.kleine-koenig@pengutronix.de>
 <20191111090357.13903-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20191111090357.13903-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Brown <neilb@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, kernel@pengutronix.de, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> The dependency on OMAP_DM_TIMER is only a runtime dependency. Also
> OMAP_DM_TIMER cannot be enabled without ARCH_OMAP being enabled.

Will a more “imperative mood” become relevant also for this change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c#n151

Regards,
Markus
