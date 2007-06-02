From: Andi Drebes <lists-receive@programmierforen.de>
Date: Sat, 02 Jun 2007 11:59:22 +0000
Subject: [KJ] Why keeping lines commented out via #if 0?
Message-Id: <200706021359.23564.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!
I recently grep'd through the kernel sources and found *a lot* of lines
that are commented out using #if 0. Is there any reason to keep them?
I think that lines that are commented out should be removed from
the mainline kernel. If developers need them in future, they can create
a local copy or branch on their machines. Or am I missing the point
about the whole #if 0 thing?

		Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
