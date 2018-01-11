From: Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 11 Jan 2018 09:57:07 +0000
Subject: Re: [PATCH] KVM: PPC: Use seq_puts() in kvmppc_exit_timing_show()
Message-Id: <20180111095707.GI24294@fergus.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6f07cc84-cd86-8e48-5da2-edb86f466243@users.sourceforge.net>
In-Reply-To: <6f07cc84-cd86-8e48-5da2-edb86f466243@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 07, 2018 at 10:18:08AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 7 Jan 2018 10:07:36 +0100
> 
> A headline should be quickly put into a sequence. Thus use the
> function "seq_puts" instead of "seq_printf" for this purpose.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, applied to my kvm-ppc-next branch.

Paul.
