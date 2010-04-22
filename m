From: Patrick McHardy <kaber@trash.net>
Date: Thu, 22 Apr 2010 10:35:06 +0000
Subject: Re: [patch] rtnetlink: potential ERR_PTR dereference
Message-Id: <4BD0265A.2000301@trash.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422095327.GP29647@bicker>
In-Reply-To: <20100422095327.GP29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, "Eric W. Biederman" <ebiederm@aristanetworks.com>, Mitch Williams <mitch.a.williams@intel.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> In the original code, if rtnl_create_link() returned an ERR_PTR then that
> would get passed to rtnl_configure_link() which dereferences it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Found by a static checker, and compile tested only.  :/

Looks fine to me.

Acked-by: Patrick McHardy <kaber@trash.net>
