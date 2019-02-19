From: Daniel Axtens <dja@axtens.net>
Date: Tue, 19 Feb 2019 03:47:02 +0000
Subject: Re: [PATCH -next] powerpc/pseries: Drop pointless static qualifier in vpa_debugfs_init()
Message-Id: <87ftska18p.fsf@linkitivity.dja.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218125644.87448-1-yuehaibing@huawei.com>
In-Reply-To: <20190218125644.87448-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, Aravinda Prasad <aravinda@linux.vnet.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Laurent Dufour <ldufour@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi YueHaibing, <yuehaibing@huawei.com> writes:

> There is no need to have the 'struct dentry *vpa_dir' variable static
> since new value always be assigned before use it.
>

Much to my surprise this seems to be a correct change. I don't know why
the struct was ever static but it seems to have been this way since the
commit went in in October 2018. And yes, it is set every time when the
function is called (which is exactly once, it's an initcall). I wonder
if once upon a time in an earlier spin of the patch there was a method
to tear the debugfs down, so it was global, and in the revisions that
went away but the static qualifier remained.

Anyway, I think your commit message should have:

Fixes: c6c26fb55e8e ("powerpc/pseries: Export raw per-CPU VPA data via debugfs")

as this is the commit that introduced the issue.

With that change:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/powerpc/platforms/pseries/lpar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index f2a9f0adc2d3..f649c1b652eb 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -1263,7 +1263,7 @@ static int __init vpa_debugfs_init(void)
>  {
>  	char name[16];
>  	long i;
> -	static struct dentry *vpa_dir;
> +	struct dentry *vpa_dir;
>  
>  	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
>  		return 0;
