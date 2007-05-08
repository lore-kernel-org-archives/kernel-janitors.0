From: Shani Moideen <shani.moideen@wipro.com>
Date: Tue, 08 May 2007 11:02:44 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>, 0,
Message-Id: <1178621444.3598.15.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ebiederm@xmission.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,

Replacing memset(<addr>,0,PAGE_SIZE) with clear_page() in
kernel/kexec.c 

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

thanks.


diff --git a/kernel/kexec.c b/kernel/kexec.c
index 2a59c8a..1a1afdd 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -787,7 +787,7 @@ static int kimage_load_normal_segment(struct kimage *image,

                ptr = kmap(page);
                /* Start with a clear page */
-               memset(ptr, 0, PAGE_SIZE);
+               clear_page(ptr);
                ptr += maddr & ~PAGE_MASK;
                mchunk = PAGE_SIZE - (maddr & ~PAGE_MASK);
                if (mchunk > mbytes)






-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
