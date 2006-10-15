From: Andi Drebes <webmaster@programmierforen.de>
Date: Sun, 15 Oct 2006 20:07:40 +0000
Subject: Re: [KJ] [PATCH] drivers/acpi/events/evmisc.c: Compiler-noise
Message-Id: <200610152207.40919.webmaster@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610152207.21550.webmaster@programmierforen.de>
In-Reply-To: <200610152207.21550.webmaster@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

During the compilation of the latest kernel-source from the git repository, I 
got a notification like this:
 
drivers/acpi/events/evmisc.c: In function `acpi_ev_global_lock_handler':
drivers/acpi/events/evmisc.c:334: warning: unused variable `status'

So I just removed that.
Tested by compilation.

Signed-off-by: Andi Drebes <webmaster@programmierforen.de>

---
diff --git a/drivers/acpi/events/evmisc.c b/drivers/acpi/events/evmisc.c
index ee2a10b..bf63edc 100644
--- a/drivers/acpi/events/evmisc.c
+++ b/drivers/acpi/events/evmisc.c
@@ -331,7 +331,6 @@ static void ACPI_SYSTEM_XFACE acpi_ev_gl
 static u32 acpi_ev_global_lock_handler(void *context)
 {
 	u8 acquired = FALSE;
-	acpi_status status;
 
 	/*
 	 * Attempt to get the lock
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
