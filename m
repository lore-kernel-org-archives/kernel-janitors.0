From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Oct 2018 17:29:45 +0000
Subject: [PATCH] misc: mic: SCIF:  fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181026172945.3804-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to a spelling mistake of the error access name EACCESS,
rename to EACCES

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/linux/scif.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/scif.h b/include/linux/scif.h
index eeb250b73c4b..329e695b8fe5 100644
--- a/include/linux/scif.h
+++ b/include/linux/scif.h
@@ -657,7 +657,7 @@ int scif_unregister(scif_epd_t epd, off_t offset, size_t len);
  * the negative of one of the following errors is returned.
  *
  * Errors:
- * EACCESS - Attempt to write to a read-only range
+ * EACCES - Attempt to write to a read-only range
  * EBADF, ENOTTY - epd is not a valid endpoint descriptor
  * ECONNRESET - Connection reset by peer
  * EINVAL - rma_flags is invalid
@@ -733,7 +733,7 @@ int scif_readfrom(scif_epd_t epd, off_t loffset, size_t len, off_t
  * the negative of one of the following errors is returned.
  *
  * Errors:
- * EACCESS - Attempt to write to a read-only range
+ * EACCES - Attempt to write to a read-only range
  * EBADF, ENOTTY - epd is not a valid endpoint descriptor
  * ECONNRESET - Connection reset by peer
  * EINVAL - rma_flags is invalid
@@ -815,7 +815,7 @@ int scif_writeto(scif_epd_t epd, off_t loffset, size_t len, off_t
  * the negative of one of the following errors is returned.
  *
  * Errors:
- * EACCESS - Attempt to write to a read-only range
+ * EACCES - Attempt to write to a read-only range
  * EBADF, ENOTTY - epd is not a valid endpoint descriptor
  * ECONNRESET - Connection reset by peer
  * EINVAL - rma_flags is invalid
@@ -895,7 +895,7 @@ int scif_vreadfrom(scif_epd_t epd, void *addr, size_t len, off_t roffset,
  * the negative of one of the following errors is returned.
  *
  * Errors:
- * EACCESS - Attempt to write to a read-only range
+ * EACCES - Attempt to write to a read-only range
  * EBADF, ENOTTY - epd is not a valid endpoint descriptor
  * ECONNRESET - Connection reset by peer
  * EINVAL - rma_flags is invalid
-- 
2.19.1
