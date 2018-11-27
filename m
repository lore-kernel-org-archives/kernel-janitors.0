From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 27 Nov 2018 09:22:29 +0000
Subject: Re: [-next] powerpc64/ftrace: Drop pointless static qualifier in is_b_op()
Message-Id: <433yx13B0jz9sB7@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1542117416-52357-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kate Stewart <kstewart@linuxfoundation.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Tue, 2018-11-13 at 13:56:56 UTC, YueHaibing wrote:
> There is no need to have the 'intoffset' variable static since new value
> always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d64cf54e89c86487c1369991af79d8

cheers
