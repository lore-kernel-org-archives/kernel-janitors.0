From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2019 13:03:44 +0000
Subject: Re: [PATCH -next] mmc: aspeed: Fix return value check in aspeed_sdc_probe()
Message-Id: <20190826130343.GA23584@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
In-Reply-To: <20190826120013.183435-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org

> Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
                        ^^^^
When we're adding new files, could we use the prefix for the new driver
instead of just the subsystem?  "mmc: aspeed: Add new driver"?
Otherwise it's tricky to know what people want for the driver.

I just wrote this same patch and I swear I would have sent my patch
earlier but I spent hours thinking about the patch prefix and then the
census people came to the house and delayed me even more.

regards,
dan carpenter
