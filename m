From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Nov 2019 08:06:41 +0000
Subject: Re: [PATCH -next] um: vector: use GFP_ATOMIC under spin lock
Message-Id: <20191128080641.GD1781@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191128020147.191893-1-weiyongjun1@huawei.com>
In-Reply-To: <20191128020147.191893-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, linux-um@lists.infradead.org, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 28, 2019 at 02:01:47AM +0000, Wei Yongjun wrote:
> A spin lock is taken here so we should use GFP_ATOMIC.
> 
> Fixes: 9807019a62dc ("um: Loadable BPF "Firmware" for vector drivers")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  arch/um/drivers/vector_kern.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> index 92617e16829e..6ff0065a271d 100644
> --- a/arch/um/drivers/vector_kern.c
> +++ b/arch/um/drivers/vector_kern.c
> @@ -1402,7 +1402,7 @@ static int vector_net_load_bpf_flash(struct net_device *dev,
>  		kfree(vp->bpf->filter);
>  		vp->bpf->filter = NULL;
>  	} else {
> -		vp->bpf = kmalloc(sizeof(struct sock_fprog), GFP_KERNEL);
> +		vp->bpf = kmalloc(sizeof(struct sock_fprog), GFP_ATOMIC);
>  		if (vp->bpf = NULL) {
>  			netdev_err(dev, "failed to allocate memory for firmware\n");
>  			goto flash_fail;
> @@ -1414,7 +1414,7 @@ static int vector_net_load_bpf_flash(struct net_device *dev,
>  	if (request_firmware(&fw, efl->data, &vdevice->pdev.dev))
            ^^^^^^^^^^^^^^^^

Is it really possible to call request_firmware() while holding a
spin_lock?  I was so sure that read from the disk.

regards,
dan carpenter

>  		goto flash_fail;
>  
> -	vp->bpf->filter = kmemdup(fw->data, fw->size, GFP_KERNEL);
> +	vp->bpf->filter = kmemdup(fw->data, fw->size, GFP_ATOMIC);
>  	if (!vp->bpf->filter)
>  		goto free_buffer;
> 
> 
