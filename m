From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Feb 2014 13:23:16 +0000
Subject: Re: [patch RFC] kvm, cpuid: silence a buffer overflow warning
Message-Id: <20140220132316.GA26776@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140220123419.GA10110@elgon.mountain>
 <5305FE1E.6060902@redhat.com>
In-Reply-To: <5305FE1E.6060902@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 20, 2014 at 02:07:42PM +0100, Paolo Bonzini wrote:
> Il 20/02/2014 13:34, Dan Carpenter ha scritto:
> > This seems like a harmless off by one overflow if "i" is the last
> > element in the vcpu->arch.cpuid_entries[] array.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Not tested.  I always wonder if it's worth fixing these or if it's worth
> > reporting them?  Either of those seem like a lot of work for something
> > harmless.
> 
> Could it oops if cpuid_nent is INT_MAX?

cpuid_nent is capped at KVM_MAX_CPUID_ENTRIES (80).

regards,
dan carpenter

