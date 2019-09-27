From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:04:05 +0000
Subject: Re: [PATCH net] net: netsec: Fix signedness bug in netsec_probe()
Message-Id: <20190927.100405.1303962323198385596.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105638.GE3264@mwanda>
In-Reply-To: <20190925105638.GE3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jaswinder.singh@linaro.org, ilias.apalodimas@linaro.org, ast@kernel.org, daniel@iogearbox.net, jakub.kicinski@netronome.com, hawk@kernel.org, john.fastabend@gmail.com, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:56:38 +0300

> The "priv->phy_interface" variable is an enum and in this context GCC
> will treat it as an unsigned int so the error handling is never
> triggered.
> 
> Fixes: 533dd11a12f6 ("net: socionext: Add Synquacer NetSec driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
