From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 28 Feb 2020 13:04:44 +0000
Subject: Re: [PATCH] lib/test_kmod: remove a NULL test
Message-Id: <20200228130444.GY11244@42.do-not-panic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228092452.vwkhthsn77nrxdy6@kili.mountain>
In-Reply-To: <20200228092452.vwkhthsn77nrxdy6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Feb 28, 2020 at 12:24:52PM +0300, Dan Carpenter wrote:
> The "info" pointer has already been dereferenced so checking here is
> too late.  Fortunately, we never pass NULL pointers to the
> test_kmod_put_module() function so the test can simply be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

Andrew, mind this going up through you? I'll bounce you the original
next.

  Luis

> ---
>  lib/test_kmod.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_kmod.c b/lib/test_kmod.c
> index 9cf77628fc91..e651c37d56db 100644
> --- a/lib/test_kmod.c
> +++ b/lib/test_kmod.c
> @@ -204,7 +204,7 @@ static void test_kmod_put_module(struct kmod_test_device_info *info)
>  	case TEST_KMOD_DRIVER:
>  		break;
>  	case TEST_KMOD_FS_TYPE:
> -		if (info && info->fs_sync && info->fs_sync->owner)
> +		if (info->fs_sync && info->fs_sync->owner)
>  			module_put(info->fs_sync->owner);
>  		break;
>  	default:
> -- 
> 2.11.0
> 
