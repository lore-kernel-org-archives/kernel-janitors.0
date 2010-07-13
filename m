From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jul 2010 03:33:51 +0000
Subject: Re: [PATCH 3/3] xtsonic: free irq if sonic_open() fails
Message-Id: <20100712.203351.63038681.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278759704-7777-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278759704-7777-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, u.kleine-koenig@pengutronix.de, tj@kernel.org, joe@perches.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 15:01:44 +0400

> xtsonic_open() doesn't check sonic_open() return code. If it is error
> we must free requested IRQ.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
