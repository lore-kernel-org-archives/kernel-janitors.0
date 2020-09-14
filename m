From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 14 Sep 2020 17:49:52 +0000
Subject: Re: [PATCH] Input: imx6ul_tsc - clean up some errors in imx6ul_tsc_resume()
Message-Id: <20200914174952.GS1665100@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200905124942.GC183976@mwanda>
In-Reply-To: <20200905124942.GC183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 05, 2020 at 03:49:42PM +0300, Dan Carpenter wrote:
> If imx6ul_tsc_init() fails then we need to clean up the clocks.
> 
> I reversed the "if (input_dev->users) {" condition to make the code a
> bit simpler.
> 
> Fixes: 6cc527b05847 ("Input: imx6ul_tsc - propagate the errors")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

There is also an opportunity to factor out some common code from
open/close and suspend/resume, I'll send out a patch in a moment.

Thanks.

-- 
Dmitry
