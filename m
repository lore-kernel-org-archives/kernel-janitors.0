From: James Morris <jmorris@namei.org>
Date: Mon, 27 Jul 2020 18:05:54 +0000
Subject: Re: [PATCH] integrity: remove redundant initialization of variable ret
Message-Id: <alpine.LRH.2.21.2007280405340.18670@namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200701134634.549399-1-colin.king@canonical.com>
In-Reply-To: <20200701134634.549399-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: "Serge E . Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 1 Jul 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/integrity/digsig_asymmetric.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
> index 4e0d6778277e..cfa4127d0518 100644
> --- a/security/integrity/digsig_asymmetric.c
> +++ b/security/integrity/digsig_asymmetric.c
> @@ -79,7 +79,7 @@ int asymmetric_verify(struct key *keyring, const char *sig,
>  	struct public_key_signature pks;
>  	struct signature_v2_hdr *hdr = (struct signature_v2_hdr *)sig;
>  	struct key *key;
> -	int ret = -ENOMEM;
> +	int ret;

Assuming Mimi will grab this.


Acked-by: James Morris <jamorris@linux.microsoft.com>

-- 
James Morris
<jmorris@namei.org>
