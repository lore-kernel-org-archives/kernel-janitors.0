From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jun 2020 06:42:08 +0000
Subject: Re: [PATCH v3] i2c: imx-lpi2c: Fix runtime PM imbalance in lpi2c_imx_master_enable()
Message-Id: <77448b13-9233-20a8-5e68-a8830314c27d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, Fugang Duan <fugang.duan@nxp.com>, kernel@pengutronix.de, linux-imx@nxp.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, kernel-janitors@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>

> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a corresponding decrement is
> needed on the error handling path to keep the counter balanced.
>
> Fix this by adding the missed function call.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function “pm_runtime_get_sync” failed. Thus decrement it also
   in an error case so that the reference counting is kept consistent.


Regards,
Markus
