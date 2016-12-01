From: David Hildenbrand <david@redhat.com>
Date: Thu, 01 Dec 2016 12:20:08 +0000
Subject: Re: [patch] KVM: use after free in kvm_ioctl_create_device()
Message-Id: <77cc0648-ec4d-99d6-b95d-53576ea31617@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130192105.GC28180@mwanda>
In-Reply-To: <20161130192105.GC28180@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, Christoffer Dall <christoffer.dall@linaro.org>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

Am 30.11.2016 um 20:21 schrieb Dan Carpenter:
> We should move the ops->destroy(dev) after the list_del(&dev->vm_node)
> so that we don't use "dev" after freeing it.
>
> Fixes: a28ebea2adc4 ("KVM: Protect device ops->create and list_add with kvm->lock")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 69a1247..de102ca 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2899,10 +2899,10 @@ static int kvm_ioctl_create_device(struct kvm *kvm,

Looks sane to me! This also matches kvm_destroy_devices().

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 

David
