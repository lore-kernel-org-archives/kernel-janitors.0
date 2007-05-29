From: Aaron Cripps <acripps@gmail.com>
Date: Tue, 29 May 2007 21:10:16 +0000
Subject: [KJ] [PATCH ARRAY_SIZE 0/4] kernel 2.6 size macro clean ups in
Message-Id: <465C9988.9020004@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The following thread contains four patches for cleaning up custom SIZE 
macros in drivers/net
that do the same thing as ARRAY_SIZE(arr) in kernel.h
NOTE: this is not a complete list of patches ... more need to be 
released for this subsystem and
will be released as I find time.
-acripps
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
