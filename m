From: "Mike D. Day" <ncmike@us.ibm.com>
Date: Wed, 01 Nov 2006 19:32:48 +0000
Subject: [KJ] [PATCH] acpi: remove unused variable
Message-Id: <20061101193248.GA5176@silverwood.ncultra.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: len.brown@intel.com, linux-acpi@vger.kernel.org


Remove unused variable in acpi/events/evmisc.c

Signed-off-by: Mike D. Day <ncmike@us.ibm.com>

---

 drivers/acpi/events/evmisc.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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

-- 
Mike D. Day
IBM LTC
Cell: 919 412-3900
Sametime: ncmike@us.ibm.com AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
