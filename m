From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:11:19 +0000
Subject: Re: [PATCH 31/56] sctp: Remove void casts
Message-Id: <49DDC9C7.7050407@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, vladislav.yasevich@hp.com

[Added maintainer CC]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  net/sctp/socket.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index 5fb3a8c..3ed4b4d 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -227,7 +227,7 @@ struct sctp_association *sctp_id2assoc(struct sock *sk, sctp_assoc_t id)
>  		return NULL;
>  
>  	spin_lock_bh(&sctp_assocs_id_lock);
> -	asoc = (struct sctp_association *)idr_find(&sctp_assocs_id, (int)id);
> +	asoc = idr_find(&sctp_assocs_id, (int)id);
>  	spin_unlock_bh(&sctp_assocs_id_lock);
>  
>  	if (!asoc || (asoc->base.sk != sk) || asoc->base.dead)
>   

