From: "J . Bruce Fields" <bfields@fieldses.org>
Date: Tue, 27 Nov 2018 22:33:57 +0000
Subject: Re: [PATCH] nfsd: clean up indentation, increase indentation in switch statement
Message-Id: <20181127223357.GA15237@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181103161253.3622-1-colin.king@canonical.com>
In-Reply-To: <20181103161253.3622-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks, applying for 4.21.--b.

On Sat, Nov 03, 2018 at 04:12:53PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to clean up indentation, add in missing tabs.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/nfsd/nfs4state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index f093fbe47133..eb129a6f9eae 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -6230,15 +6230,15 @@ nfsd4_lockt(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
>  		case NFS4_READ_LT:
>  		case NFS4_READW_LT:
>  			file_lock->fl_type = F_RDLCK;
> -		break;
> +			break;
>  		case NFS4_WRITE_LT:
>  		case NFS4_WRITEW_LT:
>  			file_lock->fl_type = F_WRLCK;
> -		break;
> +			break;
>  		default:
>  			dprintk("NFSD: nfs4_lockt: bad lock type!\n");
>  			status = nfserr_inval;
> -		goto out;
> +			goto out;
>  	}
>  
>  	lo = find_lockowner_str(cstate->clp, &lockt->lt_owner);
> -- 
> 2.19.1
