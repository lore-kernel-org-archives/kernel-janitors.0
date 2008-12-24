From: Julia Lawall <julia@diku.dk>
Date: Wed, 24 Dec 2008 15:23:37 +0000
Subject: [PATCH 2/3] drivers/staging/meilhaus: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0812241623120.5475@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, mail@davidkiliani.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

ME_IO_SINGLE_TYPE_WRITE_NONBLOCKING and ME_IO_STREAM_CONFIG_WRAPAROUND both
hanve 0 as the rightmost bit, and thus eg
!flags & ME_IO_SINGLE_TYPE_WRITE_NONBLOCKING is always 0.
I assume that !(flags & ME_IO_SINGLE_TYPE_WRITE_NONBLOCKING) and
!(flags & ME_IO_STREAM_CONFIG_WRAPAROUND) were intended.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E; constant C; @@
(
  !E & !C
|
- !E & C
+ !(E & C)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/meilhaus/me1600_ao.c |    4 +++-
 drivers/staging/meilhaus/me4600_ao.c |    2 +-
 drivers/staging/meilhaus/me6000_ao.c |    2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff -u -p a/drivers/staging/meilhaus/me1600_ao.c b/drivers/staging/meilhaus/me1600_ao.c
--- a/drivers/staging/meilhaus/me1600_ao.c
+++ b/drivers/staging/meilhaus/me1600_ao.c
@@ -756,7 +756,9 @@ static int me1600_ao_io_single_write(me_
 	queue_delayed_work(instance->me1600_workqueue,
 			   &instance->ao_control_task, 1);
 
-	if ((!flags & ME_IO_SINGLE_TYPE_WRITE_NONBLOCKING) && ((instance->ao_regs_shadows)->trigger & instance->ao_idx)) {	//Blocking mode. Wait for software trigger.
+	if ((!(flags & ME_IO_SINGLE_TYPE_WRITE_NONBLOCKING)) &&
+	    ((instance->ao_regs_shadows)->trigger & instance->ao_idx)) {
+		/* Blocking mode. Wait for software trigger. */
 		if (time_out) {
 			delay = (time_out * HZ) / 1000;
 			if (delay = 0)
diff -u -p a/drivers/staging/meilhaus/me4600_ao.c b/drivers/staging/meilhaus/me4600_ao.c
--- a/drivers/staging/meilhaus/me4600_ao.c
+++ b/drivers/staging/meilhaus/me4600_ao.c
@@ -1025,7 +1025,7 @@ static int me4600_ao_io_stream_config(me
 	}
 
 	if (flags & ME_IO_STREAM_CONFIG_HARDWARE_ONLY) {
-		if (!flags & ME_IO_STREAM_CONFIG_WRAPAROUND) {
+		if (!(flags & ME_IO_STREAM_CONFIG_WRAPAROUND)) {
 			PERROR
 			    ("Hardware ME_IO_STREAM_CONFIG_HARDWARE_ONLY has to be with ME_IO_STREAM_CONFIG_WRAPAROUND.\n");
 			return ME_ERRNO_INVALID_FLAGS;
diff -u -p a/drivers/staging/meilhaus/me6000_ao.c b/drivers/staging/meilhaus/me6000_ao.c
--- a/drivers/staging/meilhaus/me6000_ao.c
+++ b/drivers/staging/meilhaus/me6000_ao.c
@@ -1063,7 +1063,7 @@ static int me6000_ao_io_stream_config(me
 	}
 
 	if (flags & ME_IO_STREAM_CONFIG_HARDWARE_ONLY) {
-		if (!flags & ME_IO_STREAM_CONFIG_WRAPAROUND) {
+		if (!(flags & ME_IO_STREAM_CONFIG_WRAPAROUND)) {
 			PERROR
 			    ("Hardware ME_IO_STREAM_CONFIG_HARDWARE_ONLY has to be with ME_IO_STREAM_CONFIG_WRAPAROUND.\n");
 			return ME_ERRNO_INVALID_FLAGS;
