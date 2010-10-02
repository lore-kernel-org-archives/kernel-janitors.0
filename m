From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Oct 2010 13:59:16 +0000
Subject: [PATCH 2/4] drivers/message/fusion/mptctl.c: Add missing error handling code
Message-Id: <1286027958-7333-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Moore <Eric.Moore@lsi.com>
Cc: kernel-janitors@vger.kernel.org, support@lsi.com, DL-MPTFusionLinux@lsi.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

karg is allocated using kmalloc and is completely local to this function.
It should thus be freed before exiting the function in an error case.

A simplified version of the sematic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
@r@
statement S1,S2,S3;
constant C1,C2,C3;
@@

*if (...)
 {... S1 return -C1;}
...
*if (...)
 {... when != S1
    return -C2;}
...
*if (...)
 {... S1 return -C3;}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/message/fusion/mptctl.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/message/fusion/mptctl.c b/drivers/message/fusion/mptctl.c
index a3856ed..1dcc13a 100644
--- a/drivers/message/fusion/mptctl.c
+++ b/drivers/message/fusion/mptctl.c
@@ -1307,8 +1307,10 @@ mptctl_getiocinfo (unsigned long arg, unsigned int data_size)
 	else
 		karg->adapterType = MPT_IOCTL_INTERFACE_SCSI;
 
-	if (karg->hdr.port > 1)
+	if (karg->hdr.port > 1) {
+		kfree(karg);
 		return -EINVAL;
+	}
 	port = karg->hdr.port;
 
 	karg->port = port;

