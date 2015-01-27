From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Jan 2015 06:45:36 +0000
Subject: Re: [patch] posix_acl: cleanup posix_acl_create()
Message-Id: <20150127064536.GQ6456@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150124193124.GA18322@mwanda>
 <20150127045209.GA1608@mew>
In-Reply-To: <20150127045209.GA1608@mew>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Omar Sandoval <osandov@osandov.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 26, 2015 at 08:52:09PM -0800, Omar Sandoval wrote:
> Hi, Dan,
> 
> On Sat, Jan 24, 2015 at 10:31:24PM +0300, Dan Carpenter wrote:
> > If posix_acl_create() returns an error code then "*acl" and
> > "*default_acl" can be uninitialized or point to freed memory.  This
> > causes problems in some of the callers where it is expected that they
> > are NULL on error.  For example, ocfs2_reflink() has a bug.
> > 
> > 	fs/ocfs2/refcounttree.c:4329 ocfs2_reflink()
> > 	error: potentially using uninitialized 'default_acl'.
> > 
> > I have re-written this function and re-arranged things so that they are
> > set to NULL at the start and then only set to a valid pointer at the end
> > of the function.
> > 
> I'm inclined to blame ocfs2 and not posix_acl_create() here. I'd imagine
> that most C programmers' intuition is generally not to trust any return
> parameters when the return value is an error. Accordingly, a quick scan
> of the tree showed that all of the other users of posix_acl_create() are
> doing it correctly and only calling posix_acl_release() when it returns
> success.

Both ocfs2_reflink() and posix_acl_create() are ugly.

ocfs2_reflink() uses an "out:" label.  Whenever you see an "out:" label
then, hopefully, people are just too lazy to name their labels but a lot
of the time an out label means the code is going to do something stupid.
In this case, it's doing "one err" style error handling where it just
has one error label that tries to free everything including the stuff
that was never allocated.  One Err Bugs like this are very common in the
kernel.

Still it's bad to return freed pointers because you know that it's going
to cause double frees.  And also posix_acl_create() was messy in
general.

Both functions should be cleaned up but I am too busy to clean up the
whole kernel.

regards,
dan carpenter

