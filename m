From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 31 Jul 2017 07:54:46 +0000
Subject: Re: [PATCH 1/2] KVM: PPC: e500: fix some NULL dereferences on error
Message-Id: <20170731075446.5rdxjcir4jmsed7q@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713073829.dqjahnakxqvpne7x@mwanda>
 <20170731060340.yw45r7dewrdvocx3@oak.ozlabs.ibm.com>
In-Reply-To: <20170731060340.yw45r7dewrdvocx3@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Alexander Graf <agraf@suse.com>, Scott Wood <scottwood@freescale.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Mon, Jul 31, 2017 at 04:03:40PM +1000, Paul Mackerras wrote:
> On Thu, Jul 13, 2017 at 10:38:29AM +0300, Dan Carpenter wrote:
> > There are some error paths in kvmppc_core_vcpu_create_e500() where we
> > forget to set the error code.  It means that we return ERR_PTR(0) which
> > is NULL and it results in a NULL pointer dereference in the caller.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Are these user-triggerable, and therefore needing to go into 4.13
> and be back-ported to the stable trees?  Or can they wait for 4.14?
> 

These are static checker fixes...  I imagine that they might be user
triggerable with quite a bit of work but it's a only NULL derefence.

regards,
dan carpenter

