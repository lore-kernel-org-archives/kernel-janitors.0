From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 21 Aug 2019 17:47:08 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_RDMA/iwpm=3a_Delete_unnecessary_checks_before?= =?UTF-8?B?IHRoZSBtYWNybyBjYWxs
Message-Id: <16df4c50-1f61-d7c4-3fc8-3073666d281d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Johannes Berg <johannes.berg@intel.com>, Leon Romanovsky <leon@kernel.org>, Parav Pandit <parav@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, Tatyana Nikolova <Tatyana.E.Nikolova@intel.com>, YueHaibing <yuehaibing@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 19:30:09 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the shown calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/core/iwpm_msg.c  | 9 +++------
 drivers/infiniband/core/iwpm_util.c | 9 +++------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/infiniband/core/iwpm_msg.c b/drivers/infiniband/core/iwpm_msg.c
index f1a873d4e842..46686990a827 100644
--- a/drivers/infiniband/core/iwpm_msg.c
+++ b/drivers/infiniband/core/iwpm_msg.c
@@ -124,8 +124,7 @@ int iwpm_register_pid(struct iwpm_dev_data *pm_msg, u8 nl_client)
 	return ret;
 pid_query_error:
 	pr_info("%s: %s (client = %d)\n", __func__, err_str, nl_client);
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 	if (nlmsg_request)
 		iwpm_free_nlmsg_request(&nlmsg_request->kref);
 	return ret;
@@ -214,8 +213,7 @@ int iwpm_add_mapping(struct iwpm_sa_data *pm_msg, u8 nl_client)
 add_mapping_error:
 	pr_info("%s: %s (client = %d)\n", __func__, err_str, nl_client);
 add_mapping_error_nowarn:
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 	if (nlmsg_request)
 		iwpm_free_nlmsg_request(&nlmsg_request->kref);
 	return ret;
@@ -308,8 +306,7 @@ int iwpm_add_and_query_mapping(struct iwpm_sa_data *pm_msg, u8 nl_client)
 query_mapping_error:
 	pr_info("%s: %s (client = %d)\n", __func__, err_str, nl_client);
 query_mapping_error_nowarn:
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 	if (nlmsg_request)
 		iwpm_free_nlmsg_request(&nlmsg_request->kref);
 	return ret;
diff --git a/drivers/infiniband/core/iwpm_util.c b/drivers/infiniband/core/iwpm_util.c
index c7ad3499228c..13495b43dbc1 100644
--- a/drivers/infiniband/core/iwpm_util.c
+++ b/drivers/infiniband/core/iwpm_util.c
@@ -655,8 +655,7 @@ static int send_mapinfo_num(u32 mapping_num, u8 nl_client, int iwpm_pid)
 	return 0;
 mapinfo_num_error:
 	pr_info("%s: %s\n", __func__, err_str);
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 	return ret;
 }

@@ -778,8 +777,7 @@ int iwpm_send_mapinfo(u8 nl_client, int iwpm_pid)
 send_mapping_info_exit:
 	if (ret) {
 		pr_warn("%s: %s (ret = %d)\n", __func__, err_str, ret);
-		if (skb)
-			dev_kfree_skb(skb);
+		dev_kfree_skb(skb);
 		return ret;
 	}
 	send_nlmsg_done(skb, nl_client, iwpm_pid);
@@ -834,7 +832,6 @@ int iwpm_send_hello(u8 nl_client, int iwpm_pid, u16 abi_version)
 	return 0;
 hello_num_error:
 	pr_info("%s: %s\n", __func__, err_str);
-	if (skb)
-		dev_kfree_skb(skb);
+	dev_kfree_skb(skb);
 	return ret;
 }
--
2.23.0
