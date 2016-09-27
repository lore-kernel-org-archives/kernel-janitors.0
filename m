From: Paul Mackerras <paulus@ozlabs.org>
Date: Tue, 27 Sep 2016 05:46:52 +0000
Subject: Re: [patch] KVM: PPC: fix a sanity check
Message-Id: <20160927054652.gikspz75ilmluecz@oak.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714101545.GB18175@mwanda>
In-Reply-To: <20160714101545.GB18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Graf <agraf@suse.com>, Bharat Bhushan <r65777@freescale.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, Jul 14, 2016 at 01:15:46PM +0300, Dan Carpenter wrote:
> We use logical negate where bitwise negate was intended.  It means that
> we never return -EINVAL here.
> 
> Fixes: ce11e48b7fdd ('KVM: PPC: E500: Add userspace debug stub support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to kvm-ppc-next.

Paul.
