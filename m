From: Logan Gunthorpe <logang@deltatee.com>
Date: Thu, 05 Oct 2017 15:37:09 +0000
Subject: Re: [PATCH] switchtec: make struct event_regs static
Message-Id: <985dc2ab-8ba6-3bb7-502d-4927427e2fa8@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005100145.29309-1-colin.king@canonical.com>
In-Reply-To: <20171005100145.29309-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks!

Acked-by: Logan Gunthorpe <logang@deltatee.com>

On 10/5/2017 4:01 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure event_regs is local to the source and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'event_regs' was not declared. Should it be static
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/pci/switch/switchtec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
> index af81b2dec42e..da45dbea20ce 100644
> --- a/drivers/pci/switch/switchtec.c
> +++ b/drivers/pci/switch/switchtec.c
> @@ -943,7 +943,7 @@ static u32 __iomem *pff_ev_reg(struct switchtec_dev *stdev,
>   #define EV_PAR(i, r)[i] = {offsetof(struct part_cfg_regs, r), part_ev_reg}
>   #define EV_PFF(i, r)[i] = {offsetof(struct pff_csr_regs, r), pff_ev_reg}
>   
> -const struct event_reg {
> +static const struct event_reg {
>   	size_t offset;
>   	u32 __iomem *(*map_reg)(struct switchtec_dev *stdev,
>   				size_t offset, int index);
> 

