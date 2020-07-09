From: Ganapathi Bhat <ganapathi.bhat@nxp.com>
Date: Thu, 09 Jul 2020 03:43:37 +0000
Subject: RE: [EXT] [PATCH net-next] mwifiex: Prevent memory corruption handling keys
Message-Id: <VI1PR04MB4366F9D7F65F90569A1ACB308F640@VI1PR04MB4366.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200708115857.GA13729@mwanda>
In-Reply-To: <20200708115857.GA13729@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Amitkumar Karwar <amitkarwar@gmail.com>
Cc: Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, "John W. Linville" <linville@tuxdriver.com>, Bing Zhao <bzhao@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, Marc Yang <yangyang@marvell.com>, "frankh@marvell.com" <frankh@marvell.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

> The length of the key comes from the network and it's a 16 bit number.  It
> needs to be capped to prevent a buffer overflow.

Thank you for this change.

Acked-by: Ganapathi Bhat <ganapathi.bhat@nxp.com>

Regards,
Ganapathi
