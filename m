From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 18:20:04 +0000
Subject: SUNRPC: Checking a kmemdup() call in xdr_netobj_dup()
Message-Id: <9b5a5e63-2a24-ad79-20e2-4c01331ee041@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, "J. Bruce Fields" <bfields@fieldses.org>, Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “xdr_netobj_dup” contains still an unchecked call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/sunrpc/xdr.h?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n167
https://elixir.bootlin.com/linux/v5.4-rc2/source/include/linux/sunrpc/xdr.h#L167

How do you think about to improve it?

Regards,
Markus
