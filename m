From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 18:06:30 +0000
Subject: [PATCH 11/11] watchdog/hpwdt: formatting of pointers in printk()
Message-Id: <1279130790-19277-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Wim Van Sebroeck <wim@iguana.be>, Thomas Mingarelli <Thomas.Mingarelli@hp.com>, dann frazier <dannf@hp.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/watchdog/hpwdt.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
index dbe650e..2056534 100644
--- a/drivers/watchdog/hpwdt.c
+++ b/drivers/watchdog/hpwdt.c
@@ -250,8 +250,8 @@ static int __devinit cru_detect(unsigned long map_entry,
 			physical_bios_offset);
 		printk(KERN_DEBUG "hpwdt: CRU Length:         0x%lx\n",
 			cru_length);
-		printk(KERN_DEBUG "hpwdt: CRU Mapped Address: 0x%x\n",
-			(unsigned int)&cru_rom_addr);
+		printk(KERN_DEBUG "hpwdt: CRU Mapped Address: %p\n",
+			&cru_rom_addr);
 	}
 	iounmap(bios32_map);
 	return retval;
-- 
1.7.0.4

