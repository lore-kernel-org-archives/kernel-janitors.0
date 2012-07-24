From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 24 Jul 2012 04:03:27 +0000
Subject: Re: [next:akpm 234/309] lib/rbtree_test.c:107:2: warning: format '%llu' expects argument of type 'lo
Message-Id: <20120724040327.GB6957@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANN689F2v8Fm8hMq-6+_eQVg3Kn6OtBayfP0K==1EtMnAv0ttA@mail.gmail.com>
In-Reply-To: <CANN689F2v8Fm8hMq-6+_eQVg3Kn6OtBayfP0K==1EtMnAv0ttA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 23, 2012 at 06:14:42PM -0700, Andrew Morton wrote:
> On Mon, 23 Jul 2012 17:57:26 -0700 Michel Lespinasse <walken@google.com> wrote:
> 
> > On Sun, Jul 22, 2012 at 11:50 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > > lib/rbtree_test.c: In function 'rbtree_test_init':
> > > lib/rbtree_test.c:107:2: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type 'cycles_t' [-Wformat]
> > > lib/rbtree_test.c: In function 'check':
> > > lib/rbtree_test.c:76:4: warning: 'blacks' may be used uninitialized in this function [-Wuninitialized]
> > 
> > Andrew added a cast for the format issue.
> > 
> > Regarding the uninitialized 'blacks' value, gcc is actually wrong
> > about it (it will always be initialized on the first loop iteration),
> > but we should probably add = 0 on the variable declaration to make gcc
> > happy.
> 
> We should use uninitialized_var() if we're going to do that.  Because
> that avoids adding unneeded instructions and is self-documenting.
> 
> I saw that warning but assumed that later gcc's didn't emit it.  If
> that was wrong then yes, we should fix it.

Andrew, that false warning is emitted by sparc-linux-gcc 4.6.3.
gcc-4.7 no longer has this problem.

That explains why the x86_64-allmodconfig test didn't complain about
it. Hmm, since many cross compilers still use older gcc, I'll ignore
-Wuninitialized warnings from them in future.

Thanks,
Fengguang
