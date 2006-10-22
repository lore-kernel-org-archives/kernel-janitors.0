From: Andi Kleen <ak@suse.de>
Date: Sun, 22 Oct 2006 21:47:42 +0000
Subject: [KJ] make pdfdocs broken in 2.6.19rc2 and needs fixes
Message-Id: <200610222347.42418.ak@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org


When you do make pdfdocs  with 2.6.19rc2-git7 you get tons of error 
messages and  then some corrupted PDFs in the end.

Fixing that (I suppose it will just need comment fixes and
should not affect the code) should be a relatively easy task for 
a newbie and  would be useful for the 2.6.19 release.

-Andi
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
