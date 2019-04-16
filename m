From: John Johansen <john.johansen@canonical.com>
Date: Tue, 16 Apr 2019 19:56:00 +0000
Subject: Re: [PATCH] apparmor: fix spelling mistake "immutible" -> "immutable"
Message-Id: <bc8f189c-3f37-b6ec-3422-f14a9cf0b85b@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416144218.1842-1-colin.king@canonical.com>
In-Reply-To: <20190416144218.1842-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/16/19 7:42 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an information message string, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I'll pull it into the apparmor tree


> ---
>  security/apparmor/policy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> index 71a3e6291478..04f2480e8374 100644
> --- a/security/apparmor/policy.c
> +++ b/security/apparmor/policy.c
> @@ -587,7 +587,7 @@ static int replacement_allowed(struct aa_profile *profile, int noreplace,
>  {
>  	if (profile) {
>  		if (profile->label.flags & FLAG_IMMUTIBLE) {
> -			*info = "cannot replace immutible profile";
> +			*info = "cannot replace immutable profile";
>  			return -EPERM;
>  		} else if (noreplace) {
>  			*info = "profile already exists";
> 
