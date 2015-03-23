From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2015 15:56:12 +0000
Subject: re: vxlan: Move socket initialization to within rtnl scope
Message-Id: <20150323155612.GD24038@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Marcelo Ricardo Leitner,

This is a semi-automatic email about new static checker warnings.

The patch 56ef9c909b40: "vxlan: Move socket initialization to within 
rtnl scope" from Mar 18, 2015, leads to the following Smatch 
complaint:

drivers/net/vxlan.c:2267 vxlan_stop()
	 error: we previously assumed 'vs' could be null (see line 2257)

drivers/net/vxlan.c
  2256	
  2257		if (vs && vxlan_addr_multicast(&vxlan->default_dst.remote_ip) &&
                    ^^
Existing code assumed "vs" could be NULL.

  2258		    !vxlan_group_used(vn, vxlan)) {
  2259			ret = vxlan_igmp_leave(vxlan);
  2260			if (ret)
  2261				return ret;
  2262		}
  2263	
  2264		del_timer_sync(&vxlan->age_timer);
  2265	
  2266		vxlan_flush(vxlan);
  2267		vxlan_sock_release(vs);
                                   ^^
Patch adds new unchecked dereference.

  2268	
  2269		return ret;

regards,
dan carpenter
