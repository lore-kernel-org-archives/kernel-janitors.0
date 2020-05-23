From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 23 May 2020 14:34:56 +0000
Subject: Re: [PATCH v2 4/5] net: devres: provide devm_register_netdev()
Message-Id: <c9e4bd02-5f29-de36-245f-edc7c4868208@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrew Perepech <andrew.perepech@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>, Edwin Peer <edwin.peer@broadcom.com>, Fabien Parent <fparent@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>, John Crispin <john@phrozen.org>, Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pedro Tsai <pedro.tsai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Stephane Le Provost <stephane.leprovost@mediatek.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

…
> +++ b/net/devres.c
> @@ -38,3 +38,58 @@ struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
…
> + *	This is a devres variant of register_netdev() for which the unregister
> + *	function will be call automatically when the managing device is

Is the following wording variant more appropriate?

+ *	function will be automatically called when the managing device is


Regards,
Markus
