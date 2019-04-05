From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Apr 2019 16:33:44 +0000
Subject: [PATCH] scsi: mptfusion: fix sign-extension on large shift of 1
Message-Id: <20190405163344.7287-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the int value 1 can lead to sign-extension overflow when the shift
is 31 bits and ending up with the upper 32 bits being set.  Fix this by
shifting 1ULL instead of 1.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/message/fusion/mptsas.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
index 6a79cd0ebe2b..e6e9dffe1b5c 100644
--- a/drivers/message/fusion/mptsas.c
+++ b/drivers/message/fusion/mptsas.c
@@ -854,7 +854,7 @@ mptsas_setup_wide_ports(MPT_ADAPTER *ioc, struct mptsas_portinfo *port_info)
 		    "%s: [%p]: deleting phy = %d\n",
 		    ioc->name, __func__, port_details, i));
 		port_details->num_phys--;
-		port_details->phy_bitmask &= ~ (1 << phy_info->phy_id);
+		port_details->phy_bitmask &= ~(1ULL << phy_info->phy_id);
 		memset(&phy_info->attached, 0, sizeof(struct mptsas_devinfo));
 		if (phy_info->phy) {
 			devtprintk(ioc, dev_printk(KERN_DEBUG,
@@ -889,7 +889,7 @@ mptsas_setup_wide_ports(MPT_ADAPTER *ioc, struct mptsas_portinfo *port_info)
 			port_details->port_info = port_info;
 			if (phy_info->phy_id < 64 )
 				port_details->phy_bitmask |-				    (1 << phy_info->phy_id);
+				    (1ULL << phy_info->phy_id);
 			phy_info->sas_port_add_phy=1;
 			dsaswideprintk(ioc, printk(MYIOC_s_DEBUG_FMT "\t\tForming port\n\t\t"
 			    "phy_id=%d sas_address=0x%018llX\n",
@@ -931,7 +931,7 @@ mptsas_setup_wide_ports(MPT_ADAPTER *ioc, struct mptsas_portinfo *port_info)
 			phy_info_cmp->port_details = port_details;
 			if (phy_info_cmp->phy_id < 64 )
 				port_details->phy_bitmask |-				(1 << phy_info_cmp->phy_id);
+				(1ULL << phy_info_cmp->phy_id);
 			port_details->num_phys++;
 		}
 	}
-- 
2.20.1
