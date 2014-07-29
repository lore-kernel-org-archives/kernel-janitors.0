From: David Miller <davem@davemloft.net>
Date: Tue, 29 Jul 2014 00:28:21 +0000
Subject: Re: [patch] bonding: fix a memory leak in bond_arp_send_all()
Message-Id: <20140728.172821.1662975923710334910.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140725122121.GC528@mwanda>
In-Reply-To: <20140725122121.GC528@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: j.vosburgh@gmail.com, vfalico@gmail.com, andy@greyhouse.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Jul 2014 15:21:21 +0300

> This test is reversed so the memory is always leaked.  It's better style
> to remove the test anyway.
> 
> Fixes: 3e403a77779f ('bonding: make it possible to have unlimited nested upper vlans')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, but in the future please make "net-next" submissions explicit by saying
something like "[PATCH net-next] " in your subject.

Thanks.
