From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Tue, 20 Aug 2013 16:42:35 +0000
Subject: Strange Makefile rule
Message-Id: <CA+MoWDoAAc3QmK20RscRpi7_U=cU+0BD9RscH6YYYdzjYp1FLg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

I do not have cross compile environment but I'm curious how the
Makefile rule works:

linux-next]$ cat drivers/net/ethernet/arc/Makefile

obj-$(CONFIG_ARC_EMAC) += arc_emac.o

There is no file named arc_emac.h and arc_emac.c at
drivers/net/ethernet/arc, so what does that line do?

-- 
Peter
