From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Thu, 14 Nov 2019 09:08:34 +0000
Subject: Re: [PATCH -next] powerpc/pseries: Drop pointless static qualifier in vpa_debugfs_init()
Message-Id: <47DFyW0zdDz9sSK@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190218125644.87448-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Aravinda Prasad <aravinda@linux.vnet.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Laurent Dufour <ldufour@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Mon, 2019-02-18 at 12:56:44 UTC, YueHaibing wrote:
> There is no need to have the 'struct dentry *vpa_dir' variable static
> since new value always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/11dd34f3eae5a468013bb161a1dcf1fecd2ca321

cheers
