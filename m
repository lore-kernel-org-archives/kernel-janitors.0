From: Colin King <colin.king@canonical.com>
Date: Sat, 16 Mar 2019 21:40:16 +0000
Subject: [PATCH] hotplug/drc-info: ininitialize fndit to zero
Message-Id: <20190316214016.6612-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently variable fndit is not initialized and contains a
garbage value, later it is set to 1 if a drc entry is found.
Ensure fndit is not containing garbage by initializing it to
zero. Also remove an extraneous space at the end of an
sprintf call.

Detected by static analysis with cppcheck.

Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/hotplug/rpaphp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index bcd5d357ca23..28213f44f64a 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 	struct of_drc_info drc;
 	const __be32 *value;
 	char cell_drc_name[MAX_DRC_NAME_LEN];
-	int j, fndit;
+	int j, fndit = 0;
 
 	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
 	if (info = NULL)
@@ -254,7 +254,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 	/* Found it */
 
 	if (fndit)
-		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
+		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
 			my_index);
 
 	if (((drc_name = NULL) ||
-- 
2.20.1
