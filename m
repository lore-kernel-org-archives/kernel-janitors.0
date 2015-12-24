From: David Miller <davem@davemloft.net>
Date: Thu, 24 Dec 2015 16:02:10 +0000
Subject: Re: [patch] qlcnic: fix a loop exit condition better
Message-Id: <20151224.110210.773566977565532234.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151215201734.GJ5177@mwanda>
	<20151224092122.GG29642@mwanda>
In-Reply-To: <20151224092122.GG29642@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Dept-GELinuxNICDev@qlogic.com, netdev@vger.kernel.org, manish.chopra@qlogic.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Dec 2015 12:21:22 +0300

> In the original code, if we succeeded on the last iteration through the
> loop then we still returned failure.
> 
> Fixes: 389e4e04ad2d ('qlcnic: fix a timeout loop')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
