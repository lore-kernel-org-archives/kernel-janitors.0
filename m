From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 May 2015 17:52:27 +0000
Subject: re: netns: use a spin_lock to protect nsid management
Message-Id: <20150512175227.GA19020@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Nicolas Dichtel,

The patch 95f38411df05: "netns: use a spin_lock to protect nsid
management" from May 7, 2015, leads to the following static checker
warning:

	net/core/net_namespace.c:580 rtnl_net_newid()
	warn: inconsistent returns 'spin_lock:&nsid_lock'.

net/core/net_namespace.c
   565  
   566          spin_lock_irqsave(&nsid_lock, flags);
   567          if (__peernet2id(net, peer) >= 0) {
   568                  err = -EEXIST;
   569                  goto out;

I don't know if __peernet2id() unlocks on error but it can't possibly
restore flags so this isn't right.

   570          }
   571  
   572          err = alloc_netid(net, peer, nsid);
   573          spin_unlock_irqrestore(&nsid_lock, flags);
   574          if (err >= 0) {
   575                  rtnl_net_notifyid(net, RTM_NEWNSID, err);
   576                  err = 0;
   577          }
   578  out:
   579          put_net(peer);
   580          return err;
   581  }

regards,
dan carpenter
