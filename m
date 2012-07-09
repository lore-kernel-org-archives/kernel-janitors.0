From: David Miller <davem@davemloft.net>
Date: Mon, 09 Jul 2012 07:16:34 +0000
Subject: Re: [patch] [AX.25]: small cleanup in ax25_addr_parse()
Message-Id: <20120709.001634.1183046288317502958.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120705082718.GA14993@elgon.mountain>
In-Reply-To: <20120705082718.GA14993@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 Jul 2012 11:27:18 +0300

> The comments were wrong here because "AX25_MAX_DIGIS" is 8 but the
> comments say 6.  Also I've changed the "7" to "AX25_ADDR_LEN".
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
