From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Fri, 08 Nov 2019 14:06:08 +0000
Subject: Re: [PATCH][V2] ata: pata_artop: make arrays static const, makes object smaller
Message-Id: <50c64370-067a-a15e-29d6-dff3fc25cc77@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20191006143000epcas2p168872c0c7b1e1879e31931d3244dfd4d@epcas2p1.samsung.com>
        <20191006142956.23360-1-colin.king@canonical.com>
In-Reply-To: <20191006142956.23360-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 10/6/19 4:29 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const arrays on the stack but instead make them
> static. Makes the object code smaller by 292 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    6988	   3132	    128	  10248	   2808	drivers/ata/pata_artop.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    6536	   3292	    128	   9956	   26e4	drivers/ata/pata_artop.o
> 
> (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
> 
> V2: fix up commit message
> 
> ---
>  drivers/ata/pata_artop.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ata/pata_artop.c b/drivers/ata/pata_artop.c
> index 3aa006c5ed0c..6bd2228bb6ff 100644
> --- a/drivers/ata/pata_artop.c
> +++ b/drivers/ata/pata_artop.c
> @@ -100,7 +100,7 @@ static void artop6210_load_piomode(struct ata_port *ap, struct ata_device *adev,
>  {
>  	struct pci_dev *pdev	= to_pci_dev(ap->host->dev);
>  	int dn = adev->devno + 2 * ap->port_no;
> -	const u16 timing[2][5] = {
> +	static const u16 timing[2][5] = {
>  		{ 0x0000, 0x000A, 0x0008, 0x0303, 0x0301 },
>  		{ 0x0700, 0x070A, 0x0708, 0x0403, 0x0401 }
>  
> @@ -154,7 +154,7 @@ static void artop6260_load_piomode (struct ata_port *ap, struct ata_device *adev
>  {
>  	struct pci_dev *pdev	= to_pci_dev(ap->host->dev);
>  	int dn = adev->devno + 2 * ap->port_no;
> -	const u8 timing[2][5] = {
> +	static const u8 timing[2][5] = {
>  		{ 0x00, 0x0A, 0x08, 0x33, 0x31 },
>  		{ 0x70, 0x7A, 0x78, 0x43, 0x41 }
>  
