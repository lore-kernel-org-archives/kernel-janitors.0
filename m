From: Alexander Graf <agraf@suse.de>
Date: Thu, 14 Jul 2016 11:10:13 +0000
Subject: Re: [patch] KVM: PPC: fix a sanity check
Message-Id: <57877315.5060903@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160714101545.GB18175@mwanda>
In-Reply-To: <20160714101545.GB18175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bharat Bhushan <r65777@freescale.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Paolo Bonzini <pbonzini@redhat.com>, rkrcmar@redhat.com, Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org

On 07/14/2016 12:15 PM, Dan Carpenter wrote:
> We use logical negate where bitwise negate was intended.  It means that
> we never return -EINVAL here.
>
> Fixes: ce11e48b7fdd ('KVM: PPC: E500: Add userspace debug stub support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops :).

Reviewed-by: Alexander Graf <agraf@suse.de>


Alex

