From: David Howells <dhowells@redhat.com>
Date: Sun, 12 May 2019 20:06:24 +0000
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an error value
Message-Id: <6819.1557691584@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5CD8697B.6010004@bfs.de> <5CD844B0.5060206@bfs.de> <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk> <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk> <31808.1557684645@warthog.procyon.org.uk>
In-Reply-To: <5CD8697B.6010004@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: dhowells@redhat.com, colin.king@canonical.com, joe@perches.com, jaltman@auristor.com, linux-afs@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

walter harms <wharms@bfs.de> wrote:

> Sorry, you misunderstood me, my fault, i did not see that size is unsigned.
> NTL i do not think size=0 is useful.

Allow me to quote from the getxattr manpage:

       If size is specified as zero, these calls return the  current  size  of
       the  named extended attribute (and leave value unchanged).  This can be
       used to determine the size of the buffer that should be supplied  in  a
       subsequent  call.   [...]

> while you are there:
>   flags |= YFS_ACL_WANT_ACL is always flags = YFS_ACL_WANT_ACL;
> since flags is 0 at this point.
> IMHO that sould be moved to the strcmp() section.

Why?  It makes the strcmp() section more complicated and means I now either
have to cache flags in a variable or do the allocation of yacl first.

David
