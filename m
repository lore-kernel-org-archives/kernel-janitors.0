From: Julia Lawall <julia@diku.dk>
Date: Wed, 26 Dec 2007 16:14:25 +0000
Subject: [PATCH 2/3] drivers/s390: Use offsetof
Message-Id: <Pine.LNX.4.58.0712261713530.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, viro@ftp.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the patch cc154ac64aa8d3396b187f64cef01ce67f433324, Al Viro observed
that the proper way to compute the distance between two structure fields is
to use offsetof() or a cast to a pointer to character.  The same change can
be applied to a few more files.

The change was made using the following semantic patch
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r3 disable ptr_to_array@
type T;
T *s;
type T1, T2;
identifier fld1;
@@

(
  (char *)&s->fld1 - (char *)s
|
  (uint8_t *)&s->fld1 - (uint8_t *)s
|
  (u8 *)&s->fld1 - (u8 *)s
|
- (T1)&s->fld1 - (T2)s
+ offsetof(T,fld1)
)

@@
type T;
expression E;
@@

- (int)(offsetof(T,E))
+ offsetof(T,E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/s390/scsi/zfcp_dbf.c b/drivers/s390/scsi/zfcp_dbf.c
--- a/drivers/s390/scsi/zfcp_dbf.c	2007-10-22 11:25:20.000000000 +0200
+++ b/drivers/s390/scsi/zfcp_dbf.c	2007-12-26 16:25:51.000000000 +0100
@@ -614,7 +614,7 @@ void zfcp_san_dbf_event_incoming_els(str
 	struct fsf_status_read_buffer *status_buffer  	    (struct fsf_status_read_buffer *)fsf_req->data;
 	int length = (int)status_buffer->length -
-	    (int)((void *)&status_buffer->payload - (void *)status_buffer);
+	    offsetof(struct fsf_status_read_buffer, payload);

 	_zfcp_san_dbf_event_common_els("iels", 1, fsf_req, status_buffer->d_id,
 				       fc_host_port_id(adapter->scsi_host),
