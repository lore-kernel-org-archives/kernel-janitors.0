From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Sat, 31 Mar 2018 14:04:08 +0000
Subject: Re: [-next] powerpc: Fix error return code in ppc4xx_msi_probe()
Message-Id: <40D0bD5FH1z9s3q@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1522075389-23511-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2018-03-26 at 14:43:09 UTC, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9a2c1d31e6910b9d5e0205f9167d0b

cheers
