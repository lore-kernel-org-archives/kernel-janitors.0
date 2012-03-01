From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Mar 2012 07:19:54 +0000
Subject: [patch] enic: fix an endian bug in enic_probe()
Message-Id: <20120301071954.GA7152@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roopa Prabhu <roprabhu@cisco.com>
Cc: Christian Benvenuti <benve@cisco.com>, Neel Patel <neepatel@cisco.com>, Nishank Trivedi <nistrive@cisco.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"num_vfs" is a u32 but we only use the high 16 bits and the low 16bits
are left as zero.  That isn't a problem for little endian systems but it
will break on big endian ones.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cisco/enic/enic.h b/drivers/net/ethernet/cisco/enic/enic.h
index 99998c6..cf1fb4b 100644
--- a/drivers/net/ethernet/cisco/enic/enic.h
+++ b/drivers/net/ethernet/cisco/enic/enic.h
@@ -94,7 +94,7 @@ struct enic {
 	u32 rx_coalesce_usecs;
 	u32 tx_coalesce_usecs;
 #ifdef CONFIG_PCI_IOV
-	u32 num_vfs;
+	u16 num_vfs;
 #endif
 	struct enic_port_profile *pp;
 
diff --git a/drivers/net/ethernet/cisco/enic/enic_main.c b/drivers/net/ethernet/cisco/enic/enic_main.c
index e27ec1d..9080ed6 100644
--- a/drivers/net/ethernet/cisco/enic/enic_main.c
+++ b/drivers/net/ethernet/cisco/enic/enic_main.c
@@ -2390,7 +2390,7 @@ static int __devinit enic_probe(struct pci_dev *pdev,
 	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
 	if (pos) {
 		pci_read_config_word(pdev, pos + PCI_SRIOV_TOTAL_VF,
-			(u16 *)&enic->num_vfs);
+			&enic->num_vfs);
 		if (enic->num_vfs) {
 			err = pci_enable_sriov(pdev, enic->num_vfs);
 			if (err) {
