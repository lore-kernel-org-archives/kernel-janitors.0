From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2018 10:33:07 +0000
Subject: [bug report] xfrm: policy: store inexact policies in a tree ordered by destination address
Message-Id: <20181127103307.pmzdnge75333wfby@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Westphal,

The patch 9cf545ebd591: "xfrm: policy: store inexact policies in a
tree ordered by destination address" from Nov 7, 2018, leads to the
following static checker warning:

	net/xfrm/xfrm_policy.c:1316 xfrm_hash_rebuild()
	warn: 'dir' is out of bounds '3' vs '2'

net/xfrm/xfrm_policy.c
  1280          /* reset the bydst and inexact table in all directions */
  1281          xfrm_hash_reset_inexact_table(net);
  1282  
  1283          for (dir = 0; dir < XFRM_POLICY_MAX; dir++) {
                              ^^^^^^^^^^^^^^^^^^^^^
dir = XFRM_POLICY_MAX at the end of this loop.

  1284                  INIT_HLIST_HEAD(&net->xfrm.policy_inexact[dir]);
  1285                  hmask = net->xfrm.policy_bydst[dir].hmask;
  1286                  odst = net->xfrm.policy_bydst[dir].table;
  1287                  for (i = hmask; i >= 0; i--)
  1288                          INIT_HLIST_HEAD(odst + i);
  1289                  if ((dir & XFRM_POLICY_MASK) = XFRM_POLICY_OUT) {
  1290                          /* dir out => dst = remote, src = local */
  1291                          net->xfrm.policy_bydst[dir].dbits4 = rbits4;
  1292                          net->xfrm.policy_bydst[dir].sbits4 = lbits4;
  1293                          net->xfrm.policy_bydst[dir].dbits6 = rbits6;
  1294                          net->xfrm.policy_bydst[dir].sbits6 = lbits6;
  1295                  } else {
  1296                          /* dir in/fwd => dst = local, src = remote */
  1297                          net->xfrm.policy_bydst[dir].dbits4 = lbits4;
  1298                          net->xfrm.policy_bydst[dir].sbits4 = rbits4;
  1299                          net->xfrm.policy_bydst[dir].dbits6 = lbits6;
  1300                          net->xfrm.policy_bydst[dir].sbits6 = rbits6;
  1301                  }
  1302          }
  1303  
  1304          /* re-insert all policies by order of creation */
  1305          list_for_each_entry_reverse(policy, &net->xfrm.policy_all, walk.all) {
  1306                  if (policy->walk.dead ||
  1307                      xfrm_policy_id2dir(policy->index) >= XFRM_POLICY_MAX) {
  1308                          /* skip socket policies */
  1309                          continue;
  1310                  }
  1311                  newpos = NULL;
  1312                  chain = policy_hash_bysel(net, &policy->selector,
  1313                                            policy->family,
  1314                                            xfrm_policy_id2dir(policy->index));
  1315                  if (!chain) {
  1316                          void *p = xfrm_policy_inexact_insert(policy, dir, 0);
                                                                             ^^^
This seems like it can't be right.  I'm not sure what was intended.

  1317  
  1318                          WARN_ONCE(IS_ERR(p), "reinsert: %ld\n", PTR_ERR(p));
  1319                          continue;


regards,
dan carpenter
