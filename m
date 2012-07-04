From: David Howells <dhowells@redhat.com>
Date: Wed, 04 Jul 2012 09:45:25 +0000
Subject: Re: [patch] VFS: copy_tree() returns an error pointer now
Message-Id: <31862.1341395125@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120704073945.GA30520@elgon.mountain>
In-Reply-To: <20120704073945.GA30520@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We recently changed copy_tree() to return an error pointer in
> d196d8d327 ('VFS: Make clone_mnt()/copy_tree()/collect_mounts() return
> errors').  This call needs to be updated as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: David Howells <dhowells@redhat.com>
