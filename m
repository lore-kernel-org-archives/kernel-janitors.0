From: John Johansen <john.johansen@canonical.com>
Date: Sat, 24 Mar 2018 00:23:14 +0000
Subject: Re: [PATCH][next] apparmor: fix error returns checks by making size a ssize_t
Message-Id: <e0117644-3bed-5374-6697-3fa2734b379d@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180323233422.7856-1-colin.king@canonical.com>
In-Reply-To: <20180323233422.7856-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On 03/23/2018 04:34 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently variable size is a unsigned size_t, hence comparisons to
> see if it is less than zero (for error checking) will always be
> false.  Fix this by making size a ssize_t
> 
> Detected by CoverityScan, CID#1466080 ("Unsigned compared against 0")
> 
> Fixes: 8e51f9087f40 ("apparmor: Add support for attaching profiles via xattr, presence and value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: John Johansen <john.johansen@canonical.com>

and pulled into apparmor-next

> ---
>  security/apparmor/domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index 57cc892e05a2..590b7e8cd21c 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -314,7 +314,7 @@ static int aa_xattrs_match(const struct linux_binprm *bprm,
>  			   struct aa_profile *profile, unsigned int state)
>  {
>  	int i;
> -	size_t size;
> +	ssize_t size;
>  	struct dentry *d;
>  	char *value = NULL;
>  	int value_size = 0, ret = profile->xattr_count;
> 

