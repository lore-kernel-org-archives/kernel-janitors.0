From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 12 Mar 2019 10:22:13 +0000
Subject: Re: [PATCH] Fix for a small typo
Message-Id: <alpine.DEB.2.20.1903121120490.4097@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190312095149.GA10972@machine1>
In-Reply-To: <20190312095149.GA10972@machine1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Tue, 12 Mar 2019, Milan P. Gandhi wrote:

The patch should have a log message.  For example, you could point out
where the type is so the reader doesn't have to search for it.

The subject line should also give a hint about what file is affected, so
that the right person will pay attention to it. You can see what subject
lines others have used on this file by:

git log --oneline drivers/scsi/qla2xxx/qla_bsg.c

julia


> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
> ---
>  drivers/scsi/qla2xxx/qla_bsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/qla2xxx/qla_bsg.c b/drivers/scsi/qla2xxx/qla_bsg.c
> index 17d42658ad9a..f2b95f11a71c 100644
> --- a/drivers/scsi/qla2xxx/qla_bsg.c
> +++ b/drivers/scsi/qla2xxx/qla_bsg.c
> @@ -1354,7 +1354,7 @@ qla24xx_iidma(struct bsg_job *bsg_job)
>
>  	if (rval) {
>  		ql_log(ql_log_warn, vha, 0x704c,
> -		    "iIDMA cmd failed for %8phN -- "
> +		    "iiDMA cmd failed for %8phN -- "
>  		    "%04x %x %04x %04x.\n", fcport->port_name,
>  		    rval, fcport->fp_speed, mb[0], mb[1]);
>  		rval = (DID_ERROR << 16);
>
