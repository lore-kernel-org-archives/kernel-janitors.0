From: David Miller <davem@davemloft.net>
Date: Mon, 30 May 2016 05:32:58 +0000
Subject: Re: [patch] ptp: oops in ptp_ioctl()
Message-Id: <20160529.223258.480260903888395056.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160526064622.GA6776@mwanda>
In-Reply-To: <20160526064622.GA6776@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: richardcochran@gmail.com, falakreyaz@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 May 2016 09:46:22 +0300

> If we pass ERR_PTR(-EFAULT) to kfree() then it's going to oops.
> 
> Fixes: 2ece068e1b1d ('ptp: use memdup_user().')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
