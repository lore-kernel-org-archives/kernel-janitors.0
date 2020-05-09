From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 00:57:01 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <20200508175701.4eee970d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, fthain@telegraphics.com.au, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri,  8 May 2020 19:25:57 +0200 Christophe JAILLET wrote:
> Only macsonic has been compile tested. I don't have the needed setup to
> compile xtsonic

Well, we gotta do that before we apply the patch :S

Does the driver actually depend on some platform stuff, or can we 
do this:

diff --git a/drivers/net/ethernet/natsemi/Kconfig b/drivers/net/ethernet/natsemi/Kconfig
@@ -58,7 +58,7 @@ config NS83820
 
 config XTENSA_XT2000_SONIC
        tristate "Xtensa XT2000 onboard SONIC Ethernet support"
-       depends on XTENSA_PLATFORM_XT2000
+       depends on XTENSA_PLATFORM_XT2000 || COMPILE_TEST
        ---help---
          This is the driver for the onboard card of the Xtensa XT2000 board.
 
?
