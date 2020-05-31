From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 07:01:38 +0000
Subject: Re: [PATCH v2] i2c: imx-lpi2c: Fix runtime PM imbalance on error in lpi2c_imx_master_enable()
Message-Id: <845a11a9-51ed-cc7c-350f-b319111f32ee@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-imx@nxp.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Kangjie Lu <kjlu@umn.edu>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>

> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.

* How do you think about to replace the word “pairing” by “corresponding”?

* Will it be helpful to add an imperative wording?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=ffeb595d84811dde16a28b33d8a7cf26d51d51b3#n151

* Would you like to add the tag “Fixes” to the commit message?

* Are you going to take such possibilities into account for any more patches?

Regards,
Markus
