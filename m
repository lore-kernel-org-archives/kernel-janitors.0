From: David Miller <davem@davemloft.net>
Date: Sat, 02 Aug 2014 22:28:38 +0000
Subject: Re: [patch] dm9000: NULL dereferences on error in probe()
Message-Id: <20140802.152838.10096907007372226.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801082357.GC28869@mwanda>
In-Reply-To: <20140801082357.GC28869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: grant.likely@linaro.org, robh+dt@kernel.org, andrew.ruder@elecsyscorp.com, nikita@compulab.co.il, grinberg@compulab.co.il, paul.gortmaker@windriver.com, jg1.han@samsung.com, ebiederm@xmission.com, michael.abbott@diamond.ac.uk, Baohua.Song@csr.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 1 Aug 2014 11:23:57 +0300

> The dm9000_release_board() function is called with NULL ->data_req and
> ->addr_req pointers if dm9000_probe() fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks Dan.
