From: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Date: Thu, 01 Dec 2016 15:14:33 +0000
Subject: Re: [patch] KVM: use after free in kvm_ioctl_create_device()
Message-Id: <20161201151432.GH1682@potion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130192105.GC28180@mwanda>
In-Reply-To: <20161130192105.GC28180@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Christoffer Dall <christoffer.dall@linaro.org>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

2016-11-30 22:21+0300, Dan Carpenter:
> We should move the ops->destroy(dev) after the list_del(&dev->vm_node)
> so that we don't use "dev" after freeing it.
> 
> Fixes: a28ebea2adc4 ("KVM: Protect device ops->create and list_add with kvm->lock")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to kvm/master, thanks.
