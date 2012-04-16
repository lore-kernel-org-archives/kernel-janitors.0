From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 16 Apr 2012 22:04:07 +0000
Subject: [PATCH] bna: 2:nd argument of function prototype should be an enum
Message-Id: <1334613847-4341-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The second argument of the function bfa_ioc_boot is an enum and
its function prototype should have arguments of the same type.

This patch fixes the following sparse error:
drivers/net/ethernet/brocade/bna/bfa_ioc.c:1962:1: error:
        symbol 'bfa_ioc_boot' redeclared with different type
        (originally declared at drivers/net/ethernet/brocade/bna/bfa_ioc.c:83)
        - incompatible argument 2 (different signedness)

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/net/ethernet/brocade/bna/bfa_ioc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/brocade/bna/bfa_ioc.c b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
index 0b640fa..0da46c1 100644
--- a/drivers/net/ethernet/brocade/bna/bfa_ioc.c
+++ b/drivers/net/ethernet/brocade/bna/bfa_ioc.c
@@ -80,7 +80,7 @@ static void bfa_ioc_pf_disabled(struct bfa_ioc *ioc);
 static void bfa_ioc_pf_failed(struct bfa_ioc *ioc);
 static void bfa_ioc_pf_hwfailed(struct bfa_ioc *ioc);
 static void bfa_ioc_pf_fwmismatch(struct bfa_ioc *ioc);
-static void bfa_ioc_boot(struct bfa_ioc *ioc, u32 boot_type,
+static void bfa_ioc_boot(struct bfa_ioc *ioc, enum bfi_fwboot_type,
 			 u32 boot_param);
 static u32 bfa_ioc_smem_pgnum(struct bfa_ioc *ioc, u32 fmaddr);
 static void bfa_ioc_get_adapter_serial_num(struct bfa_ioc *ioc,
-- 
1.7.9.5

