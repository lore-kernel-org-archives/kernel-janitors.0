From: Aristeu Rozanski <aris@redhat.com>
Date: Wed, 12 Sep 2012 13:40:32 +0000
Subject: Re: [cgroup:for-next 5/6] fs/xattr.c:882 __simple_xattr_set() error: potential NULL dereference 'new
Message-Id: <20120912134031.GC19694@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912022813.GA17922@localhost>
In-Reply-To: <20120912022813.GA17922@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2012 at 10:55:17AM +0300, Dan Carpenter wrote:
> On Wed, Sep 12, 2012 at 10:28:13AM +0800, Fengguang Wu wrote:
> > Hi Aristeu,
> > 
> > FYI, there are new smatch warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
> > head:   9814e970d7947dcc5ab7b37a53514c0098bfacc9
> > commit: 38f38657444d15e1a8574eae80ed3de9f501737a xattr: extract simple_xattr code from tmpfs
> > 
> > 
> > fs/xattr.c:882 __simple_xattr_set() error: potential NULL dereference 'new_xattr'.
> > 
> 
> I don't know if this specific code is buggy or not.  It would depend
> on how the function is called.

this should be safe. the only way to have value = NULL (thus keeping
new_xattr from being initialized) is if you call __simple_xattr_set()
directly with the intention of removing an existing entry.

> But potentially I should disable this Smatch rule.  It tends to have
> a lot of false positives.  The thing is that GCC complains if you
> don't initialize "new_xattr", but if you initialize it to NULL then
> Smatch complains.
> 
> One solution might be to use the unitialized_var() macro.
> 
> -       struct simple_xattr *new_xattr = NULL;
> +       struct simple_xattr *uninitialized_var(new_xattr);
> 
> That would make both GCC and Smatch happy.

Sounds good to me. Will get a patch ready. Thanks Dan.

-- 
Aristeu

