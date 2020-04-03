From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 03 Apr 2020 08:45:21 +0000
Subject: Re: [PATCH] crypto: amlogic - Delete duplicate dev_err in meson_crypto_probe()
Message-Id: <e1916128-6554-ea57-49ef-e4ad7b0d7229@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>, "David S. Miller" <davem@davemloft.net>

> In this place,

I suggest to omit such a wording from the change description.


> when something goes wrong, platform_get_irq() will
> print an error message,

This information is helpful here.


> so in order to avoid the situation of repeat output，

Possible adjustments:
* Separate sentences

* “repeated output”


> we should remove dev_err here.

Thus remove a redundant function call.


How do you think about to change any more source files in a systematic way?

Regards,
Markus
