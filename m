From: Kees Cook <keescook@chromium.org>
Date: Wed, 14 Aug 2013 14:25:03 +0000
Subject: Re: [patch] pstore: d_alloc_name() doesn't return an ERR_PTR
Message-Id: <CAGXu5j+tSY1MPTV383ij6Jgqf+dq+QVDtpcWdXmgNKL8gpc5zQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814115218.GC8044@elgon.mountain>
In-Reply-To: <20130814115218.GC8044@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Aug 14, 2013 at 4:52 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> d_alloc_name() returns NULL on error.  Also I changed the error code
> from -ENOSPC to -ENOMEM to reflect that we were short on RAM not disk
> space.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the catch!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
Chrome OS Security
