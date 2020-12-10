From: Dave Young <dyoung@redhat.com>
Date: Thu, 10 Dec 2020 02:05:08 +0000
Subject: Re: [PATCH] kexec: Fix error code in kexec_calculate_store_digests()
Message-Id: <20201210020508.GB2950@dhcp-128-65.nay.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9B03LFICh/QykQ6@mwanda>
In-Reply-To: <X9B03LFICh/QykQ6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/08/20 at 10:55pm, Dan Carpenter wrote:
> Return -ENOMEM on allocation failure instead of returning success.
> 
> Fixes: a43cac0d9dc2 ("kexec: split kexec_file syscall code to kexec_file.c")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  kernel/kexec_file.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index b02086d70492..9570f380a825 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -735,8 +735,10 @@ static int kexec_calculate_store_digests(struct kimage *image)
>  
>  	sha_region_sz = KEXEC_SEGMENT_MAX * sizeof(struct kexec_sha_region);
>  	sha_regions = vzalloc(sha_region_sz);
> -	if (!sha_regions)
> +	if (!sha_regions) {
> +		ret = -ENOMEM;
>  		goto out_free_desc;
> +	}
>  
>  	desc->tfm   = tfm;
>  
> -- 
> 2.29.2
> 

Good catch, thanks!

Acked-by: Dave Young <dyoung@redhat.com>

Thanks
Dave
