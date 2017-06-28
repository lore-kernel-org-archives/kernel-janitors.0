From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jun 2017 11:30:37 +0000
Subject: [bug report] net: dsa: Remove master_netdev and use dst->cpu_dp->netdev
Message-Id: <20170628113037.p6zcxvav4x4o2byv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Florian Fainelli,

This is a semi-automatic email about new static checker warnings.

The patch 6d3c8c0dd88a: "net: dsa: Remove master_netdev and use 
dst->cpu_dp->netdev" from Jun 13, 2017, leads to the following Smatch 
complaint:

net/dsa/dsa2.c:447 dsa_dst_apply()
	 error: we previously assumed 'dst->cpu_dp' could be null (see line 436)

net/dsa/dsa2.c
   435	
   436		if (dst->cpu_dp) {
                    ^^^^^^^^^^^
The existing code assumes this can be NULL.

   437			err = dsa_cpu_port_ethtool_setup(dst->cpu_dp);
   438			if (err)
   439				return err;
   440		}
   441	
   442		/* If we use a tagging format that doesn't have an ethertype
   443		 * field, make sure that all packets from this point on get
   444		 * sent to the tag format's receive function.
   445		 */
   446		wmb();
   447		dst->cpu_dp->netdev->dsa_ptr = dst;
                ^^^^^^^^^^^^^
The patch derefrences it without checking.

   448		dst->applied = true;
   449	

regards,
dan carpenter
