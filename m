From: Marcelo Tosatti <mtosatti@redhat.com>
Date: Tue, 13 Oct 2009 17:10:40 +0000
Subject: Re: [PATCH 1/1] kvm/mmu: Resolve compile warning
Message-Id: <20091013171040.GC11155@amt.cnet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1255242503.4326.39.camel@laptop>
In-Reply-To: <1255242503.4326.39.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: javier martinez canillas <martinez.javier@gmail.com>
Cc: avi@redhat.com, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

javier,

This is fixed in the -next branch of kvm.git. Thanks.

On Sun, Oct 11, 2009 at 02:28:23AM -0400, javier martinez canillas wrote:
> I got this compile warning with today linux-next:
> 
> arch/x86/kvm/mmu.c: In function ‘kvm_set_pte_rmapp’:
> arch/x86/kvm/mmu.c:770: warning: cast to pointer from integer of different size
> arch/x86/kvm/mmu.c: In function ‘kvm_set_spte_hva’:
> arch/x86/kvm/mmu.c:849: warning: cast from pointer to integer of different size
> 
> This patch solves the issue:
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>

