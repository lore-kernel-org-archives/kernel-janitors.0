From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2012 10:45:47 +0000
Subject: [patch -next] tcm_vhost: another strlen() off by one
Message-Id: <20120713104547.GA31435@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Bellinger <nab@linux-iscsi.org>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org

strlen() doesn't count the NUL terminator.  I missed this one in the
patches I sent yesterday.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
index 29850cb..ea72198 100644
--- a/drivers/vhost/tcm_vhost.c
+++ b/drivers/vhost/tcm_vhost.c
@@ -1424,7 +1424,7 @@ static struct se_wwn *tcm_vhost_make_tport(
 	return ERR_PTR(-EINVAL);
 
 check_len:
-	if (strlen(name) > TCM_VHOST_NAMELEN) {
+	if (strlen(name) >= TCM_VHOST_NAMELEN) {
 		pr_err("Emulated %s Address: %s, exceeds"
 			" max: %d\n", name, tcm_vhost_dump_proto_id(tport),
 			TCM_VHOST_NAMELEN);
