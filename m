From: Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 19 Oct 2017 03:48:14 +0000
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Delete an error message for a failed memory allocation in kvmppc_al
Message-Id: <20171019034814.GD3492@fergus.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <124a92d4-7d49-0769-ae0e-c4ab007ae146@users.sourceforge.net>
In-Reply-To: <124a92d4-7d49-0769-ae0e-c4ab007ae146@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Oct 05, 2017 at 01:23:30PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 5 Oct 2017 13:16:51 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, applied to my kvm-ppc-next branch.

Paul.
