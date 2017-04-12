From: Logan Gunthorpe <logang@deltatee.com>
Date: Wed, 12 Apr 2017 16:47:27 +0000
Subject: Re: [PATCH] switchtec: checking for NULL instead of IS_ERR()
Message-Id: <3de7a06b-d27c-9775-8eb9-1b02bf8e2fec@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170412083525.GF3250@mwanda>
In-Reply-To: <20170412083525.GF3250@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kurt Schwemmer <kurt.schwemmer@microsemi.com>
Cc: Stephen Bates <stephen.bates@microsemi.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the fix. This is the exact same patch Christophe Jaillet sent
a couple of days ago so only one needs to be merged.

Logan

On 12/04/17 02:35 AM, Dan Carpenter wrote:
> stuser_create() uses error pointers, it never returns NULL.
> 
> Fixes: 74004262f329 ("MicroSemi Switchtec management interface driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
> index fcde98161d9a..cc6e085008fb 100644
> --- a/drivers/pci/switch/switchtec.c
> +++ b/drivers/pci/switch/switchtec.c
> @@ -608,7 +608,7 @@ static int switchtec_dev_open(struct inode *inode, struct file *filp)
>  	stdev = container_of(inode->i_cdev, struct switchtec_dev, cdev);
>  
>  	stuser = stuser_create(stdev);
> -	if (!stuser)
> +	if (IS_ERR(stuser))
>  		return PTR_ERR(stuser);
>  
>  	filp->private_data = stuser;
> 
