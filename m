From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Fri, 02 Jul 2010 21:30:39 +0000
Subject: Re: [PATCH 09/25] pci-sysfs: remove casts from void*
Message-Id: <20100702143039.7bdac116@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277806529-31010-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1277806529-31010-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@suse.de>, Chris Wright <chrisw@sous-sol.org>, "Michael S. Tsirkin" <mst@redhat.com>, Michal Schmidt <mschmidt@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 29 Jun 2010 14:15:28 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

> Remove unnesessary casts from void*.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/pci/pci-sysfs.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index afd2fbf..7f8bc8c 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -734,7 +734,7 @@ pci_mmap_resource(struct kobject *kobj, struct bin_attribute *attr,
>  {
>  	struct pci_dev *pdev = to_pci_dev(container_of(kobj,
>  						       struct device, kobj));
> -	struct resource *res = (struct resource *)attr->private;
> +	struct resource *res = attr->private;
>  	enum pci_mmap_state mmap_type;
>  	resource_size_t start, end;
>  	int i;

Applied to my linux-next branch, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
