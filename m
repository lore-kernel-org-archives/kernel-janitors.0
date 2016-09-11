From: Paul Mackerras <paulus@ozlabs.org>
Date: Sun, 11 Sep 2016 23:25:47 +0000
Subject: Re: [PATCH 6/6] KVM: PPC: e500: Rename jump labels in kvmppc_e500_tlb_init()
Message-Id: <20160911232547.GA9873@fergus.ozlabs.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <c3fd4483-38d2-af0f-0e19-a7e57e120c5b@users.sourceforge.net>
 <165cb42e-f9fe-83ad-7c4c-299a805dbe6e@users.sourceforge.net>
In-Reply-To: <165cb42e-f9fe-83ad-7c4c-299a805dbe6e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Aug 28, 2016 at 07:19:22PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 28 Aug 2016 18:45:26 +0200
> 
> Adjust jump labels according to the current Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

With this I get a compile error:

  CC      arch/powerpc/kvm/e500_mmu.o
/home/paulus/kernel/kvm/arch/powerpc/kvm/e500_mmu.c: In function ‘kvmppc_e500_tlb_init’:
/home/paulus/kernel/kvm/arch/powerpc/kvm/e500_mmu.c:910:3: error: label ‘err’ used but not defined
   goto err;
   ^
/home/paulus/kernel/kvm/scripts/Makefile.build:289: recipe for target 'arch/powerpc/kvm/e500_mmu.o' failed
make[2]: *** [arch/powerpc/kvm/e500_mmu.o] Error 1

Paul.
