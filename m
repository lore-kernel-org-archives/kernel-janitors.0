From: David Howells <dhowells@redhat.com>
Date: Fri, 22 Jun 2018 12:36:01 +0000
Subject: Re: [PATCH] afs: memory leak in afs_init_fs_context()
Message-Id: <28859.1529670961@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180622111620.m5n42ezymkdrbyxf@kili.mountain>
In-Reply-To: <20180622111620.m5n42ezymkdrbyxf@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to free "ctx" before returning on this error path.

I already have a patch for this that I've folded in, thanks.

David
