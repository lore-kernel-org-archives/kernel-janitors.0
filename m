From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 10 Feb 2008 21:12:58 +0000
Subject: Re: [PATCH 8/8] : Use FIELD_SIZEOF
Message-Id: <20080210211258.GE1754@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802102115100.23906@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802102115100.23906@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: vladislav.yasevich@hp.com, sri@us.ibm.com, lksctp-developers@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Feb 10, 2008 at 09:16:04PM +0100, Julia Lawall wrote:
> --- a/include/net/sctp/sctp.h
> +++ b/include/net/sctp/sctp.h
> @@ -618,7 +618,7 @@ static inline int param_type2af(__be16 t
>  static inline int sctp_sanity_check(void)
>  {
>  	SCTP_ASSERT(sizeof(struct sctp_ulpevent) <> -		    sizeof(((struct sk_buff *)0)->cb),
> +		    FIELD_SIZEOF(struct sk_buff, cb),
>  		    "SCTP: ulpevent does not fit in skb!\n", return 0);
>  
>  	return 1;

Same here. Use BUILD_BUG_ON instead.
