From: David Miller <davem@davemloft.net>
Date: Mon, 12 Jul 2010 01:15:52 +0000
Subject: Re: [PATCH] ac3200: fix error path
Message-Id: <20100711.181552.91332689.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278678489-7053-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278678489-7053-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri,  9 Jul 2010 16:28:09 +0400

> Do not call free_irq() if request_irq() failed.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
