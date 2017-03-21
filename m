From: walter harms <wharms@bfs.de>
Date: Tue, 21 Mar 2017 17:02:14 +0000
Subject: Re: [PATCH] gen_init_cpio: allocate enough space for dname
Message-Id: <58D15C96.7010100@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170321164439.30828-1-colin.king@canonical.com>
In-Reply-To: <20170321164439.30828-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 21.03.2017 17:44, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The allocation of dname is short by 1 byte, so increase the allocation
> size.
> 
> Detected with CoverityScan, CID#711628 ("Out-of-bounds-access (OVERRUN)")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  usr/gen_init_cpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
> index 225ad244cf88..981682f4faea 100644
> --- a/usr/gen_init_cpio.c
> +++ b/usr/gen_init_cpio.c
> @@ -418,7 +418,7 @@ static int cpio_mkfile_line(const char *line)
>  		int len;
>  		int nend;
>  
> -		dname = malloc(strlen(line));
> +		dname = malloc(strlen(line) + 1);
>  		if (!dname) {
>  			fprintf (stderr, "out of memory (%d)\n", dname_len);
>  			goto fail;


this is a case for strdup()

re,
 wh
