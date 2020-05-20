From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 20 May 2020 03:41:14 +0000
Subject: [PATCH 0/2 v3] net: ethernet: ti: fix some return value check
Message-Id: <20200520034116.170946-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, kernel-janitors@vger.kernel.org

This patchset convert cpsw_ale_create() to return PTR_ERR() only, and
changed all the caller to check IS_ERR() instead of NULL.

Since v2:
1) rebased on net.git, as Jakub's suggest
2) split am65-cpsw-nuss.c changes, as Grygorii's suggest


Wei Yongjun (2):
  net: ethernet: ti: fix some return value check of cpsw_ale_create()
  net: ethernet: ti: am65-cpsw-nuss: fix error handling of
    am65_cpsw_nuss_probe

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 ++-
 drivers/net/ethernet/ti/cpsw_ale.c       | 2 +-
 drivers/net/ethernet/ti/cpsw_priv.c      | 4 ++--
 drivers/net/ethernet/ti/netcp_ethss.c    | 4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.25.1
