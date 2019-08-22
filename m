From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 23:23:15 +0000
Subject: Re: [PATCH] hamradio: Delete unnecessary checks before the macro call =?iso-2022-jp?B?GyRCIUgbKEJkZX
Message-Id: <20190822.162315.165058386064462241.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <61fc7b82-dbc0-93e4-bf43-9856eb4c6688@web.de>
In-Reply-To: <61fc7b82-dbc0-93e4-bf43-9856eb4c6688@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus.Elfring@web.de
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, allison@lohutok.net, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, rfontana@redhat.com, tglx@linutronix.de, t.sailer@alumni.ethz.ch, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 22:00:16 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 21 Aug 2019 21:48:46 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
