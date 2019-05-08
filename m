From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 08 May 2019 08:48:38 +0000
Subject: Re: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
Message-Id: <20190508084838.w7t3nwamobpmwgkv@holly.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190506125018.GA13799@mwanda>
In-Reply-To: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 06, 2019 at 03:50:18PM +0300, Dan Carpenter wrote:
> The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
> cpu in a bitmap of online cpus, but if the value is too high then it
> could read beyond the end of the bitmap and possibly Oops.
> 
> Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Just out of interest... why isn't this copied to LKML? Omiting LKML makes
the patch hard to find in a patchwork instance.


Daniel.

> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index fc96dbf8d9de..9ecfa37c7fbf 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2583,7 +2583,7 @@ static int kdb_per_cpu(int argc, const char **argv)
>  		diag = kdbgetularg(argv[3], &whichcpu);
>  		if (diag)
>  			return diag;
> -		if (!cpu_online(whichcpu)) {
> +		if (whichcpu >= nr_cpu_ids || !cpu_online(whichcpu)) {
>  			kdb_printf("cpu %ld is not online\n", whichcpu);
>  			return KDB_BADCPUNUM;
>  		}
> -- 
> 2.18.0
> 
