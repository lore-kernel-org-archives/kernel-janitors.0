From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 23:23:10 +0000
Subject: Re: [PATCH] can: Delete unnecessary checks before the macro call =?iso-2022-jp?B?GyRCIUgbKEJkZXZfa2Z
Message-Id: <20190822.162310.1544602687585865172.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <27674907-fd2a-7f0c-84fd-d8b5124739a9@web.de>
In-Reply-To: <27674907-fd2a-7f0c-84fd-d8b5124739a9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus.Elfring@web.de
Cc: linux-can@vger.kernel.org, netdev@vger.kernel.org, allison@lohutok.net, lkml@metux.net, gregkh@linuxfoundation.org, gustavo@embeddedor.com, lukas@wunner.de, mkl@pengutronix.de, sean@geanix.com, tglx@linutronix.de, houweitaoo@gmail.com, wg@grandegger.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 21:30:11 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 21 Aug 2019 21:16:15 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
