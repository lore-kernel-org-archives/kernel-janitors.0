From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Nov 2017 06:14:17 +0000
Subject: [PATCH net-next] liquidio: Missing error code in liquidio_init_nic_module()
Message-Id: <20171114061417.ejguuk3tef3lq4r5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Vijaya Mohan Guvva <vijaya.guvva@cavium.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success if lio_vf_rep_modinit() fails instead of
propogating the error code.

Fixes: e20f469660ad ("liquidio: synchronize VF representor names with NIC firmware")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index f05045a69dcc..6aa0eee88ea5 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -4038,7 +4038,8 @@ static int liquidio_init_nic_module(struct octeon_device *oct)
 	 */
 	if (!oct->octeon_id &&
 	    oct->fw_info.app_cap_flags & LIQUIDIO_SWITCHDEV_CAP) {
-		if (lio_vf_rep_modinit()) {
+		retval = lio_vf_rep_modinit();
+		if (retval) {
 			liquidio_stop_nic_module(oct);
 			goto octnet_init_failure;
 		}
