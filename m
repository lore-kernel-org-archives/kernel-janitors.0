From: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Date: Thu, 13 Sep 2012 12:43:00 +0000
Subject: Re: [patch] gcov: cleanup an allocation in new_node()
Message-Id: <5051D4D4.7060906@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911111333.GD22259@elgon.mountain>
In-Reply-To: <20120911111333.GD22259@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11.09.2012 13:13, Dan Carpenter wrote:
> 1) kcalloc(1, ...) can be replaced with kzalloc().
> 2) There was a small leak if the debugfs_create_dir() fails.
> 3) I removed a pr_warning("out of memory\n") because kmalloc() already
>     prints a more useful failure message in the unlikely case of an
>     allocation failure.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/kernel/gcov/fs.c b/kernel/gcov/fs.c
> index 9bd0934..132168f 100644
> --- a/kernel/gcov/fs.c
> +++ b/kernel/gcov/fs.c
> @@ -437,7 +437,7 @@ static struct gcov_node *new_node(struct gcov_node *parent,
>   	if (!node)
>   		goto err_nomem;
>   	if (info) {
> -		node->loaded_info = kcalloc(1, sizeof(struct gcov_info *),
> +		node->loaded_info = kzalloc(sizeof(struct gcov_info *),
>   					   GFP_KERNEL);

I'd like to keep using kcalloc here since node->loaded_info is an array.

>   		if (!node->loaded_info)
>   			goto err_nomem;
> @@ -451,8 +451,7 @@ static struct gcov_node *new_node(struct gcov_node *parent,
>   		node->dentry = debugfs_create_dir(node->name, parent->dentry);
>   	if (!node->dentry) {
>   		pr_warning("could not create file\n");
> -		kfree(node);
> -		return NULL;
> +		goto err_info;

I agree that this is a potential memory leak - good find!

>   	}
>   	if (info)
>   		add_links(node, parent->dentry);
> @@ -461,9 +460,11 @@ static struct gcov_node *new_node(struct gcov_node *parent,
>
>   	return node;
>
> +err_info:
> +	if (info)
> +		kfree(node->loaded_info);

The 'if' here is not necessary: node->loaded_info is either zero (kfree 
tolerates NULL) or requires freeing. With the removal of the pr_warning 
below, the additional kfree can also be added to err_nomem (no need for 
another label) though then it should probably also be renamed.

>   err_nomem:
>   	kfree(node);
> -	pr_warning("out of memory\n");
>   	return NULL;
>   }
>
>

Regards,
   Peter Oberparleiter

-- 
Peter Oberparleiter
Linux on System z Development - IBM Germany

