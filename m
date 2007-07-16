From: "rae l" <crquan@gmail.com>
Date: Mon, 16 Jul 2007 07:06:10 +0000
Subject: Re: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <91b13c310707160006q2f904b88j9f147a8d07e50d0b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11845693593123-git-send-email-crquan@gmail.com>
In-Reply-To: <11845693593123-git-send-email-crquan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/16/07, Denis Cheng <crquan@gmail.com> wrote:
> this eliminates compiler warning:
>
> drivers/scsi/advansys.c: In function 'advansys_detect':
> drivers/scsi/advansys.c:4456: warning: 'pci_find_device' is deprecated (declared at include/linux/pci.h:478)
But there is still one warning left:
drivers/scsi/advansys.c:794:2: warning: #warning this driver is still
not properly converted to the DMA API

>
> Signed-off-by: Denis Cheng <crquan@gmail.com>
> ---
>  drivers/scsi/advansys.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
> index 2b66897..8e5abd1 100644
> --- a/drivers/scsi/advansys.c
> +++ b/drivers/scsi/advansys.c
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
> 1.5.2.2
>
>


-- 
Denis Cheng
Linux Application Developer

"One of my most productive days was throwing away 1000 lines of code."
 - Ken Thompson.
