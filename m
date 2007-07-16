From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 16 Jul 2007 11:14:17 +0000
Subject: Re: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <20070716111417.GI13826@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11845693593123-git-send-email-crquan@gmail.com>
In-Reply-To: <11845693593123-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2007 at 03:02:39PM +0800, Denis Cheng wrote:
> @@ -4453,7 +4453,7 @@ advansys_detect(struct scsi_host_template *tpnt)
>  
>                      /* Find all PCI cards. */
>                      while (pci_device_id_cnt < ASC_PCI_DEVICE_ID_CNT) {
> -                        if ((pci_devp = pci_find_device(PCI_VENDOR_ID_ASP,
> +                        if ((pci_devp = pci_get_device(PCI_VENDOR_ID_ASP,
>                              pci_device_id[pci_device_id_cnt], pci_devp)) =
>                              NULL) {
>                              pci_device_id_cnt++;
> -- 

Where do you drop the reference to the PCI device again?

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
