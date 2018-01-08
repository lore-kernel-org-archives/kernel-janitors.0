From: haver <haver@linux.vnet.ibm.com>
Date: Mon, 08 Jan 2018 12:47:16 +0000
Subject: Re: [PATCH 2/3] GenWQE: Fix a typo in two comments
Message-Id: <eb79305b2d1ce1994de5a6f81ded29f7@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1b73b1a-ae0a-b76b-33d7-4dc5af8e39b5@users.sourceforge.net>
 <dc64ae8b-46af-2838-a2f8-c2c1801b9113@users.sourceforge.net>
In-Reply-To: <dc64ae8b-46af-2838-a2f8-c2c1801b9113@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?J=C3=B6rg-Stephan_Vogt?= <jsvogt@de.ibm.com>, Michael Jung <MIJUNG@de.ibm.com>, =?UTF-8?Q?Michael_R=C3=BCttger?= <michael@ibmra.de>, trivial@kernel.org

Hi Markus,

On 2018-01-08 10:42, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 Jan 2018 09:57:10 +0100
> 
> Add a missing character in two words of these descriptions.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/misc/genwqe/card_utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/genwqe/card_utils.c 
> b/drivers/misc/genwqe/card_utils.c
> index 55c389a9e7d7..0b466664c908 100644
> --- a/drivers/misc/genwqe/card_utils.c
> +++ b/drivers/misc/genwqe/card_utils.c
> @@ -453,7 +453,7 @@ int genwqe_setup_sgl(struct genwqe_dev *cd, struct
> genwqe_sgl *sgl,
>  		s += 8;		/* continue 8 elements further */
>  	}
>   fixup:
> -	if (j = 1) {		/* combining happend on last entry! */
> +	if (j = 1) {		/* combining happened on last entry! */
>  		s -= 8;		/* full shift needed on previous sgl block */
>  		j =  7;		/* shift all elements */
>  	}
> @@ -471,7 +471,7 @@ int genwqe_setup_sgl(struct genwqe_dev *cd, struct
> genwqe_sgl *sgl,
>   * genwqe_free_sync_sgl() - Free memory for sgl and overlapping pages
>   *
>   * After the DMA transfer has been completed we free the memory for
> - * the sgl and the cached pages. Data is being transfered from cached
> + * the sgl and the cached pages. Data is being transferred from cached
>   * pages into user-space buffers.
>   */
>  int genwqe_free_sync_sgl(struct genwqe_dev *cd, struct genwqe_sgl 
> *sgl)

Looks good to me. Thanks.

Frank

Acked-by: Frank Haverkamp <haver@linux.vnet.ibm.com>

