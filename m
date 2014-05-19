From: Manuel Schoelling <manuel.schoelling@gmx.de>
Date: Mon, 19 May 2014 16:53:42 +0000
Subject: Re: [PATCH 1/3] net: vxge: Use time_is_before_jiffies() for time comparison
Message-Id: <1400518422.4698.8.camel@schoellingm.dzne.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400518056-12089-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400518056-12089-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sorry, contrary to the subject of this mail, this is a single file
patch.
Patches 2-3 do not exist.

On Mo, 2014-05-19 at 18:47 +0200, Manuel Schölling wrote:
> To be future-proof and for better readability the time comparisons are modified
> to use time_is_before_jiffies() instead of plain, error-prone math.
> 
> Signed-off-by: Manuel Schölling <manuel.schoelling@gmx.de>
> ---
>  drivers/net/ethernet/neterion/vxge/vxge-main.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/neterion/vxge/vxge-main.c b/drivers/net/ethernet/neterion/vxge/vxge-main.c
> index d107bcb..79f42db 100644
> --- a/drivers/net/ethernet/neterion/vxge/vxge-main.c
> +++ b/drivers/net/ethernet/neterion/vxge/vxge-main.c
> @@ -2122,7 +2122,7 @@ static int vxge_open_vpaths(struct vxgedev *vdev)
>  static void adaptive_coalesce_tx_interrupts(struct vxge_fifo *fifo)
>  {
>  	fifo->interrupt_count++;
> -	if (jiffies > fifo->jiffies + HZ / 100) {
> +	if (time_is_before_jiffies(fifo->jiffies + HZ / 100)) {
>  		struct __vxge_hw_fifo *hw_fifo = fifo->handle;
>  
>  		fifo->jiffies = jiffies;
> @@ -2150,7 +2150,7 @@ static void adaptive_coalesce_tx_interrupts(struct vxge_fifo *fifo)
>  static void adaptive_coalesce_rx_interrupts(struct vxge_ring *ring)
>  {
>  	ring->interrupt_count++;
> -	if (jiffies > ring->jiffies + HZ / 100) {
> +	if (time_is_before_jiffies(ring->jiffies + HZ / 100)) {
>  		struct __vxge_hw_ring *hw_ring = ring->handle;
>  
>  		ring->jiffies = jiffies;


