From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sat, 30 Oct 2004 00:26:22 +0000
Subject: Re: [KJ] 2.6.10-rc1-kjt1: ixgb_ethtool.c doesn't compile
Message-Id: <4182DFAE.7000409@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041024151241.GA1920@stro.at> <20041029235137.GG6677@stusta.de>
In-Reply-To: <20041029235137.GG6677@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org, Nishanth Aravamudan <nacc@us.ibm.com>

Adrian Bunk wrote:
> On Sun, Oct 24, 2004 at 05:12:41PM +0200, maximilian attems wrote:
> 
>>...
> 
> 
> msleep_interruptible-drivers_net_ixgb_ixgb_ethtool.patch doesn't 
> compile:
> 
> <--  snip  -->
> 
> ...
>   CC      drivers/net/ixgb/ixgb_ethtool.o
> drivers/net/ixgb/ixgb_ethtool.c: In function `ixgb_ethtool_led_blink':
> drivers/net/ixgb/ixgb_ethtool.c:407: error: `id' undeclared (first use in this function)
> drivers/net/ixgb/ixgb_ethtool.c:407: error: (Each undeclared identifier is reported only once
> drivers/net/ixgb/ixgb_ethtool.c:407: error: for each function it appears in.)
> make[3]: *** [drivers/net/ixgb/ixgb_ethtool.o] Error 1
> 
> <--  snip  -->

There are new (large) patches to the ixgb driver too.  See:
http://oss.sgi.com/projects/netdev/archive/2004-10/msg01342.html


-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
