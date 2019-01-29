From: Varun Prakash <varun@chelsio.com>
Date: Tue, 29 Jan 2019 15:41:38 +0000
Subject: Re: [PATCH -next] scsi: csiostor: Remove set but not used variable 'pln'
Message-Id: <20190129152936.GA1660@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548381439-97080-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548381439-97080-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 25, 2019 at 01:57:19AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/csiostor/csio_attr.c: In function 'csio_fcoe_free_vnp':
> drivers/scsi/csiostor/csio_attr.c:500:21: warning:
>  variable 'pln' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/scsi/csiostor/csio_attr.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/scsi/csiostor/csio_attr.c b/drivers/scsi/csiostor/csio_attr.c
> index 9bd2bd8..200e500 100644
> --- a/drivers/scsi/csiostor/csio_attr.c
> +++ b/drivers/scsi/csiostor/csio_attr.c
> @@ -497,7 +497,6 @@
>  static int
>  csio_fcoe_free_vnp(struct csio_hw *hw, struct csio_lnode *ln)
>  {
> -	struct csio_lnode *pln;
>  	struct csio_mb  *mbp;
>  	struct fw_fcoe_vnp_cmd *rsp;
>  	int ret = 0;
> @@ -514,8 +513,6 @@
>  		goto out;
>  	}
>  
> -	pln = ln->pln;
> -
>  	csio_fcoe_vnp_free_init_mb(ln, mbp, CSIO_MB_DEFAULT_TMO,
>  				   ln->fcf_flowid, ln->vnp_flowid,
>  				   NULL);
> 
>

Acked-by: Varun Prakash <varun@chelsio.com>
