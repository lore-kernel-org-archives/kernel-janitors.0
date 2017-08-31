From: Paul Mackerras <paulus@ozlabs.org>
Date: Thu, 31 Aug 2017 03:40:19 +0000
Subject: Re: [PATCH 1/2] KVM: PPC: e500: fix some NULL dereferences on error
Message-Id: <20170831034019.GA22549@fergus.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713073829.dqjahnakxqvpne7x@mwanda>
In-Reply-To: <20170713073829.dqjahnakxqvpne7x@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Graf <agraf@suse.com>, Scott Wood <scottwood@freescale.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, Jul 13, 2017 at 10:38:29AM +0300, Dan Carpenter wrote:
> There are some error paths in kvmppc_core_vcpu_create_e500() where we
> forget to set the error code.  It means that we return ERR_PTR(0) which
> is NULL and it results in a NULL pointer dereference in the caller.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, both patches applied to my kvm-ppc-next branch.

Paul.
