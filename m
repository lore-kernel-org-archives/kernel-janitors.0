From: Varun Prakash <varun@chelsio.com>
Date: Mon, 11 Sep 2017 09:33:59 +0000
Subject: Re: [PATCH] csi: libcxgbi: remove redundant check and close on csk
Message-Id: <20170911092156.GA1721@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170907135133.16636-1-colin.king@canonical.com>
In-Reply-To: <20170907135133.16636-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 07, 2017 at 02:51:33PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> csk is always null on the error return path and so the non-null
> check and call to cxgbi_sock_closed on csk is redundant and
> can be removed.
> 
> Detected by: CoverityScan CID#114329 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/cxgbi/libcxgbi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/scsi/cxgbi/libcxgbi.c b/drivers/scsi/cxgbi/libcxgbi.c
> index 512c8f1ea5b0..da36c2de069e 100644
> --- a/drivers/scsi/cxgbi/libcxgbi.c
> +++ b/drivers/scsi/cxgbi/libcxgbi.c
> @@ -688,8 +688,6 @@ cxgbi_check_route(struct sockaddr *dst_addr, int ifindex)
>  
>  rel_rt:
>  	ip_rt_put(rt);
> -	if (csk)
> -		cxgbi_sock_closed(csk);
>  err_out:
>  	return ERR_PTR(err);
>  }

Acked-by: Varun Prakash <varun@chelsio.com> 
