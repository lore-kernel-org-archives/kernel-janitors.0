From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 09 Dec 2018 17:13:12 +0000
Subject: Re: [PATCH] x86/platform/olpc: remove duplicated check on node == -1
Message-Id: <5ec13475-37d8-01b7-e575-cd9e9f496cc3@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181209150142.9010-1-colin.king@canonical.com>
In-Reply-To: <20181209150142.9010-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 09/12/2018 à 16:01, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the node = -1 check is being performed twice, the
> second check is redundant and can be removed.  Fix this by
> removing the redundant second check and moving the first check
> into a combined check with the result from the olpc_ofw call.
>
> Detected by cppcheck:
> Identical condition '(s32)node=-1', second condition is always false
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   arch/x86/platform/olpc/olpc_dt.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
> index b4ab779f1d47..658363ec3ff3 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -28,10 +28,7 @@ static phandle __init olpc_dt_getsibling(phandle node)
>   	const void *args[] = { (void *)node };
>   	void *res[] = { &node };
>   
> -	if ((s32)node = -1)
> -		return 0;
> -
> -	if (olpc_ofw("peer", args, res) || (s32)node = -1)
> +	if (((s32)node = -1) || olpc_ofw("peer", args, res))
>   		return 0;
>   
>   	return node;

'res' is { &node }

Could 'node' be modified by 'olpc_ofw(..., res)' and set to -1?

In other words, I'm not sure that the 2nd check is a redundant here.

Just my 2c,

CJ
