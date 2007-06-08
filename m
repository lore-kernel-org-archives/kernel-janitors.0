From: Andi Drebes <lists-receive@programmierforen.de>
Date: Fri, 08 Jun 2007 18:39:22 +0000
Subject: [KJ] [PATCH 0/2] drivers/isdn/act2000: ARRAY_SIZE and Macro
Message-Id: <200706082039.22252.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The following patchset modifies files in drivers/isdn/act2000/{capi.c,module.c}
The first patch replaces array size calculations done with sizeof with the
ARRAY_SIZE macro. The second patch capitalizes lower-case macros defined in
drivers/isdn/act2000/{act2000.h,act2000_isa.h,capi.c} according to
Documentation/CodingStyle, Chapter 12.

	Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
