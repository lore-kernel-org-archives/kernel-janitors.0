From: David Miller <davem@davemloft.net>
Date: Tue, 15 Dec 2015 18:13:41 +0000
Subject: Re: [patch v2] qlcnic: fix a timeout loop
Message-Id: <20151215.131341.175421419282676757.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BLUPR11MB0114ED16EBE57CC01FD9797393EE0@BLUPR11MB0114.namprd11.prod.outlook.com>
	<20151215135616.GA18851@mwanda>
In-Reply-To: <20151215135616.GA18851@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Dept-GELinuxNICDev@qlogic.com, manish.chopra@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, rajesh.borundia@qlogic.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 16:56:16 +0300

> The problem here is that at the end of the loop we test for if
> idc->vnic_wait_limit is zero, but since idc->vnic_wait_limit-- is a
> post-op, it actually ends up set to (u8)-1.  I have fixed this by
> moving the decrement inside the loop.
> 
> Fixes: 486a5bc77a4a ('qlcnic: Add support for 83xx suspend and resume.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
