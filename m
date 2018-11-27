From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 27 Nov 2018 09:22:32 +0000
Subject: Re: [-next] powerpc/platforms/85xx: drop pointless static qualifier
Message-Id: <433yx45hKJz9s55@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1542285196-156161-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Scott Wood <oss@buserror.net>, Kumar Gala <galak@kernel.crashing.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Thu, 2018-11-15 at 12:33:16 UTC, YueHaibing wrote:
> From: Yue Haibing <yuehaibing@huawei.com>
> 
> There is no need to have the 'void __iomem *cpld_base' variable static
> since new value always be assigned before use it.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/af8511cf32189ba66c7e2a4146f11c

cheers
