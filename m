From: Julia Lawall <julia@diku.dk>
Date: Wed, 14 Nov 2007 08:15:51 +0000
Subject: [PATCH 4/4] sound/pci: Drop unnecessary continue
Message-Id: <Pine.LNX.4.64.0711140915220.26019@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Continue is not needed at the bottom of a loop.

The semantic patch implementing this change is as follows:

@@
@@

for (...;...;...) {
   ...
   if (...) {
     ...
-   continue;
   }
}

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p -b -B a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
--- a/sound/pci/intel8x0.c 2007-10-22 11:25:53.000000000 +0200
+++ b/sound/pci/intel8x0.c 2007-11-13 23:53:44.000000000 +0100
@@ -2144,7 +2144,6 @@ static int __devinit snd_intel8x0_mixer(
  				snd_printk(KERN_ERR "Unable to initialize codec #%d\n", i);
  			if (i = 0)
  				goto __err;
-			continue;
  		}
  	}
  	/* tune up the primary codec */
