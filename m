From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 14 Jul 2012 12:10:02 +0000
Subject: Re: [patch] VFS: copy_tree() returns an error pointer now
Message-Id: <20120714121002.GL22927@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120704073945.GA30520@elgon.mountain>
In-Reply-To: <20120704073945.GA30520@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2012 at 10:39:45AM +0300, Dan Carpenter wrote:
> We recently changed copy_tree() to return an error pointer in
> d196d8d327 ('VFS: Make clone_mnt()/copy_tree()/collect_mounts() return
> errors').  This call needs to be updated as well.

Folded.
