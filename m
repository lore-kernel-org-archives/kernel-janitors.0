From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 25 Jul 2012 12:18:21 +0000
Subject: [linus:master 78/90] drivers/infiniband/hw/ocrdma/ocrdma_verbs.c:895:6-54: duplicated argument to
Message-Id: <20120725121821.GB28963@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="FkmkrVfFsRoUs1wW"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roland,

Some coccinelle warnings are found:

drivers/infiniband/hw/ocrdma/ocrdma_verbs.c:895:6-54: duplicated argument to && or ||
drivers/infiniband/core/cma.c:3067:1-3: WARNING: PTR_RET can be used
drivers/infiniband/core/ucma.c:1005:10-17: WARNING opportunity for memdep_user

And the 2nd one can be quieted by the attached patch :)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--FkmkrVfFsRoUs1wW
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="44437-44445.patch"

spatch: api/ptr_ret.cocci


 Use PTR_RET rather than if(IS_ERR(...)) + PTR_ERR

--- /c/kernel-tests/src/linux/drivers/infiniband/core/cma.c
+++ /tmp/cocci-output-51533-104088-cma.c
@@ -3064,10 +3064,7 @@ static int cma_join_ib_multicast(struct
 						id_priv->id.port_num, &rec,
 						comp_mask, GFP_KERNEL,
 						cma_ib_mc_handler, mc);
-	if (IS_ERR(mc->multicast.ib))
-		return PTR_ERR(mc->multicast.ib);
-
-	return 0;
+	return PTR_RET(mc->multicast.ib);
 }
 
 static void iboe_mcast_work_handler(struct work_struct *work)

--FkmkrVfFsRoUs1wW--
