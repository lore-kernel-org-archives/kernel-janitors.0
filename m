From: Marcelo Tosatti <mtosatti@redhat.com>
Date: Wed, 19 Oct 2011 17:26:24 +0000
Subject: Re: [patch] KVM: make checks stricter in coalesced_mmio_in_range()
Message-Id: <20111019172624.GB8575@amt.cnet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111019061510.GA12399@elgon.mountain>
In-Reply-To: <20111019061510.GA12399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Avi Kivity <avi@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 19, 2011 at 09:15:10AM +0300, Dan Carpenter wrote:
> My testing version of Smatch complains that addr and len come from
> the user and they can wrap.  The path is:
>   -> kvm_vm_ioctl()
>      -> kvm_vm_ioctl_unregister_coalesced_mmio()
>         -> coalesced_mmio_in_range()
> 
> I don't know what the implications are of wrapping here, but we may
> as well fix it, if only to silence the warning.

There are no negative implications, if variables wrap unregistration 
fails. Applied, thanks.

