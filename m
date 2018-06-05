From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 05 Jun 2018 15:19:34 +0000
Subject: Re: [-next] ocxl: Fix missing unlock on error in afu_ioctl_enable_p9_wait()
Message-Id: <410b7r1h68z9s2k@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1528190181-15745-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-06-05 at 09:16:21 UTC, Wei Yongjun wrote:
> Add the missing unlock before return from function
> afu_ioctl_enable_p9_wait() in the error handling case.
> 
> Fixes: e948e06fc63a ("ocxl: Expose the thread_id needed for wait on POWER9")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Alastair D'Silva <alastair@d-silva.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2e5c93d6bb2f7bc17eb82748943a1b

cheers
