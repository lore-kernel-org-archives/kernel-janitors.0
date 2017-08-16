From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 16 Aug 2017 12:29:54 +0000
Subject: Re: powerpc/perf: double unlock bug in imc_common_cpuhp_mem_free()
Message-Id: <3xXTFG6ryjz9t42@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170811200541.qlxcpp3og33sdki3@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Anju T Sudhakar <anju@linux.vnet.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, Hemant Kumar <hemant@linux.vnet.ibm.com>

On Fri, 2017-08-11 at 20:05:41 UTC, Dan Carpenter wrote:
> There is a typo so we call unlock instead of lock.
> 
> Fixes: 885dcd709ba9 ("powerpc/perf: Add nest IMC PMU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b3376dcc6c62452fe24e76d8fc35bb

cheers
