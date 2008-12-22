From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:16:59 +0000
Subject: [PATCH 14/27] drivers/net/netxen: fix sparse warnings: use NULL
Message-Id: <20081222191659.11807.9347.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:

  drivers/net/netxen/netxen_nic_hw.c:1462:18: warning: Using plain integer as NULL pointer
  drivers/net/netxen/netxen_nic_hw.c:1536:18: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/netxen/netxen_nic_hw.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netxen/netxen_nic_hw.c b/drivers/net/netxen/netxen_nic_hw.c
index 86379fd..aa6e603 100644
--- a/drivers/net/netxen/netxen_nic_hw.c
+++ b/drivers/net/netxen/netxen_nic_hw.c
@@ -1459,7 +1459,7 @@ static int netxen_nic_pci_mem_read_direct(struct netxen_adapter *adapter,
 			mem_ptr = ioremap(mem_base + mem_page, PAGE_SIZE * 2);
 		else
 			mem_ptr = ioremap(mem_base + mem_page, PAGE_SIZE);
-		if (mem_ptr = 0UL) {
+		if (mem_ptr = NULL) {
 			*(uint8_t  *)data = 0;
 			return -1;
 		}
@@ -1533,7 +1533,7 @@ netxen_nic_pci_mem_write_direct(struct netxen_adapter *adapter, u64 off,
 			mem_ptr = ioremap(mem_base + mem_page, PAGE_SIZE*2);
 		else
 			mem_ptr = ioremap(mem_base + mem_page, PAGE_SIZE);
-		if (mem_ptr = 0UL)
+		if (mem_ptr = NULL)
 			return -1;
 		addr = mem_ptr;
 		addr += start & (PAGE_SIZE - 1);

