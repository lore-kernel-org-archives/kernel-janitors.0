From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Mon, 06 May 2019 13:54:05 +0000
Subject: Re: [PATCH -next] ocxl: Fix return value check in afu_ioctl()
Message-Id: <44yPNY0bjTz9s7T@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190504070430.57008-1-weiyongjun1@huawei.com>
References: <20190504070430.57008-1-weiyongjun1@huawei.com>
In-Reply-To: <20190504070430.57008-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sat, 2019-05-04 at 07:04:30 UTC, Wei Yongjun wrote:
> In case of error, the function eventfd_ctx_fdget() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Alastair D'Silva <alastair@d-silva.org>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6be6a8de1b55e719e3f9589491074371

cheers
