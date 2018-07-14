From: David Miller <davem@davemloft.net>
Date: Sat, 14 Jul 2018 01:29:16 +0000
Subject: Re: [PATCH net] qlogic: check kstrtoul() for errors
Message-Id: <20180713.182916.383229511878562881.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712122345.dstjfogysfvfl2iq@kili.mountain>
In-Reply-To: <20180712122345.dstjfogysfvfl2iq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: harish.patil@cavium.com, himanshu.madhani@qlogic.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2018 15:23:45 +0300

> We accidentally left out the error handling for kstrtoul().
> 
> Fixes: a520030e326a ("qlcnic: Implement flash sysfs callback for 83xx adapter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
