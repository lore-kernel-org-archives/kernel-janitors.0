From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Tue, 13 Oct 2009 18:32:53 +0000
Subject: Re: [PATCH 1/1] kvm/mmu: Resolve compile warning
Message-Id: <390803460910131132k41dc40ecp2dd42f3c93f711e2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1255242503.4326.39.camel@laptop> <20091013171040.GC11155@amt.cnet>
In-Reply-To: <20091013171040.GC11155@amt.cnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: avi@redhat.com, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Thank you. Sorry for the noise.

Best regards

-----------------------------------------
Javier Martínez Canillas
+595 981 88 66 58



On Tue, Oct 13, 2009 at 1:10 PM, Marcelo Tosatti <mtosatti@redhat.com> wrote:
> javier,
>
> This is fixed in the -next branch of kvm.git. Thanks.
>
> On Sun, Oct 11, 2009 at 02:28:23AM -0400, javier martinez canillas wrote:
>> I got this compile warning with today linux-next:
>>
>> arch/x86/kvm/mmu.c: In function ‘kvm_set_pte_rmapp’:
>> arch/x86/kvm/mmu.c:770: warning: cast to pointer from integer of different size
>> arch/x86/kvm/mmu.c: In function ‘kvm_set_spte_hva’:
>> arch/x86/kvm/mmu.c:849: warning: cast from pointer to integer of different size
>>
>> This patch solves the issue:
>>
>> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
>
>
