From: Colin King <colin.king@canonical.com>
Date: Sat, 16 Mar 2019 22:26:57 +0000
Subject: [PATCH] staging: rtl8723bs: remove unused code
Message-Id: <20190316222657.7940-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two final hunks of code that are only built
if SDIO_DYNAMIC_ALLOC_MEM is defined however this is never
defined and if it was the code would lead to dereferencing
an uninitialized pointer oldmem.  It appears that a previous
commit 1babeb0c3e59 ("Staging: rtl8723bs: Remove dead code")
removed some of the dead code but not all of it. Clean this
up by removing the final hunks.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 3fee34484577..92191e9789bb 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -428,9 +428,6 @@ static u32 sdio_read_port(
 	PSDIO_DATA psdio;
 	struct hal_com_data *hal;
 	u32 oldcnt;
-#ifdef SDIO_DYNAMIC_ALLOC_MEM
-	u8 *oldmem;
-#endif
 	s32 err;
 
 
@@ -447,13 +444,6 @@ static u32 sdio_read_port(
 
 	err = _sd_read(intfhdl, addr, cnt, mem);
 
-#ifdef SDIO_DYNAMIC_ALLOC_MEM
-	if ((oldcnt != cnt) && (oldmem)) {
-		memcpy(oldmem, mem, oldcnt);
-		kfree(mem);
-	}
-#endif
-
 	if (err)
 		return _FAIL;
 	return _SUCCESS;
-- 
2.20.1
