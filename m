From: Wolfram Sang <wsa@sang-engineering.com>
Date: Fri, 01 Aug 2014 18:16:20 +0000
Subject: Re: [patch] can: c_can: checking IS_ERR() instead of NULL
Message-Id: <53DBD974.3000307@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801085344.GA31702@mwanda>
In-Reply-To: <20140801085344.GA31702@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wolfgang Grandegger <wg@grandegger.com>, George Cherian <george.cherian@ti.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thor Thayer <tthayer@altera.com>, Pavel Machek <pavel@denx.de>, Mugunthan V N <mugunthanvnm@ti.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-can@vger.kernel.org, kernel-janitors@vger.kernel.org

> Fixes: 33cf75656923 ('can: c_can_platform: Fix raminit, use devm_ioremap() instead of devm_ioremap_resource()')

Reverting this patch is the correct solution. Its approach is totally 
bogus anyhow.


