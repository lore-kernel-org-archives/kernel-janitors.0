From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 13 Jul 2010 18:33:11 +0000
Subject: Re: [PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
Message-Id: <4C3CB167.4040702@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278732312.1725.17.camel@lenovo>
In-Reply-To: <1278732312.1725.17.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/09/10 20:25, Javier Martinez Canillas wrote:
> This patch is the first one of a patchset that allows 
> stagin/spectra driver to compile in linux-next. 
> 
> blk_queue_ordered doesn't receive a prepare flush function anymore
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>

These 3 patches fix the build errors.
There are still some warnings that should be addressed.

Thanks.

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>


> ---
>  drivers/staging/spectra/ffsport.c |   10 +---------
>  1 files changed, 1 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/spectra/ffsport.c b/drivers/staging/spectra/ffsport.c
> index d0c5c97..eca6536 100644
> --- a/drivers/staging/spectra/ffsport.c
> +++ b/drivers/staging/spectra/ffsport.c
> @@ -272,13 +272,6 @@ static int get_res_blk_num_os(void)
>  	return res_blks;
>  }
>  
> -static void SBD_prepare_flush(struct request_queue *q, struct request *rq)
> -{
> -	rq->cmd_type = REQ_TYPE_LINUX_BLOCK;
> -	/* rq->timeout = 5 * HZ; */
> -	rq->cmd[0] = REQ_LB_OP_FLUSH;
> -}
> -
>  /* Transfer a full request. */
>  static int do_transfer(struct spectra_nand_dev *tr, struct request *req)
>  {
> @@ -650,8 +643,7 @@ static int SBD_setup_device(struct spectra_nand_dev *dev, int which)
>  	/* Here we force report 512 byte hardware sector size to Kernel */
>  	blk_queue_logical_block_size(dev->queue, 512);
>  
> -	blk_queue_ordered(dev->queue, QUEUE_ORDERED_DRAIN_FLUSH,
> -					SBD_prepare_flush);
> +	blk_queue_ordered(dev->queue, QUEUE_ORDERED_DRAIN_FLUSH);
>  
>  	dev->thread = kthread_run(spectra_trans_thread, dev, "nand_thd");
>  	if (IS_ERR(dev->thread)) {


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
