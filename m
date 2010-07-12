From: David Miller <davem@davemloft.net>
Date: Mon, 12 Jul 2010 01:15:58 +0000
Subject: Re: [PATCH] at1700: fix double free_irq
Message-Id: <20100711.181558.45891981.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678686-7215-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278678686-7215-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, jpirko@redhat.com, joe@perches.com, shemminger@vyatta.com, eric.dumazet@gmail.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri,  9 Jul 2010 16:31:26 +0400

> free_irq() is called both in net_close() and cleanup_card().  Since it
> is requested in at1700_probe1(), leave free_irq() only in cleanup_card()
> for balance.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
