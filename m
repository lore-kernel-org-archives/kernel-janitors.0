From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 09 Jun 2015 05:56:41 +0000
Subject: Re: [PATCH] perf tools: Add error handling
Message-Id: <alpine.DEB.2.02.1506090755520.2069@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433817301-15360-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433817301-15360-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 9 Jun 2015, Firo Yang wrote:

> Add error handling code for snprintf and rename in check_backup.
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  tools/perf/util/data.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
> index 1921942..d3a7363 100644
> --- a/tools/perf/util/data.c
> +++ b/tools/perf/util/data.c
> @@ -32,15 +32,26 @@ static bool check_pipe(struct perf_data_file *file)
>  
>  static int check_backup(struct perf_data_file *file)
>  {
> +	int ret;
>  	struct stat st;
>  
>  	if (!stat(file->path, &st) && st.st_size) {
> -		/* TODO check errors properly */
>  		char oldname[PATH_MAX];
> -		snprintf(oldname, sizeof(oldname), "%s.old",
> +		ret = snprintf(oldname, sizeof(oldname), "%s.old",
>  			 file->path);
> +		if (ret < 0) {
> +			pr_err("failed to make name %s.old\n", file->path);
> +			return -1;

Why -1?  See what error code is typically used for these functions and 
return that.

julia

> +		}
> +
>  		unlink(oldname);
> -		rename(file->path, oldname);
> +
> +		ret = rename(file->path, oldname);
> +		if (ret < 0) {
> +			pr_err("failed to rename %s to %s\n", file->path,
> +				oldname);
> +			return -1;
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
