From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 11:28:04 +0000
Subject: [PATCH] net: hns3: make array spec_opcode static const, makes object smaller
Message-Id: <20190906112804.7812-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Peng Li <lipeng321@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array spec_opcode on the stack but instead make it
static const. Makes the object code smaller by 48 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   6914	   1040	    128	   8082	   1f92	hns3/hns3vf/hclgevf_cmd.o

After:
   text	   data	    bss	    dec	    hex	filename
   6866	   1040	    128	   8034	   1f62	hns3/hns3vf/hclgevf_cmd.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_cmd.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_cmd.c
index 4c2c9458648f..d5d1cc5d1b6e 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_cmd.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_cmd.c
@@ -74,7 +74,7 @@ static bool hclgevf_cmd_csq_done(struct hclgevf_hw *hw)
 
 static bool hclgevf_is_special_opcode(u16 opcode)
 {
-	u16 spec_opcode[] = {0x30, 0x31, 0x32};
+	static const u16 spec_opcode[] = {0x30, 0x31, 0x32};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(spec_opcode); i++) {
-- 
2.20.1
