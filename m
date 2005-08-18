From: "Gabriel A. Devenyi" <ace@staticwave.ca>
Date: Thu, 18 Aug 2005 01:28:32 +0000
Subject: [KJ] [PATCH] remove unused return in drivers/block/pktcdvd.c
Message-Id: <200508172128.32202.ace@staticwave.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71318267369506616=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71318267369506616==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Found this on Coverty's linux bug database (http://linuxbugsdb.coverity.com) if anyone else is interested, you can ask
for a login at linuxbugs@coverity.com.

The function pkt_iosched_process_queue makes a call to bdev_get_queue and stores the result but never uses it, so
it looks like it can be safely removed. 

This patch applies to linus' latest Git tree 099d44e869f1886b5eb02a5145ca97b5e4142e28.

Signed-off-by: Gabriel A. Devenyi <ace@staticwave.ca>

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -501,14 +501,11 @@ static void pkt_queue_bio(struct pktcdvd
  */
 static void pkt_iosched_process_queue(struct pktcdvd_device *pd)
 {
-	request_queue_t *q;
 
 	if (atomic_read(&pd->iosched.attention) == 0)
 		return;
 	atomic_set(&pd->iosched.attention, 0);
 
-	q = bdev_get_queue(pd->bdev);
-
 	for (;;) {
 		struct bio *bio;
 		int reads_queued, writes_queued;

--===============71318267369506616==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71318267369506616==--
