From: Jeremiah Mahler <jmmahler@gmail.com>
Date: Sun, 07 Dec 2014 20:41:38 +0000
Subject: Re: [PATCH 8/20] USB: isp1760: fix misspelling of current function in string
Message-Id: <20141207204138.GA5360@hudson.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417980062-25151-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Julia,

On Sun, Dec 07, 2014 at 08:20:50PM +0100, Julia Lawall wrote:
> Replace a misspelled function name by %s and then __func__.
> 
> The function name starts with isp, not ips.
> 
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> The semantic patch is difficult to summarize, but is available in the cover
> letter of this patch series.
> 
>  drivers/usb/host/isp1760-if.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
> index 09254a4..939d376 100644
> --- a/drivers/usb/host/isp1760-if.c
> +++ b/drivers/usb/host/isp1760-if.c
> @@ -318,7 +318,7 @@ static void isp1761_pci_remove(struct pci_dev *dev)
>  
>  static void isp1761_pci_shutdown(struct pci_dev *dev)
>  {
> -	printk(KERN_ERR "ips1761_pci_shutdown\n");
> +	printk(KERN_ERR "%s\n", __func__);
>  }
>  
You can also switch from printk to pr_err and that would fix thte
checkpatch warning for this patch.

>  static const struct pci_device_id isp1760_plx [] = {
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
- Jeremiah Mahler
