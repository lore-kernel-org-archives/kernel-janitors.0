From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Jan 2014 14:29:06 +0000
Subject: Re: [patch] KVM: return an error code in kvm_vm_ioctl_register_coalesced_mmio()
Message-Id: <20140129142906.GK4815@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140129131639.GB10678@elgon.mountain>
 <52E908C1.8020306@bfs.de>
In-Reply-To: <52E908C1.8020306@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Gleb Natapov <gleb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 29, 2014 at 02:57:21PM +0100, walter harms wrote:
> 
> 
> Am 29.01.2014 14:16, schrieb Dan Carpenter:
> > If kvm_io_bus_register_dev() fails then it returns success but it should
> > return an error code.
> > 
> > I also did a little cleanup like removing an impossible NULL test.
> > 
> > Fixes: 2b3c246a682c ('KVM: Make coalesced mmio use a device per zone')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
> > index 88b2fe3ddf42..00d86427af0f 100644
> > --- a/virt/kvm/coalesced_mmio.c
> > +++ b/virt/kvm/coalesced_mmio.c
> > @@ -154,17 +154,13 @@ int kvm_vm_ioctl_register_coalesced_mmio(struct kvm *kvm,
> >  	list_add_tail(&dev->list, &kvm->coalesced_zones);
> >  	mutex_unlock(&kvm->slots_lock);
> >  
> > -	return ret;
> > +	return 0;
> >  
> >  out_free_dev:
> >  	mutex_unlock(&kvm->slots_lock);
> > -
> >  	kfree(dev);
> >  
> > -	if (dev = NULL)
> > -		return -ENXIO;
> > -
> > -	return 0;
> > +	return ret;
> >  }
> >  
> >  int kvm_vm_ioctl_unregister_coalesced_mmio(struct kvm *kvm,
> 
> 
> I did not see the rest of the code, be careful ..
> 
> You can get rid of the return 0 by protecting the free(dev) like
> 
> if (ret != 0)
>    kfree(dev);
> 
> that will make the
> mutex_unlock(&kvm->slots_lock);
> return 0;
> 
> obsolet. (simply set ret=0 if needed).

It's better to have a clean separation of success and error path.  The
success path should "return 0;" and not "return ret;"

[ I spent thirty minutes here ranting about the right way to do error
  paths but then I deleted it.  :P  ].

regards,
dan carpenter
