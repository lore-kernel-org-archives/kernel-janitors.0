From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 05 Jul 2019 08:24:39 +0000
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
Message-Id: <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704222803.4328-1-colin.king@canonical.com>
In-Reply-To: <20190704222803.4328-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 05.07.2019 1:28, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer fname rc is being assigned with a value that is never

    rc?

> read because the function returns after the assignment. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   fs/ubifs/debug.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
> index 92fe5c5ed78a..95da71e13fc8 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -2817,7 +2817,6 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
>   		     c->vi.ubi_num, c->vi.vol_id);
>   	if (n = UBIFS_DFS_DIR_LEN) {
>   		/* The array size is too small */
> -		fname = UBIFS_DFS_DIR_NAME;
>   		return;
>   	}
>   

MBR, Sergei
