From: Bert Wesarg <bert.wesarg@googlemail.com>
Date: Wed, 08 Apr 2009 11:31:43 +0000
Subject: Re: [PATCH 05/56] block: Remove void casts
Message-Id: <36ca99e90904080431o3fae1c2es555327578ab06d7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
	 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kernel@vger.kernel.org, jeff@garzik.org, kernel-janitors@vger.kernel.org

On Wed, Apr 8, 2009 at 13:21, Jack Stone <jwjstone@fastmail.fm> wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  drivers/block/amiflop.c    |    2 +-
>  drivers/block/cciss.c      |   11 ++++-------
>  drivers/block/cciss_scsi.c |    3 +--
>  drivers/block/cpqarray.c   |    2 +-
>  drivers/block/sx8.c        |    2 +-
>  drivers/block/viodasd.c    |    3 +--
>  6 files changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
> index 8df436f..702667b 100644
> --- a/drivers/block/amiflop.c
> +++ b/drivers/block/amiflop.c
> @@ -1727,7 +1727,7 @@ static int __init amiga_floppy_init(void)
>        }
>
>        ret = -ENOMEM;
> -       if ((raw_buf = (char *)amiga_chip_alloc (RAW_BUF_SIZE, "Floppy")) =
> +       if ((raw_buf = amiga_chip_alloc (RAW_BUF_SIZE, "Floppy")) =
                                         ^
Could you feed the patches through checkpatch.pl to find and fix these
style issues.

>            NULL) {
This line could be fit now at the previous line.


>                printk("fd: cannot get chip mem buffer\n");
>                goto out_memregion;
> diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
> index 0ef6f08..0c4747a 100644
> --- a/drivers/block/cciss.c
> +++ b/drivers/block/cciss.c
> @@ -452,7 +452,7 @@ static CommandList_struct *cmd_alloc(ctlr_info_t *h, int get_from_pool)
>        dma_addr_t cmd_dma_handle, err_dma_handle;
>
>        if (!get_from_pool) {
> -               c = (CommandList_struct *) pci_alloc_consistent(h->pdev,
> +               c = pci_alloc_consistent(h->pdev,
>                        sizeof(CommandList_struct), &cmd_dma_handle);
If typeof(c) = CommandList_struct*, that you could replace
sizeof(CommandList_struct) with sizeof(*c) to make the expression
shorter and fit into one line.

Bert
