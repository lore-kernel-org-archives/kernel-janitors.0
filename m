From: David Miller <davem@davemloft.net>
Date: Fri, 15 Jul 2016 18:43:08 +0000
Subject: Re: [patch v2 -next] wan/fsl_ucc_hdlc: info leak in uhdlc_ioctl()
Message-Id: <20160715.114308.1901247006216834380.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <57876EE0.10603@bfs.de>
	<20160714111653.GA30452@mwanda>
In-Reply-To: <20160714111653.GA30452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: qiang.zhao@nxp.com, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, wharms@bfs.de

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 14:16:53 +0300

> There is a 2 byte struct whole after line.loopback so we need to clear
> that out to avoid disclosing stack information.
> 
> Fixes: c19b6d246a35 ('drivers/net: support hdlc function for QE-UCC')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: remove the other initialization to zero

Applied.
