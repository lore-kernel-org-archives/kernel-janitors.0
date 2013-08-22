From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 22 Aug 2013 15:14:16 +0000
Subject: What are the source files for a given Kconfig symbol?
Message-Id: <CA+MoWDrOGfTURN4CgsCZSVwfj35G-Oyfyv-mgAaeMpznTNbKaw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

I'm writing scripts to get source code files for a given Kconfig
symbol such as ALX. I'm expecting something like:

./scripts/Kconfig-files.pl ALX
drivers/net/ethernet/atheros/alx/alx.h
drivers/net/ethernet/atheros/alx/main.c
drivers/net/ethernet/atheros/alx/ethtool.c
drivers/net/ethernet/atheros/alx/hw.h
drivers/net/ethernet/atheros/alx/hw.c
drivers/net/ethernet/atheros/alx/reg.h

Is there a standard way of doing that? The scripts I'm working on uses
Makefile contents and look for #include "" on the source code.


-- 
Peter
