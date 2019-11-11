From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 11 Nov 2019 21:00:23 +0000
Subject: Re: [1/4] pwm: omap-dmtimer: remove pwmchip in .remove before making it unfunctional
Message-Id: <2515600d-2f92-3e11-3bcc-c34ec63e29e2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191111071952.6pbswbboqreen6im@pengutronix.de>
 <20191111090357.13903-1-u.kleine-koenig@pengutronix.de>
 <dd3fe743-ee4a-153a-c044-40587568a494@web.de>
 <20191111200005.c37mecp44idxskjq@pengutronix.de>
In-Reply-To: <20191111200005.c37mecp44idxskjq@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Neil Brown <neilb@suse.de>, Neil Armstrong <narmstrong@baylibre.com>, kernel@pengutronix.de, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>>> In the old code (e.g.) mutex_destroy() was called before
>>> pwmchip_remove(). Between these two calls it is possible that a pwm
>>> callback is used which tries to grab the mutex.
>>
>> How do you think about to add a more “imperative mood” for your
>> change description?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c#n151
>
> I described the old behaviour and like my wording.

I find that the first paragraph contains useful information.
Would you like to specify any corresponding actions then
at this place?

Regards,
Markus
