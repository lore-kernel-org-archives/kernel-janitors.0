From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 09:06:37 +0000
Subject: [bug report] crypto/chtls: IPv6 support for inline TLS
Message-Id: <20200603090637.GA1760819@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vinay Kumar Yadav,

The patch 6abde0b24122: "crypto/chtls: IPv6 support for inline TLS"
from Jun 2, 2020, leads to the following static checker warning:

	drivers/crypto/chelsio/chtls/chtls_cm.c:110 chtls_find_netdev()
	warn: inconsistent indenting

drivers/crypto/chelsio/chtls/chtls_cm.c
    92  static struct net_device *chtls_find_netdev(struct chtls_dev *cdev,
    93                                              struct sock *sk)
    94  {
    95          struct net_device *ndev = cdev->ports[0];
    96          struct net_device *temp;
    97          int addr_type;
    98  
    99          switch (sk->sk_family) {
   100          case PF_INET:
   101                  if (likely(!inet_sk(sk)->inet_rcv_saddr))
   102                          return ndev;
   103                  ndev = ip_dev_find(&init_net, inet_sk(sk)->inet_rcv_saddr);
   104                  break;
   105          case PF_INET6:
   106                  addr_type = ipv6_addr_type(&sk->sk_v6_rcv_saddr);
   107                  if (likely(addr_type = IPV6_ADDR_ANY))
   108                          return ndev;
   109  
   110          for_each_netdev_rcu(&init_net, temp) {

Probably this should be indented another tab.

   111                  if (ipv6_chk_addr(&init_net, (struct in6_addr *)
   112                                    &sk->sk_v6_rcv_saddr, temp, 1)) {
   113                          ndev = temp;
   114                          break;
   115                  }
   116          }
   117          break;
   118          default:
   119                  return NULL;
   120          }
   121  
   122          if (!ndev)
   123                  return NULL;
   124  
   125          if (is_vlan_dev(ndev))
   126                  return vlan_dev_real_dev(ndev);
   127          return ndev;
   128  }

regards,
dan carpenter
