From: Carlo Perassi <carlo@linux.it>
Date: Thu, 22 Jan 2004 18:17:17 +0000
Subject: [Kernel-janitors] unnecessary cast script finder
Message-Id: <20040122181717.GA2685@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi.

I wrote a little script which searchs in driver/ (driver/net/ to be
faster) for lines of this kind:
struct A *B = (struct A *)dev->priv;

As you know, a line like the previous one probably shall be rewritten
like:
struct A *B = dev->priv;

To show you what you can get, I paste here some lines of the script's
output:

drivers/net/bonding/bond_3ad.c
  2479		struct bonding *bond = (struct bonding *)dev->priv;
drivers/net/bonding/bond_alb.c
   397		struct bonding *bond = (struct bonding *)dev->priv;
drivers/net/smc9194.c
   468		struct smc_local *lp 	= (struct smc_local *)dev->priv;
   579		struct smc_local *lp = (struct smc_local *)dev->priv;
  1139		struct smc_local *lp 	= (struct smc_local *)dev->priv;
  1263		struct smc_local *lp = (struct smc_local *)dev->priv;
  1390		struct smc_local *lp = (struct smc_local *)dev->priv;
  1463		struct smc_local *lp = (struct smc_local *)dev->priv;

The script and its (purged) output are available here:
http://www.linux.it/~carlo/somehacks/pmaker/

I have not yet wrote a script which creates the right patches and, despite
I wish to write it, it is not safe to create and submit script-made
patches without checks, so I wonder if someone would like to look at some
part of the output of the script and create the proper patches. Waiting
for a patch maker script/program, that's what I ask for.

Thanks.

-- 
Carlo Perassi - http://www.linux.it/~carlo/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
