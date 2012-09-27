From: Avi Kivity <avi@redhat.com>
Date: Thu, 27 Sep 2012 16:20:01 +0000
Subject: Re: [PATCH] s390/kvm: Fix vcpu_load handling in interrupt code
Message-Id: <50647CB1.9080507@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <50646CE7.8020006@redhat.com> <1348759785-15394-1-git-send-email-borntraeger@de.ibm.com>
In-Reply-To: <1348759785-15394-1-git-send-email-borntraeger@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Fengguang Wu <fengguang.wu@intel.com>, Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

On 09/27/2012 05:29 PM, Christian Borntraeger wrote:
> Recent changes (KVM: make processes waiting on vcpu mutex killable)
> now requires to check the return value of vcpu_load. This triggered
> a warning in s390 specific kvm code. Turns out that we can actually
> remove the put/load, since schedule will do the right thing via
> the preempt notifiers.

Thanks, applied.


-- 
error compiling committee.c: too many arguments to function
