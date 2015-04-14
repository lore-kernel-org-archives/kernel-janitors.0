From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Apr 2015 15:59:17 +0000
Subject: re: fou: implement FOU_CMD_GET
Message-Id: <20150414155917.GA4693@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello WANG Cong,

The patch 7a6c8c34e5b7: "fou: implement FOU_CMD_GET" from Apr 10,
2015, leads to the following static checker warning:

	net/ipv4/fou.c:720 fou_nl_dump()
	warn: 'mutex:&fn->fou_lock' is sometimes locked here and sometimes unlocked.

net/ipv4/fou.c
   699  static int fou_nl_dump(struct sk_buff *skb, struct netlink_callback *cb)
   700  {
   701          struct net *net = sock_net(skb->sk);
   702          struct fou_net *fn = net_generic(net, fou_net_id);
   703          struct fou *fout;
   704          int idx = 0, ret;
   705  
   706          mutex_lock(&fn->fou_lock);
   707          list_for_each_entry(fout, &fn->fou_list, list) {
   708                  if (idx++ < cb->args[0])
   709                          continue;
   710                  ret = fou_dump_info(fout, NETLINK_CB(cb->skb).portid,
   711                                      cb->nlh->nlmsg_seq, NLM_F_MULTI,
   712                                      skb, FOU_CMD_GET);
   713                  if (ret)
   714                          goto done;
   715          }
   716          mutex_unlock(&fn->fou_lock);
   717  
   718  done:

Probably the unlock should happen after the label.

   719          cb->args[0] = idx;
   720          return skb->len;
   721  }

regards,
dan carpenter
