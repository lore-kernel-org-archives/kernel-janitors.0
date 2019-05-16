From: Mike Marshall <hubcap@omnibond.com>
Date: Thu, 16 May 2019 16:06:31 +0000
Subject: Re: [PATCH] orangefs: remove redundant assignment to variable buffer_index
Message-Id: <CAOg9mSQt42NQu-3nwZOCGOPx45y7G8aaiDaVe4SwotGnD9iY1A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190511132700.4862-1-colin.king@canonical.com>
In-Reply-To: <20190511132700.4862-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>

Hi Colin...

Thanks for the patch. Before I initialized buffer_index, Dan Williams sent
in a warning that a particular error path could try to use ibuffer_index
uninitialized. I could induce the problem he described with one
of the xfstests resulting in a crashed kernel. I will try to refactor
the code to fix the problem some other way than initializing
buffer_index in the declaration.

-Mike

On Sat, May 11, 2019 at 9:27 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable buffer_index is being initialized however this is never
> read and later it is being reassigned to a new value. The initialization
> is redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/orangefs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
> index a35c17017210..80f06ee794c5 100644
> --- a/fs/orangefs/file.c
> +++ b/fs/orangefs/file.c
> @@ -52,7 +52,7 @@ ssize_t wait_for_direct_io(enum ORANGEFS_io_type type, struct inode *inode,
>         struct orangefs_inode_s *orangefs_inode = ORANGEFS_I(inode);
>         struct orangefs_khandle *handle = &orangefs_inode->refn.khandle;
>         struct orangefs_kernel_op_s *new_op = NULL;
> -       int buffer_index = -1;
> +       int buffer_index;
>         ssize_t ret;
>         size_t copy_amount;
>
> --
> 2.20.1
>
