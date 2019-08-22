From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 23:23:04 +0000
Subject: Re: [PATCH] mISDN: Delete unnecessary checks before the macro call =?iso-2022-jp?B?GyRCIUgbKEJkZXZfa
Message-Id: <20190822.162304.1167740070295559909.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <689e51d5-9a43-45a4-5d33-75a34eba928a@web.de>
In-Reply-To: <689e51d5-9a43-45a4-5d33-75a34eba928a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus.Elfring@web.de
Cc: netdev@vger.kernel.org, alexios.zavras@intel.com, allison@lohutok.net, armijn@tjaldur.nl, arnd@arndb.de, huangfq.daxian@gmail.com, gregkh@linuxfoundation.org, hkallweit1@gmail.com, kjlu@umn.edu, isdn@linux-pingi.de, tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 20:45:09 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 21 Aug 2019 20:10:56 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
