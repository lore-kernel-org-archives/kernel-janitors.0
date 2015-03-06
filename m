From: David Miller <davem@davemloft.net>
Date: Fri, 06 Mar 2015 06:03:56 +0000
Subject: Re: [patch -next] ax25: remove unneeded NULL test in ax_xmit()
Message-Id: <20150306.010356.1391961581224590724.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150305174846.GA17072@mwanda>
In-Reply-To: <20150305174846.GA17072@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ebiederm@xmission.com, teg@jklm.no, dh.herrmann@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 5 Mar 2015 20:48:46 +0300

> We get a static checker warning here on devel kernels:
> 
> 	drivers/net/hamradio/mkiss.c:560 ax_xmit()
> 	warn: variable dereferenced before check 'skb' (see line 532)
> 
> It turns out that the NULL check can be deleted.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
