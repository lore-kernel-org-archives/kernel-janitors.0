From: Avi Kivity <avi@qumranet.com>
Date: Sat, 26 Jul 2008 09:10:01 +0000
Subject: Re: [PATCH retry] arch/ia64/kvm/kvm-ia64.c: Add local_irq_restore
Message-Id: <488AE9E9.1020502@qumranet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807222137350.2670@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kvm@vger.kernel.org, xiantao.zhang@intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> There is a call to local_irq_restore in the normal exit case, so it would
> seem that there should be one on an error return as well.
>
> The semantic patch that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>   

Applied, thanks.

-- 
Do not meddle in the internals of kernels, for they are subtle and quick to panic.

