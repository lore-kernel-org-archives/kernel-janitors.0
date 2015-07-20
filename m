From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jul 2015 14:54:36 +0000
Subject: re: blkcg: fix blkcg_policy_data allocation bug
Message-Id: <20150720145436.GA19257@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tejun Heo,

The patch 06b285bd1125: "blkcg: fix blkcg_policy_data allocation bug"
from Jul 9, 2015, leads to the following static checker warning:

	block/blk-cgroup.c:1219 blkcg_policy_register()
	error: double unlock 'mutex:&blkcg_pol_mutex'

block/blk-cgroup.c
  1184          /* allocate and install cpd's */
  1185          if (pol->cpd_size) {
  1186                  list_for_each_entry(blkcg, &all_blkcgs, all_blkcgs_node) {
  1187                          struct blkcg_policy_data *cpd;
  1188  
  1189                          cpd = kzalloc(pol->cpd_size, GFP_KERNEL);
  1190                          if (!cpd) {
  1191                                  mutex_unlock(&blkcg_pol_mutex);
                                                      ^^^^^^^^^^^^^^^
Free.

  1192                                  goto err_free_cpds;
  1193                          }
  1194  
  1195                          blkcg->pd[pol->plid] = cpd;
  1196                          cpd->plid = pol->plid;
  1197                          pol->cpd_init_fn(blkcg);
  1198                  }
  1199          }
  1200  
  1201          mutex_unlock(&blkcg_pol_mutex);
  1202  
  1203          /* everything is in place, add intf files for the new policy */
  1204          if (pol->cftypes)
  1205                  WARN_ON(cgroup_add_legacy_cftypes(&blkio_cgrp_subsys,
  1206                                                    pol->cftypes));
  1207          mutex_unlock(&blkcg_pol_register_mutex);
  1208          return 0;
  1209  
  1210  err_free_cpds:
  1211          if (pol->cpd_size) {
  1212                  list_for_each_entry(blkcg, &all_blkcgs, all_blkcgs_node) {
  1213                          kfree(blkcg->pd[pol->plid]);
  1214                          blkcg->pd[pol->plid] = NULL;
  1215                  }
  1216          }
  1217          blkcg_policy[pol->plid] = NULL;
  1218  err_unlock:
  1219          mutex_unlock(&blkcg_pol_mutex);
                              ^^^^^^^^^^^^^^^
Double free.

  1220          mutex_unlock(&blkcg_pol_register_mutex);
  1221          return ret;
  1222  }
  1223  EXPORT_SYMBOL_GPL(blkcg_policy_register);

regards,
dan carpenter
