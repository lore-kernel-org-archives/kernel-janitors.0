From: Jack Stone <jwjstone@fastmail.fm>
Date: Thu, 09 Apr 2009 10:13:35 +0000
Subject: Re: [PATCH 33/56] tipc: Remove void casts
Message-Id: <49DDCA4F.1040605@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, per.liden@ericsson.com, jon.maloy@ericsson.com, allan.stephens@windriver.com

[Added maintainer CCs]
Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> ---
>  net/tipc/port.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/tipc/port.c b/net/tipc/port.c
> index e70d27e..0804ae2 100644
> --- a/net/tipc/port.c
> +++ b/net/tipc/port.c
> @@ -1528,7 +1528,7 @@ int tipc_forward_buf2name(u32 ref,
>  	u32 destport = 0;
>  	int res;
>  
> -	p_ptr = (struct port *)tipc_ref_deref(ref);
> +	p_ptr = tipc_ref_deref(ref);
>  	if (!p_ptr || p_ptr->publ.connected)
>  		return -EINVAL;
>  
> @@ -1656,7 +1656,7 @@ int tipc_forward_buf2port(u32 ref,
>  	struct tipc_msg *msg;
>  	int res;
>  
> -	p_ptr = (struct port *)tipc_ref_deref(ref);
> +	p_ptr = tipc_ref_deref(ref);
>  	if (!p_ptr || p_ptr->publ.connected)
>  		return -EINVAL;
>  
>   

