From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Oct 2020 10:39:18 +0000
Subject: [bug report] chelsio/chtls: Fix panic when listen on multiadapter
Message-Id: <20201030103918.GA3241259@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Vinay Kumar Yadav,

The patch 9819f22c410b: "chelsio/chtls: Fix panic when listen on
multiadapter" from Oct 19, 2020, leads to the following static
checker warning:

	drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:137 chtls_find_netdev()
	warn: 'ndev' held on error path.

drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
    92  static struct net_device *chtls_find_netdev(struct chtls_dev *cdev,
    93                                              struct sock *sk)
    94  {
    95          struct adapter *adap = pci_get_drvdata(cdev->pdev);
    96          struct net_device *ndev = cdev->ports[0];
                                   ^^^^^^^^^^^^^^^^^^^^^

The reference counting in this function is pretty confusing.  I would
have expected it to take a dev_hold() reference on all paths before
returning.

No dev_hold() here, though.

    97  #if IS_ENABLED(CONFIG_IPV6)
    98          struct net_device *temp;
    99          int addr_type;
   100  #endif
   101          int i;
   102  
   103          switch (sk->sk_family) {
   104          case PF_INET:
   105                  if (likely(!inet_sk(sk)->inet_rcv_saddr))
   106                          return ndev;
   107                  ndev = __ip_dev_find(&init_net, inet_sk(sk)->inet_rcv_saddr, false);

__ip_dev_find call dev_hold()

   108                  break;
   109  #if IS_ENABLED(CONFIG_IPV6)
   110          case PF_INET6:
   111                  addr_type = ipv6_addr_type(&sk->sk_v6_rcv_saddr);
   112                  if (likely(addr_type = IPV6_ADDR_ANY))
   113                          return ndev;
   114  
   115                  for_each_netdev_rcu(&init_net, temp) {
   116                          if (ipv6_chk_addr(&init_net, (struct in6_addr *)
   117                                            &sk->sk_v6_rcv_saddr, temp, 1)) {
   118                                  ndev = temp;

No dev_hold().

   119                                  break;
   120                          }
   121                  }
   122          break;
   123  #endif
   124          default:
   125                  return NULL;
   126          }
   127  
   128          if (!ndev)
   129                  return NULL;
   130  
   131          if (is_vlan_dev(ndev))
   132                  ndev = vlan_dev_real_dev(ndev);
   133  
   134          for_each_port(adap, i)
   135                  if (cdev->ports[i] = ndev)
   136                          return ndev;
                                ^^^^^^^^^^^
We're holding dev_hold() for ipv4 but not for ipv6.

   137          return NULL;
                ^^^^^^^^^^^^
Smatch complains that if we hit this for ipv4 then we're leaking a
dev_hold() reference.

   138  }

regards,
dan carpenter
