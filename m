From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Mon, 14 Oct 2019 22:33:50 +0000
Subject: Re: SUNRPC: Checking a kmemdup() call in xdr_netobj_dup()
Message-Id: <20191014223350.GA19883@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b5a5e63-2a24-ad79-20e2-4c01331ee041@web.de>
In-Reply-To: <9b5a5e63-2a24-ad79-20e2-4c01331ee041@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

On Sat, Oct 12, 2019 at 08:20:04PM +0200, Markus Elfring wrote:
> I tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “xdr_netobj_dup” contains still an unchecked call
> of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/sunrpc/xdr.h?id0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n167
> https://elixir.bootlin.com/linux/v5.4-rc2/source/include/linux/sunrpc/xdr.h#L167
> 
> How do you think about to improve it?

On a quick check--I see five xdr_netobj_dup callers, and all of them
check whether dst->data is NULL.

Sounds like a false positive for your tool?

--b.
