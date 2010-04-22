From: David Miller <davem@davemloft.net>
Date: Thu, 22 Apr 2010 22:57:49 +0000
Subject: Re: [patch] rtnetlink: potential ERR_PTR dereference
Message-Id: <20100422.155749.136502434.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422095327.GP29647@bicker>
In-Reply-To: <20100422095327.GP29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, eric.dumazet@gmail.com, kaber@trash.net, ebiederm@aristanetworks.com, mitch.a.williams@intel.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 11:53:27 +0200

> In the original code, if rtnl_create_link() returned an ERR_PTR then that
> would get passed to rtnl_configure_link() which dereferences it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
