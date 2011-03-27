From: Maksym Planeta <mcsim.planeta@gmail.com>
Date: Sun, 27 Mar 2011 17:15:36 +0000
Subject: Re: [PATCH v2] x86: page: get_order() optimization
Message-Id: <1301246136.2291.49.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301215556-8898-1-git-send-email-mcsim.planeta@gmail.com>
	 <20110327113323.GA27825@elte.hu>
In-Reply-To: <20110327113323.GA27825@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: mingo@redhat.com, kernel-janitors@vger.kernel.org, namhyung@gmail.com, linux-kernel@vger.kernel.org

On Sat, 27/03/2011 at 13:33 +0200, Ingo Molnar wrote:
> Just wondering, what's the before/after 'size vmlinux' effect on a 'make 
> defconfig' x86 kernel? Does the optimization make the kernel smaller as well, 
> besides making it faster?

Thank you for advice. I didn't really mentioned it. So without my patch:

size vmlinux
   text	   data	    bss	    dec	    hex	filename
7915025	1253060	1122304	10290389	 9d04d5	vmlinux

And with it: 

size vmlinux
   text	   data	    bss	    dec	    hex	filename
7919150	1251364	1122304	10292818	 9d0e52	vmlinux

Size increased. But I discovered that if I replace "inline" with
"__always_inline" in get_order(), size will be following:

size vmlinux
   text	   data	    bss	    dec	    hex	filename
7914481	1249252	1122304	10286037	 9cf3d5	vmlinux

And this is less than with same modification in asm-general:

size vmlinux
   text	   data	    bss	    dec	    hex	filename
7914713	1249268	1122304	10286285	 9cf4cd	vmlinux

With my patch and "__always_inline" instead of just "inline" size will
be the smallest.

Signed-off-by: Maksym Planeta <mcsim.planeta@gmail.com>
---
 arch/x86/include/asm/getorder.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/include/asm/getorder.h
b/arch/x86/include/asm/getorder.h
index b0c6f57..6220783 100644
--- a/arch/x86/include/asm/getorder.h
+++ b/arch/x86/include/asm/getorder.h
@@ -27,7 +27,7 @@ static __always_inline int __get_order(unsigned long
size)
 }
 
 /* Pure 2^n version of get_order */
-static inline __attribute_const__  int get_order(unsigned long size)
+static __always_inline __attribute_const__  int get_order(unsigned long
size)
 {
	int order;
-- 
Thanks,

Maksym Planeta

