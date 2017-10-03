From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Oct 2017 08:31:45 +0000
Subject: [PATCH] drivers/fsi: make a couple of functions static
Message-Id: <20171003083145.24054-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>, Chris Bostic <cbostic@us.ibm.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions fsi_slave_report_and_clear_errors and fsi_slave_handle_error
are local to the source and do not need to be in global scope, so make
them static.

Cleans up sparse warnings:
symbol 'fsi_slave_report_and_clear_errors' was not declared. Should it
be static?
symbol 'fsi_slave_handle_error' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/fsi/fsi-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4ea63d9bd131..e318bf8c623c 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -185,7 +185,7 @@ static int fsi_slave_calc_addr(struct fsi_slave *slave, uint32_t *addrp,
 	return 0;
 }
 
-int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
+static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 {
 	struct fsi_master *master = slave->master;
 	uint32_t irq, stat;
@@ -215,8 +215,8 @@ int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 
 static int fsi_slave_set_smode(struct fsi_master *master, int link, int id);
 
-int fsi_slave_handle_error(struct fsi_slave *slave, bool write, uint32_t addr,
-		size_t size)
+static int fsi_slave_handle_error(struct fsi_slave *slave, bool write,
+				  uint32_t addr, size_t size)
 {
 	struct fsi_master *master = slave->master;
 	int rc, link;
-- 
2.14.1

