From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 04 Apr 2020 12:00:36 +0000
Subject: Re: [PATCH v6] crypto: amlogic - Delete duplicate dev_err() in meson_crypto_probe()
Message-Id: <25715704-5648-77c9-96d5-0639280e796c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>, "David S. Miller" <davem@davemloft.net>

> When something goes wrong, platform_get_irq() will print an error message,

This information is reasonable.


> so in order to avoid the situation of repeat output，

Possible adjustments:
* Separate sentences

* Avoid another typo: “repeated output”


> we should remove dev_err here.

Thus remove a redundant function call.
(An imperative wording is usually preferred for Linux commit messages.)

Regards,
Markus
