From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Nov 2018 10:55:00 +0000
Subject: [PATCH -next] IB/srpt: Drop pointless static qualifier in srpt_make_tpg()
Message-Id: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

There is no need to have the 'struct se_portal_group *tpg' variable
static since new value always be assigned before use it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c b/drivers/infiniband/ulp/srpt/ib_srpt.c
index 1ae638b..fe02fab 100644
--- a/drivers/infiniband/ulp/srpt/ib_srpt.c
+++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
@@ -3602,7 +3602,7 @@ static struct se_portal_group *srpt_make_tpg(struct se_wwn *wwn,
 					     const char *name)
 {
 	struct srpt_port *sport = wwn->priv;
-	static struct se_portal_group *tpg;
+	struct se_portal_group *tpg;
 	int res;
 
 	WARN_ON_ONCE(wwn != &sport->port_guid_wwn &&
