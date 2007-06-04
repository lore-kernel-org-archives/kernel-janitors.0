From: Marc Zyngier <maz@misterjones.org>
Date: Mon, 04 Jun 2007 20:47:08 +0000
Subject: [KJ] Re: [PATCH] drivers/eisa/eisa-bus.c: Array size calculation
Message-Id: <wrpk5ujmoqb.fsf@wild-wind.fr.eu.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>>>>> "Andi" = Andi Drebes <lists-receive@programmierforen.de> writes:

Andi> This patch replaces an array size calculation in drivers/eisa/eisa-bus.c
Andi> that was done using sizeof with the ARRAY_SIZE macro. I also removed
Andi> the preprocessor definition "EISA_INFOS" that represented the number of
Andi> entries in eisa_table because it was only referenced once.

Andi> Tested by compilation on an i386 box using "allyesconfig".
Andi> Diffed against Linus' git-tree.

Andi> Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>

Acked-by: Marc Zyngier <maz@misterjones.org>

	M.
-- 
And if you don't know where you're going, any road will take you there...
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
