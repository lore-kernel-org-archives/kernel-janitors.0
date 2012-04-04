From: David Miller <davem@davemloft.net>
Date: Wed, 04 Apr 2012 22:07:52 +0000
Subject: Re: [PATCH] Driver: Atm: Remove 'break' after 'return' statement.
Message-Id: <20120404.180752.1993156189941150780.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333453638-6235-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1333453638-6235-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santoshprasadnayak@gmail.com
Cc: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Tue,  3 Apr 2012 17:17:18 +0530

> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> 'break' is unnecessary after 'return' statement.
> Remove all such 'break' as clean up.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>

Applied, thanks.
