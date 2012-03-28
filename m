From: David Miller <davem@davemloft.net>
Date: Wed, 28 Mar 2012 02:42:43 +0000
Subject: Re: [patch] mISDN: array underflow in open_bchannel()
Message-Id: <20120327.224243.1717299402560241334.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327072048.GC19008@elgon.mountain>
In-Reply-To: <20120327072048.GC19008@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, adobriyan@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Mar 2012 10:20:48 +0300

> There are two channels here.  User space starts counting channels at one
> but in the kernel we start at zero.  If the user passes in a zero
> channel that's invalid and could lead to memory corruption.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
