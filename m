From: David Miller <davem@davemloft.net>
Date: Mon, 12 Jan 2015 20:40:50 +0000
Subject: Re: [patch -next] net: eth: xgene: devm_ioremap() returns NULL on error
Message-Id: <20150112.154050.544393600960931935.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150108105211.GB10597@mwanda>
In-Reply-To: <20150108105211.GB10597@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isubramanian@apm.com, fkan@apm.com, kchudgar@apm.com, grant.likely@linaro.org, robh+dt@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Jan 2015 13:52:12 +0300

> devm_ioremap() returns NULL on failure, it doesn't return an ERR_PTR.
> 
> Fixes: de7b5b3d790a ('net: eth: xgene: change APM X-Gene SoC platform ethernet to support ACPI')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
