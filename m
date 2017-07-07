From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jul 2017 12:36:15 +0000
Subject: [bug report] mpls: route get support
Message-Id: <20170707123615.pk4xal5dhvob3icr@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Roopa Prabhu,

The patch 397fc9e5cefe: "mpls: route get support" from Jul 3, 2017,
leads to the following static checker warning:

	net/mpls/af_mpls.c:2111 mpls_getroute()
	error: uninitialized symbol 'in_label'.

net/mpls/af_mpls.c
  2074  static int mpls_getroute(struct sk_buff *in_skb, struct nlmsghdr *in_nlh,
  2075                           struct netlink_ext_ack *extack)
  2076  {
  2077          struct net *net = sock_net(in_skb->sk);
  2078          u32 portid = NETLINK_CB(in_skb).portid;
  2079          struct nlattr *tb[RTA_MAX + 1];
  2080          u32 labels[MAX_NEW_LABELS];
  2081          struct mpls_shim_hdr *hdr;
  2082          unsigned int hdr_size = 0;
  2083          struct net_device *dev;
  2084          struct mpls_route *rt;
  2085          struct rtmsg *rtm, *r;
  2086          struct nlmsghdr *nlh;
  2087          struct sk_buff *skb;
  2088          struct mpls_nh *nh;
  2089          int err = -EINVAL;
  2090          u32 in_label;
                ^^^^^^^^^^^^

  2091          u8 n_labels;
  2092  
  2093          err = nlmsg_parse(in_nlh, sizeof(*rtm), tb, RTA_MAX,
  2094                            rtm_mpls_policy, extack);
  2095          if (err < 0)
  2096                  goto errout;
  2097  
  2098          rtm = nlmsg_data(in_nlh);
  2099  
  2100          if (tb[RTA_DST]) {
  2101                  u8 label_count;
  2102  
  2103                  if (nla_get_labels(tb[RTA_DST], 1, &label_count,
  2104                                     &in_label, extack))
                                           ^^^^^^^^^
Only initialized inside the if statement.

  2105                          goto errout;
  2106  
  2107                  if (in_label < MPLS_LABEL_FIRST_UNRESERVED)
  2108                          goto errout;
  2109          }
  2110  
  2111          rt = mpls_route_input_rcu(net, in_label);
                                               ^^^^^^^^
Uninitialized variable use.

  2112          if (!rt) {
  2113                  err = -ENETUNREACH;
  2114                  goto errout;
  2115          }

regards,
dan carpenter
