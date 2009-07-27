From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 16:14:29 +0000
Subject: [PATCH 7/12] drivers/scsi/aacraid: Correct redundant test
Message-Id: <Pine.LNX.4.64.0907271814120.2682@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aacraid@adaptec.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dev was tested for NULL a few lines before, followed by a return, and there
is no intervening modification of its value.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
@@

if (x = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
*x = NULL
|
*x != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/aacraid/commsup.c      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/aacraid/commsup.c b/drivers/scsi/aacraid/commsup.c
index 956261f..bfbb0f7 100644
--- a/drivers/scsi/aacraid/commsup.c
+++ b/drivers/scsi/aacraid/commsup.c
@@ -817,7 +817,7 @@ static void aac_handle_aif(struct aac_dev * dev, struct fib * fibptr)
 			 * see an AifEnConfigChange AIF come through.
 			 */
 
-			if ((dev != NULL) && (dev->scsi_host_ptr != NULL)) {
+			if (dev->scsi_host_ptr != NULL) {
 				device = scsi_device_lookup(dev->scsi_host_ptr,
 					CONTAINER_TO_CHANNEL(container),
 					CONTAINER_TO_ID(container),
