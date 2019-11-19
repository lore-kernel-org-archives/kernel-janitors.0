From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Tue, 19 Nov 2019 12:28:32 +0000
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <87imnggidr.fsf@vitty.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119030640.25097-1-maowenan@huawei.com> <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam>
In-Reply-To: <20191119121423.GB5604@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mao Wenan <maowenan@huawei.com>, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Tue, Nov 19, 2019 at 12:58:54PM +0100, Vitaly Kuznetsov wrote:
>> Mao Wenan <maowenan@huawei.com> writes:
>> 
>> > Fixes gcc '-Wunused-but-set-variable' warning:
>> >
>> > arch/x86/kvm/x86.c: In function kvm_make_scan_ioapic_request_mask:
>> > arch/x86/kvm/x86.c:7911:7: warning: variable called set but not
>> > used [-Wunused-but-set-variable]
>> >
>> > It is not used since commit 7ee30bc132c6 ("KVM: x86: deliver KVM
>> > IOAPIC scan request to target vCPUs")
>> 
>> Better expressed as 
>> 
>> Fixes: 7ee30bc132c6 ("KVM: x86: deliver KVM IOAPIC scan request to target vCPUs")
>> 
>
> There is sort of a debate about this whether the Fixes tag should be
> used if it's only a cleanup.
>

I have to admit I'm involved in doing backporting sometimes and I really
appreciate Fixes: tags. Just so you know on which side of the debate I
am :-)

-- 
Vitaly
