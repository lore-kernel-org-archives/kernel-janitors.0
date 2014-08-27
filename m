From: David Miller <davem@davemloft.net>
Date: Wed, 27 Aug 2014 23:29:11 +0000
Subject: Re: [PATCH net-next] bnx2x: Fix static checker warning regarding `txdata_ptr'
Message-Id: <20140827.162911.2304971595773773996.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1409037881-4192-1-git-send-email-Yuval.Mintz@qlogic.com>
In-Reply-To: <1409037881-4192-1-git-send-email-Yuval.Mintz@qlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval.Mintz@qlogic.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Ariel.Elior@qlogic.com, dan.carpenter@oracle.com

From: Yuval Mintz <Yuval.Mintz@qlogic.com>
Date: Tue, 26 Aug 2014 10:24:41 +0300

> Incorrect checking of array instead of array contents in panic_dump
> flow - results of commit e261199872a2 ("bnx2x: Safe bnx2x_panic_dump()").
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yuval Mintz <Yuval.Mintz@qlogic.com>

Applied, thanks.
