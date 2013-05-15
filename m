From: David Miller <davem@davemloft.net>
Date: Wed, 15 May 2013 21:54:23 +0000
Subject: Re: [patch] ipg: fix an unsigned widening cast of '~' truncation issue
Message-Id: <20130515.145423.1386765446739602879.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130515072002.GD20381@elgon.mountain>
In-Reply-To: <20130515072002.GD20381@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: romieu@fr.zoreil.com, sorbica@icplus.com.tw, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2013 10:20:02 +0300

> The bug here is this code from ipg_nic_hard_start_xmit():
> 
> 	txfd->tfc &= cpu_to_le64(~IPG_TFC_TFDDONE);
> 
> IPG_TFC_TFDDONE is 0x0000000080000000 so it's an unsigned int.  The
> negated value is 0x7fffffff but 0xffffffff7fffffff was intended.
> 
> The other values in this file don't need to be changed but I did it for
> consistency.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
