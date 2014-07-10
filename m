From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jul 2014 21:00:37 +0000
Subject: re: net/hsr: Better frame dispatch
Message-Id: <20140710210037.GA14669@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Arvid Brodin,

The patch f266a683a480: "net/hsr: Better frame dispatch" from Jul 4,
2014, leads to the following static checker warning:

	net/hsr/hsr_framereg.c:293 hsr_addr_subst_dest()
	warn: this array is probably non-NULL. 'node_dst->MacAddressB'

net/hsr/hsr_framereg.c
   286          node_dst = find_node_by_AddrA(&port->hsr->node_db, eth_hdr(skb)->h_dest);
   287          if (!node_dst) {
   288                  WARN_ONCE(1, "%s: Unknown node\n", __func__);
   289                  return;
   290          }
   291          if (port->type != node_dst->AddrB_port)
   292                  return;
   293          if (!node_dst->MacAddressB) {
                    ^^^^^^^^^^^^^^^^^^^^^^
This test is never true.  It could be deleted or replaced.

   294                  WARN_ONCE(1, "%s: No MacAddressB\n", __func__);
   295                  return;
   296          }
   297  

regards,
dan carpenter
