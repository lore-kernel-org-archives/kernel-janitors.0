From: "Andrew Jeffery" <andrew@aj.id.au>
Date: Mon, 26 Aug 2019 23:49:17 +0000
Subject: =?UTF-8?Q?Re:_[PATCH_-next]_mmc:_aspeed:_Fix_return_value_check_in_aspee?= =?UTF-8?Q?d=5Fsdc=5Fprobe
Message-Id: <629128e7-cc91-412f-8946-668fac2eb3b9@www.fastmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190826120013.183435-1-weiyongjun1@huawei.com>
 <20190826130343.GA23584@kadam>
In-Reply-To: <20190826130343.GA23584@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-aspeed@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org



On Mon, 26 Aug 2019, at 22:34, Dan Carpenter wrote:
> > Fixes: 09eed7fffd33 ("mmc: Add support for the ASPEED SD controller")
>                         ^^^^
> When we're adding new files, could we use the prefix for the new driver
> instead of just the subsystem?  "mmc: aspeed: Add new driver"?
> Otherwise it's tricky to know what people want for the driver.

I don't have any issue with the request, but I don't understand this last
bit. What do you mean by "it's tricky to know what people want for the
driver"?

Andrew
