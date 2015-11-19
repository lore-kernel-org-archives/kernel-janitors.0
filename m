From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Thu, 19 Nov 2015 14:47:22 +0000
Subject: Re: [patch 1/2] KVM: fix error handling in kvm_create_vm_debugfs()
Message-Id: <564DE0FA.6090104@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151119124040.GA2638@mwanda>
In-Reply-To: <20151119124040.GA2638@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Gleb Natapov <gleb@kernel.org>, Janosch Frank <frankja@linux.vnet.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/19/2015 01:40 PM, Dan Carpenter wrote:
> The "goto out_err" is buggy because we forgot to set the return code.
> 
> The other issue is that if the kmalloc() fails, we should remove the
> debugfs directory before returning.
> 
> Fixes: 7805f53a85ec ('KVM: Create debugfs dir and stat files for each VM')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan

this patch is not yet part of the kvm repo. It was posted for review
and I added it on the kvms390 linux next branch. So I assume you have gotten
that patch via next?


Given that there might be more potential feedback and
given that I will respin my next branch (I have no consumers, so my next
branch is rebased from time to time), and then the patch will go
from my tree via Paolos kvm tree into Linus tree, I would prefer to fold in
your patches and adopt the commit message to give you some credit.
ok with you?

Christian
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 1ee2f73..f62621f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -571,12 +571,14 @@ static int kvm_create_vm_debugfs(struct kvm *kvm)
>  	snprintf(dir_name, sizeof(dir_name), "%d", current->pid);
>  	kvm->debugfs_dentry = debugfs_create_dir(dir_name, kvm_debugfs_dir);
>  	if (!kvm->debugfs_dentry)
> -		goto out_err;
> +		return -ENOMEM;
> 
>  	kvm->debugfs_data = kmalloc(sizeof(*kvm->debugfs_data) *
>  				    kvm_debugfs_num_entries, GFP_KERNEL);
> -	if (!kvm->debugfs_data)
> -		return -ENOMEM;
> +	if (!kvm->debugfs_data) {
> +		r = -ENOMEM;
> +		goto err_remove_dir;
> +	}
> 
>  	for (p = debugfs_entries; p->name; p++, i++) {
>  		stat_data = kzalloc(sizeof(*stat_data), GFP_KERNEL);
> @@ -600,13 +602,15 @@ static int kvm_create_vm_debugfs(struct kvm *kvm)
>  	return r;
> 
>  out_err_clean:
> -	debugfs_remove_recursive(kvm->debugfs_dentry);
>  	kfree(stat_data);
>  	for (i--; i >= 0; i--)
>  		kfree(kvm->debugfs_data[i]);
> 
>  	kfree(kvm->debugfs_data);
> -out_err:
> +
> +err_remove_dir:
> +	debugfs_remove_recursive(kvm->debugfs_dentry);
> +
>  	return r;
>  }
> 

