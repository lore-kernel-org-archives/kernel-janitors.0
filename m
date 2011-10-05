From: David Miller <davem@davemloft.net>
Date: Wed, 05 Oct 2011 21:52:39 +0000
Subject: Re: [patch] bnx2x: remove some dead code
Message-Id: <20111005.175239.2083304914393777254.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111005054918.GC32077@elgon.mountain>
In-Reply-To: <20111005054918.GC32077@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: eilong@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 5 Oct 2011 08:49:18 +0300

> This code is after the break statement so it never gets used.  The
> "vlan_mac_obj" variable does get initialized properly, so we can just
> delete this.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
