From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 14 Jul 2015 22:50:51 +0000
Subject: Re: [PATCH v3 ] Staging: Android: Fixes for TODO file
Message-Id: <20150714225051.GA29440@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593E73F.5050607@zoho.com>
 <5593EEC6.4070801@zoho.com>
 <55940BF7.8020104@zoho.com>
In-Reply-To: <55940BF7.8020104@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: arve@android.com, riandrews@android.com, sumit.semwal@linaro.org, carlos@cgarcia.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jul 01, 2015 at 09:19:11PM +0530, Sohny Thomas wrote:
> Removed non-existent issue from TODO file
> No instance of kuid_t or uid_t as mentioned by the file is present in staging/android directory
> 
> Signed-off-by: Sohny Thomas <sohnythomas@zoho.com>
> ---
>  drivers/staging/android/TODO | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/staging/android/TODO b/drivers/staging/android/TODO
> index 06954cd..b15fb0d 100644
> --- a/drivers/staging/android/TODO
> +++ b/drivers/staging/android/TODO
> @@ -5,13 +5,6 @@ TODO:
>         - make sure things build as modules properly
>         - add proper arch dependencies as needed
>         - audit userspace interfaces to make sure they are sane
> -       - kuid_t should never be exposed to user space as it is
> -          kernel internal type. Data structure for this kuid_t is:
> -          typedef struct {
> -               uid_t val;
> -          } kuid_t;
> -       - This bug is introduced by Xiong Zhou in the patch bd471258f2e09
> -       - ("staging: android: logger: use kuid_t instead of uid_t")
> 
>  Please send patches to Greg Kroah-Hartman <greg@kroah.com> and Cc:
>  Brian Swetland <swetland@google.com>

Doesn't apply to the tree :(

