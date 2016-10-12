From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:11:18 +0000
Subject: [bug report] rxrpc: Add IPv6 support
Message-Id: <20161012061118.GI12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello David Howells,

The patch 75b54cb57ca3: "rxrpc: Add IPv6 support" from Sep 13, 2016,
leads to the following static checker warning:

	net/rxrpc/peer_object.c:196 rxrpc_assess_MTU_size()
	warn: 'dst' isn't an ERR_PTR

net/rxrpc/peer_object.c
   193                  fl6->fl6_dport = htons(7001);
   194                  fl6->fl6_sport = htons(7000);
   195                  dst = ip6_route_output(&init_net, NULL, fl6);
   196                  if (IS_ERR(dst)) {
                            ^^^^^^^^^^^
Maybe you want to check dst->error?

   197                          _leave(" [route err %ld]", PTR_ERR(dst));
   198                          return;
   199                  }
   200                  break;

regards,
dan carpenter
