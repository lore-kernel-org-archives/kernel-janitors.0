From: Tejun Heo <tj@kernel.org>
Date: Wed, 12 Sep 2012 18:42:00 +0000
Subject: Re: [PATCH] xattr: mark variable as uninitialized to make both gcc and smatch happy
Message-Id: <20120912184200.GQ7677@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912143112.GE19694@redhat.com>
In-Reply-To: <20120912143112.GE19694@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 12, 2012 at 10:31:13AM -0400, Aristeu Rozanski wrote:
> new_xattr in __simple_xattr_set() is only initialized with a valid
> pointer if value is not NULL, which only happens if this function is
> called directly with the intention to remove an existing extended
> attribute. Even being safe to be this way, smatch warns about possible
> NULL dereference. Dan Carpenter suggested using uninitialized_var()
> which will make both gcc and smatch happy.
> 
> Cc: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Aristeu Rozanski <aris@redhat.com>

applied to cgroup/for-3.7. Thanks.

-- 
tejun
