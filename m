From: Joe Perches <joe@perches.com>
Date: Tue, 28 Jul 2009 18:06:37 +0000
Subject: [PATCH] MAINTAINERS: Add networking wireless drivers section
Message-Id: <1248804397.18284.5.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281753540.28189@ask.diku.dk>
	 <20090728.103044.179053537.davem@davemloft.net>
In-Reply-To: <20090728.103044.179053537.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>
Cc: julia@diku.dk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

On Tue, 2009-07-28 at 10:30 -0700, David Miller wrote:
> Wireless patches need to be CC:'d to linux-wireless so that
> John Linville can notice and pick them up

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index ebc2691..0574aad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4186,6 +4186,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6.git
 S:	Odd Fixes
 F:	drivers/net/
 
+NETWORKING WIRELESS DRIVERS
+L:	linux-wireless@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-2.6.git
+S:	Odd Fixes
+F:	drivers/net/wireless/
+
 NETXEN (1/10) GbE SUPPORT
 P:	Dhananjay Phadke
 M:	dhananjay@netxen.com


