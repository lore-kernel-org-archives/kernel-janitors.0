From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jan 2018 13:49:29 +0000
Subject: [bug report] net: sched: use block index as a handle instead of qdisc when block is shared
Message-Id: <20180119134929.GA3392@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jiri Pirko,

The patch 7960d1daf278: "net: sched: use block index as a handle
instead of qdisc when block is shared" from Jan 17, 2018, leads to
the following static checker warning:

	net/sched/cls_api.c:1362 tc_dump_tfilter()
	error: uninitialized symbol 'parent'.

net/sched/cls_api.c
  1296  static int tc_dump_tfilter(struct sk_buff *skb, struct netlink_callback *cb)
  1297  {
  1298          struct net *net = sock_net(skb->sk);
  1299          struct nlattr *tca[TCA_MAX + 1];
  1300          struct Qdisc *q = NULL;
  1301          struct tcf_block *block;
  1302          struct tcf_chain *chain;
  1303          struct tcmsg *tcm = nlmsg_data(cb->nlh);
  1304          long index_start;
  1305          long index;
  1306          u32 parent;
                ^^^^^^^^^^
  1307          int err;
  1308  
  1309          if (nlmsg_len(cb->nlh) < sizeof(*tcm))
  1310                  return skb->len;
  1311  
  1312          err = nlmsg_parse(cb->nlh, sizeof(*tcm), tca, TCA_MAX, NULL, NULL);
  1313          if (err)
  1314                  return err;
  1315  
  1316          if (tcm->tcm_ifindex = TCM_IFINDEX_MAGIC_BLOCK) {
  1317                  block = tcf_block_lookup(net, tcm->tcm_block_index);
  1318                  if (!block)
  1319                          goto out;

Assume tcf_block_lookup() succeeds.

  1320          } else {
  1321                  const struct Qdisc_class_ops *cops;
  1322                  struct net_device *dev;
  1323                  unsigned long cl = 0;
  1324  
  1325                  dev = __dev_get_by_index(net, tcm->tcm_ifindex);
  1326                  if (!dev)
  1327                          return skb->len;
  1328  
  1329                  parent = tcm->tcm_parent;
  1330                  if (!parent) {
  1331                          q = dev->qdisc;
  1332                          parent = q->handle;
  1333                  } else {
  1334                          q = qdisc_lookup(dev, TC_H_MAJ(tcm->tcm_parent));
  1335                  }
  1336                  if (!q)
  1337                          goto out;
  1338                  cops = q->ops->cl_ops;
  1339                  if (!cops)
  1340                          goto out;
  1341                  if (!cops->tcf_block)
  1342                          goto out;
  1343                  if (TC_H_MIN(tcm->tcm_parent)) {
  1344                          cl = cops->find(q, tcm->tcm_parent);
  1345                          if (cl = 0)
  1346                                  goto out;
  1347                  }
  1348                  block = cops->tcf_block(q, cl, NULL);
  1349                  if (!block)
  1350                          goto out;
  1351                  if (tcf_block_shared(block))
  1352                          q = NULL;
  1353          }
  1354  
  1355          index_start = cb->args[0];
  1356          index = 0;
  1357  
  1358          list_for_each_entry(chain, &block->chain_list, list) {
  1359                  if (tca[TCA_CHAIN] &&
  1360                      nla_get_u32(tca[TCA_CHAIN]) != chain->index)
  1361                          continue;
  1362                  if (!tcf_chain_dump(chain, q, parent, skb, cb,
                                                      ^^^^^^
Smatch thinks "parent" is uninitialized here.

  1363                                      index_start, &index))
  1364                          break;
  1365          }
  1366  
  1367          cb->args[0] = index;
  1368  
  1369  out:
  1370          return skb->len;
  1371  }

regards,
dan carpenter
