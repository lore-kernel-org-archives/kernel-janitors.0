From: Christoph Hellwig <hch@infradead.org>
Date: Mon, 02 Sep 2019 07:50:06 +0000
Subject: Re: [PATCH -next] PCI: Use GFP_ATOMIC in resource_alignment_store()
Message-Id: <20190902075006.GB754@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831124932.18759-1-yuehaibing@huawei.com>
In-Reply-To: <20190831124932.18759-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Aug 31, 2019 at 12:49:32PM +0000, YueHaibing wrote:
> When allocating memory, the GFP_KERNEL cannot be used during the
> spin_lock period. It may cause scheduling when holding spin_lock.
> 
> Fixes: f13755318675 ("PCI: Move pci_[get|set]_resource_alignment_param() into their callers")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/pci/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 484e35349565..0b5fc6736f3f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6148,7 +6148,7 @@ static ssize_t resource_alignment_store(struct bus_type *bus,
>  	spin_lock(&resource_alignment_lock);
>  
>  	kfree(resource_alignment_param);
> -	resource_alignment_param = kstrndup(buf, count, GFP_KERNEL);
> +	resource_alignment_param = kstrndup(buf, count, GFP_ATOMIC);
>  
>  	spin_unlock(&resource_alignment_lock);

Why not move the allocation outside the lock? Something like this
seems much more sensible:


diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 484e35349565..fe205829f676 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6145,14 +6145,16 @@ static ssize_t resource_alignment_show(struct bus_type *bus, char *buf)
 static ssize_t resource_alignment_store(struct bus_type *bus,
 					const char *buf, size_t count)
 {
-	spin_lock(&resource_alignment_lock);
+	char *param = kstrndup(buf, count, GFP_KERNEL);
 
-	kfree(resource_alignment_param);
-	resource_alignment_param = kstrndup(buf, count, GFP_KERNEL);
+	if (!param)
+		return -ENOMEM;
 
+	spin_lock(&resource_alignment_lock);
+	kfree(resource_alignment_param);
+	resource_alignment_param = param;
 	spin_unlock(&resource_alignment_lock);
-
-	return resource_alignment_param ? count : -ENOMEM;
+	return count;
 }
 
 static BUS_ATTR_RW(resource_alignment);
