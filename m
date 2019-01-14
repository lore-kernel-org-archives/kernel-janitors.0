From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Mon, 14 Jan 2019 10:12:07 +0000
Subject: Re: powerpc/powernv/npu: Allocate enough memory in pnv_try_setup_npu_table_group()
Message-Id: <43dTm76tdhz9sDB@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190109102328.GB5476@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Alistair Popple <alistair@popple.id.au>, Mark Hairgrove <mhairgrove@nvidia.com>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2019-01-09 at 10:23:29 UTC, Dan Carpenter wrote:
> There is a typo so we accidentally allocate enough memory for a pointer
> when we wanted to allocate enough for a struct.
> 
> Fixes: 0bd971676e68 ("powerpc/powernv/npu: Add compound IOMMU groups")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Acked-by: Balbir Singh <bsingharora@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/d7b6cc199b2dea602b4a2a681cf6d322

cheers
