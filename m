From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 26 Aug 2020 12:49:47 +0000
Subject: Re: [PATCH] selinux: fix error handling bugs in security_load_policy()
Message-Id: <CAEjxPJ45hfBr6S1jT3iSOcSiccfWWFcqJC-q9R5qbRndT_DNCA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826113148.GA393664@mwanda>
In-Reply-To: <20200826113148.GA393664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, Jeff Vander Stoep <jeffv@google.com>, SElinux list <selinux@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Aug 26, 2020 at 7:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There are a few bugs in the error handling for security_load_policy().
>
> 1) If the newpolicy->sidtab allocation fails then it leads to a NULL
>    dereference.  Also the error code was not set to -ENOMEM on that
>    path.
> 2) If policydb_read() failed then we call policydb_destroy() twice
>    which meands we call kvfree(p->sym_val_to_name[i]) twice.
> 3) If policydb_load_isids() failed then we call sidtab_destroy() twice
>    and that results in a double free in the sidtab_destroy_tree()
>    function because entry.ptr_inner and entry.ptr_leaf are not set to
>    NULL.
>
> One thing that makes this code nice to deal with is that none of the
> functions return partially allocated data.  In other words, the
> policydb_read() either allocates everything successfully or it frees
> all the data it allocates.  It never returns a mix of allocated and
> not allocated data.
>
> I re-wrote this to only free the successfully allocated data which
> avoids the double frees.  I also re-ordered selinux_policy_free() so
> it's in the reverse order of the allocation function.
>
> Fixes: c7c556f1e81b ("selinux: refactor changing booleans")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I guess this wasn't against current selinux next branch?

patching file security/selinux/ss/services.c
Hunk #1 succeeded at 2145 (offset 18 lines).
Hunk #2 succeeded at 2263 (offset 39 lines).
Hunk #3 succeeded at 2303 with fuzz 1 (offset 47 lines).
Hunk #4 succeeded at 2323 (offset 42 lines).

But otherwise it looked good to me.

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
