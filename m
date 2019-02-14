From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 14 Feb 2019 01:57:10 +0000
Subject: [PATCH -next] RDMA/iwpm: Remove set but not used variable 'msg_seq'
Message-Id: <20190214015710.131712-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/core/iwpm_util.c: In function 'iwpm_send_hello':
drivers/infiniband/core/iwpm_util.c:811:6: warning:
 variable 'msg_seq' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit b0bad9ad514f ("RDMA/IWPM: Support
no port mapping requirements")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/core/iwpm_util.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/core/iwpm_util.c b/drivers/infiniband/core/iwpm_util.c
index 7b97f6e2075f..a5d2a20ee697 100644
--- a/drivers/infiniband/core/iwpm_util.c
+++ b/drivers/infiniband/core/iwpm_util.c
@@ -808,7 +808,6 @@ int iwpm_send_hello(u8 nl_client, int iwpm_pid, u16 abi_version)
 {
 	struct sk_buff *skb = NULL;
 	struct nlmsghdr *nlh;
-	u32 msg_seq;
 	const char *err_str = "";
 	int ret = -EINVAL;
 
@@ -818,7 +817,6 @@ int iwpm_send_hello(u8 nl_client, int iwpm_pid, u16 abi_version)
 		goto hello_num_error;
 	}
 	nlh->nlmsg_seq = iwpm_get_nlmsg_seq();
-	msg_seq = 0;
 	err_str = "Unable to put attribute of abi_version into nlmsg";
 	ret = ibnl_put_attr(skb, nlh, sizeof(u16), &abi_version,
 			    IWPM_NLA_HELLO_ABI_VERSION);
