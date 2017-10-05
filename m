From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Oct 2017 10:01:45 +0000
Subject: [PATCH] switchtec: make struct event_regs static
Message-Id: <20171005100145.29309-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Stephen Bates <stephen.bates@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure event_regs is local to the source and does not need to
be in global scope, so make it static.

Cleans up sparse warning:
symbol 'event_regs' was not declared. Should it be static

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/switch/switchtec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index af81b2dec42e..da45dbea20ce 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -943,7 +943,7 @@ static u32 __iomem *pff_ev_reg(struct switchtec_dev *stdev,
 #define EV_PAR(i, r)[i] = {offsetof(struct part_cfg_regs, r), part_ev_reg}
 #define EV_PFF(i, r)[i] = {offsetof(struct pff_csr_regs, r), pff_ev_reg}
 
-const struct event_reg {
+static const struct event_reg {
 	size_t offset;
 	u32 __iomem *(*map_reg)(struct switchtec_dev *stdev,
 				size_t offset, int index);
-- 
2.14.1

