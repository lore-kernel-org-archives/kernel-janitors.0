From: Tyler <tyler@agat.net>
Date: Tue, 08 Mar 2005 11:04:59 +0000
Subject: [KJ][PATCH] linux-2.6.11 : warning fix in fs/quota_v2.c
Message-Id: <d0k0sm$lu1$1@sea.gmane.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010301090901070908060608"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010301090901070908060608
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The format %zd should be replaced by %d :)

--------------010301090901070908060608
Content-Type: text/x-patch;
 name="write_quota_warning_fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="write_quota_warning_fix.patch"

--- linux-2.6.11-eb/fs/quota_v2.c.orig	2005-03-08 11:58:06.000000000 +0100
+++ linux-2.6.11-eb/fs/quota_v2.c	2005-03-08 11:58:28.000000000 +0100
@@ -396,7 +396,7 @@ static int v2_write_dquot(struct dquot *
 	/* dq_off is guarded by dqio_sem */
 	if (!dquot->dq_off)
 		if ((ret = dq_insert_tree(dquot)) < 0) {
-			printk(KERN_ERR "VFS: Error %zd occurred while creating quota.\n", ret);
+			printk(KERN_ERR "VFS: Error %d occurred while creating quota.\n", ret);
 			return ret;
 		}
 	spin_lock(&dq_data_lock);

--------------010301090901070908060608--



-------------------------------------------------------
SF email is sponsored by - The IT Product Guide
Read honest & candid reviews on hundreds of IT Products from real users.
Discover which products truly live up to the hype. Start reading now.
http://ads.osdn.com/?ad_id=6595&alloc_id=14396&op=click
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
