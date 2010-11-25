From: Dan Carpenter <error27@gmail.com>
Date: Thu, 25 Nov 2010 04:00:32 +0000
Subject: Re: [PATCH] virt: kvm: coding style cleanups
Message-Id: <20101125040032.GR1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290644937.6078.9.camel@javier-laptop>
In-Reply-To: <1290644937.6078.9.camel@javier-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Cc: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 25, 2010 at 01:28:57AM +0100, Javier Martinez Canillas wrote:
>  		adev->guest_msix_entries > -			kzalloc(sizeof(struct msix_entry) * entry_nr->entry_nr,
> +			kzalloc(sizeof(struct msix_entry) *entry_nr->entry_nr,

The original code was right and the new code is wrong.

>  				GFP_KERNEL);
>  		if (!adev->guest_msix_entries) {
>  			kfree(adev->host_msix_entries);
> @@ -750,7 +750,7 @@ long kvm_vm_ioctl_assigned_device(struct kvm *kvm, unsigned ioctl,
>  			goto out_free_irq_routing;
>  		r = kvm_set_irq_routing(kvm, entries, routing.nr,
>  					routing.flags);
> -	out_free_irq_routing:
> +out_free_irq_routing:

This is a pointless change.

>  		vfree(entries);
>  		break;

You're wasting people's time here and we like newbies but it makes
everyone annoyed.

regards,
dan carpenter
