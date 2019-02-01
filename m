From: David Miller <davem@davemloft.net>
Date: Fri, 01 Feb 2019 18:00:37 +0000
Subject: Re: [PATCH net] skge: potential memory corruption in skge_get_regs()
Message-Id: <20190201.100037.598653933076417364.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201082816.GB8459@kadam>
In-Reply-To: <20190201082816.GB8459@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: mlindner@marvell.com, stephen@networkplumber.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 1 Feb 2019 11:28:16 +0300

> The "p" buffer is 0x4000 bytes long.  B3_RI_WTO_R1 is 0x190.  The value
> of "regs->len" is in the 1-0x4000 range.  The bug here is that
> "regs->len - B3_RI_WTO_R1" can be a negative value which would lead to
> memory corruption and an abrupt crash.
> 
> Fixes: c3f8be961808 ("[PATCH] skge: expand ethtool debug register dump")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
