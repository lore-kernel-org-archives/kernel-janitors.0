From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 21 Nov 2019 09:13:23 +0000
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <61f534ca-7575-6716-10ec-ac5c92258452@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam>
In-Reply-To: <20191119121423.GB5604@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Mao Wenan <maowenan@huawei.com>, rkrcmar@redhat.com, sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 19/11/19 13:14, Dan Carpenter wrote:
>> Better expressed as 
>>
>> Fixes: 7ee30bc132c6 ("KVM: x86: deliver KVM IOAPIC scan request to target vCPUs")
>
> There is sort of a debate about this whether the Fixes tag should be
> used if it's only a cleanup.

The other debate is whether this is a cleanup, since the build is broken
with -Werror.  I agree that code cleanups generally don't deserve Fixes
tags, but this patch IMHO does.

Paolo
