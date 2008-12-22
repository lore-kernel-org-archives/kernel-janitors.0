From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:16:13 +0000
Subject: [PATCH 09/27] drivers/net/e1000e: fix sparse warnings: make symbols
Message-Id: <20081222191613.11807.47997.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:

  drivers/net/e1000e/es2lan.c:1265:5: warning: symbol 'e1000_read_kmrn_reg_80003es2lan' was not declared. Should it be static?
  drivers/net/e1000e/es2lan.c:1298:5: warning: symbol 'e1000_write_kmrn_reg_80003es2lan' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/e1000e/es2lan.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/e1000e/es2lan.c b/drivers/net/e1000e/es2lan.c
index db51114..8964838 100644
--- a/drivers/net/e1000e/es2lan.c
+++ b/drivers/net/e1000e/es2lan.c
@@ -1262,7 +1262,8 @@ static s32 e1000_cfg_kmrn_1000_80003es2lan(struct e1000_hw *hw)
  *  using the kumeran interface.  The information retrieved is stored in data.
  *  Release the semaphore before exiting.
  **/
-s32 e1000_read_kmrn_reg_80003es2lan(struct e1000_hw *hw, u32 offset, u16 *data)
+static s32 e1000_read_kmrn_reg_80003es2lan(struct e1000_hw *hw, u32 offset,
+					   u16 *data)
 {
 	u32 kmrnctrlsta;
 	s32 ret_val = 0;
@@ -1295,7 +1296,8 @@ s32 e1000_read_kmrn_reg_80003es2lan(struct e1000_hw *hw, u32 offset, u16 *data)
  *  at the offset using the kumeran interface.  Release semaphore
  *  before exiting.
  **/
-s32 e1000_write_kmrn_reg_80003es2lan(struct e1000_hw *hw, u32 offset, u16 data)
+static s32 e1000_write_kmrn_reg_80003es2lan(struct e1000_hw *hw, u32 offset,
+					    u16 data)
 {
 	u32 kmrnctrlsta;
 	s32 ret_val = 0;

