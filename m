From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Sep 2014 11:17:35 +0000
Subject: [patch] xen-scsiback: clean up a type issue in scsiback_make_tpg()
Message-Id: <20140908111735.GB6947@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This code was confusing because we had an unsigned long and then we
compared it to UINT_MAX and then we stored it in a u16.  How many bytes
is this supposed to have: 2, 4 or 16???

I've made it a u16 throughout.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/xen-scsiback.c b/drivers/xen/xen-scsiback.c
index 7b565632..ad11258 100644
--- a/drivers/xen/xen-scsiback.c
+++ b/drivers/xen/xen-scsiback.c
@@ -1885,13 +1885,14 @@ scsiback_make_tpg(struct se_wwn *wwn,
 			struct scsiback_tport, tport_wwn);
 
 	struct scsiback_tpg *tpg;
-	unsigned long tpgt;
+	u16 tpgt;
 	int ret;
 
 	if (strstr(name, "tpgt_") != name)
 		return ERR_PTR(-EINVAL);
-	if (kstrtoul(name + 5, 10, &tpgt) || tpgt > UINT_MAX)
-		return ERR_PTR(-EINVAL);
+	ret = kstrtou16(name + 5, 10, &tpgt);
+	if (ret)
+		return ERR_PTR(ret);
 
 	tpg = kzalloc(sizeof(struct scsiback_tpg), GFP_KERNEL);
 	if (!tpg)
