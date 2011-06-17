From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jun 2011 03:51:53 +0000
Subject: Re: [patch -next] rtnetlink: unlock on error path in netlink_dump()
Message-Id: <20110616.235153.1947044865028978184.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110615131142.GE23739@shale.localdomain>
In-Reply-To: <20110615131142.GE23739@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: gregory.v.rose@intel.com, eric.dumazet@gmail.com, kaber@trash.net, chrisw@sous-sol.org, jeffrey.t.kirsher@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 15 Jun 2011 16:11:42 +0300

> In c7ac8679bec939 "rtnetlink: Compute and store minimum ifinfo dump
> size", we moved the allocation under the lock so we need to unlock
> on error path.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks.
