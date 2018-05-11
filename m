From: "Dilger, Andreas" <andreas.dilger@intel.com>
Date: Fri, 11 May 2018 19:32:23 +0000
Subject: Re: [lustre-devel] [PATCH] staging: lustre: fix spelling mistake: "req_ulinked" -> "req_unlinked"
Message-Id: <C3001646-0A1B-4118-81DF-486D7BAC7208@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180511133859.18733-1-colin.king@canonical.com>
In-Reply-To: <20180511133859.18733-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, NeilBrown <neilb@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Drokin,
 Oleg" <oleg.drokin@intel.com>

On May 11, 2018, at 07:38, Colin King <colin.king@canonical.com> wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in DEBUG_REQ message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Andreas Dilger <andreas.dilger@intel.com>

> ---
> drivers/staging/lustre/lustre/ptlrpc/client.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/lustre/lustre/ptlrpc/client.c b/drivers/staging/lustre/lustre/ptlrpc/client.c
> index eeb281266413..a51feaeb7734 100644
> --- a/drivers/staging/lustre/lustre/ptlrpc/client.c
> +++ b/drivers/staging/lustre/lustre/ptlrpc/client.c
> @@ -2514,7 +2514,7 @@ static int ptlrpc_unregister_reply(struct ptlrpc_request *request, int async)
> 		}
> 
> 		DEBUG_REQ(D_WARNING, request,
> -			  "Unexpectedly long timeout receiving_reply=%d req_ulinked=%d reply_unlinked=%d",
> +			  "Unexpectedly long timeout receiving_reply=%d req_unlinked=%d reply_unlinked=%d",
> 			  request->rq_receiving_reply,
> 			  request->rq_req_unlinked,
> 			  request->rq_reply_unlinked);
> -- 
> 2.17.0

Cheers, Andreas
--
Andreas Dilger
Lustre Principal Architect
Intel Corporation







