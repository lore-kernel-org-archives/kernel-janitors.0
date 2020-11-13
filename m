From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Nov 2020 08:52:55 +0000
Subject: [bug report] netlabel: fix our progress tracking in netlbl_unlabel_staticlist()
Message-Id: <20201113085255.GA91999@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Paul Moore,

The patch 866358ec331f: "netlabel: fix our progress tracking in
netlbl_unlabel_staticlist()" from Nov 8, 2020, leads to the following
static checker warning:

	net/netlabel/netlabel_unlabeled.c:1190 netlbl_unlabel_staticlist()
	error: uninitialized symbol 'iter_chain'.

net/netlabel/netlabel_unlabeled.c
  1163  static int netlbl_unlabel_staticlist(struct sk_buff *skb,
  1164                                       struct netlink_callback *cb)
  1165  {
  1166          struct netlbl_unlhsh_walk_arg cb_arg;
  1167          u32 skip_bkt = cb->args[0];
  1168          u32 skip_chain = cb->args[1];
  1169          u32 skip_addr4 = cb->args[2];
  1170          u32 iter_bkt, iter_chain, iter_addr4 = 0, iter_addr6 = 0;
                              ^^^^^^^^^^
This used to be initialized here.

  1171          struct netlbl_unlhsh_iface *iface;
  1172          struct list_head *iter_list;
  1173          struct netlbl_af4list *addr4;
  1174  #if IS_ENABLED(CONFIG_IPV6)
  1175          u32 skip_addr6 = cb->args[3];
  1176          struct netlbl_af6list *addr6;
  1177  #endif
  1178  
  1179          cb_arg.nl_cb = cb;
  1180          cb_arg.skb = skb;
  1181          cb_arg.seq = cb->nlh->nlmsg_seq;
  1182  
  1183          rcu_read_lock();
  1184          for (iter_bkt = skip_bkt;
  1185               iter_bkt < rcu_dereference(netlbl_unlhsh)->size;
  1186               iter_bkt++) {
  1187                  iter_list = &rcu_dereference(netlbl_unlhsh)->tbl[iter_bkt];
  1188                  list_for_each_entry_rcu(iface, iter_list, list) {
  1189                          if (!iface->valid ||
  1190                              iter_chain++ < skip_chain)
                                    ^^^^^^^^^^^^
warning here.

  1191                                  continue;
  1192                          netlbl_af4list_foreach_rcu(addr4,
  1193                                                     &iface->addr4_list) {
  1194                                  if (iter_addr4++ < skip_addr4)
  1195                                          continue;
  1196                                  if (netlbl_unlabel_staticlist_gen(
  1197                                                NLBL_UNLABEL_C_STATICLIST,
  1198                                                iface,
  1199                                                netlbl_unlhsh_addr4_entry(addr4),
  1200                                                NULL,
  1201                                                &cb_arg) < 0) {
  1202                                          iter_addr4--;
  1203                                          iter_chain--;
  1204                                          goto unlabel_staticlist_return;
  1205                                  }
  1206                          }
  1207                          iter_addr4 = 0;
  1208                          skip_addr4 = 0;
  1209  #if IS_ENABLED(CONFIG_IPV6)
  1210                          netlbl_af6list_foreach_rcu(addr6,
  1211                                                     &iface->addr6_list) {
  1212                                  if (iter_addr6++ < skip_addr6)
  1213                                          continue;
  1214                                  if (netlbl_unlabel_staticlist_gen(
  1215                                                NLBL_UNLABEL_C_STATICLIST,
  1216                                                iface,
  1217                                                NULL,
  1218                                                netlbl_unlhsh_addr6_entry(addr6),
  1219                                                &cb_arg) < 0) {
  1220                                          iter_addr6--;
  1221                                          iter_chain--;
  1222                                          goto unlabel_staticlist_return;
  1223                                  }
  1224                          }
  1225                          iter_addr6 = 0;
  1226                          skip_addr6 = 0;
  1227  #endif /* IPv6 */
  1228                  }
  1229                  iter_chain = 0;
  1230                  skip_chain = 0;
  1231          }
  1232  
  1233  unlabel_staticlist_return:
  1234          rcu_read_unlock();
  1235          cb->args[0] = iter_bkt;
  1236          cb->args[1] = iter_chain;
  1237          cb->args[2] = iter_addr4;
  1238          cb->args[3] = iter_addr6;
  1239          return skb->len;
  1240  }

regards,
dan carpenter
