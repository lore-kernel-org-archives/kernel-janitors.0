From: Dominique Martinet <asmadeus@codewreck.org>
Date: Wed, 26 Sep 2018 21:07:26 +0000
Subject: Re: [PATCH] 9p: potential NULL dereference
Message-Id: <20180926210726.GA29761@nautica>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926103934.GA14535@mwanda>
In-Reply-To: <20180926103934.GA14535@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Van Hensbergen <ericvh@gmail.com>, Matthew Wilcox <willy@infradead.org>, Latchesar Ionkov <lucho@ionkov.net>, "David S. Miller" <davem@davemloft.net>, v9fs-developer@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter wrote on Wed, Sep 26, 2018:
> p9_tag_alloc() is supposed to return error pointers, but we accidentally
> return a NULL here.  It would cause a NULL dereference in the caller.
> 
> Fixes: 996d5b4db4b1 ("9p: Use a slab for allocating requests")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, the culprit commit is only in -next so just adding this to
the queue right away.

Thanks!
-- 
Dominique
