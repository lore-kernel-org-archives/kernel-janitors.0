From: Vlad Yasevich <vladislav.yasevich@hp.com>
Date: Mon, 11 Feb 2008 02:23:11 +0000
Subject: Re: [Lksctp-developers] [PATCH 8/8] : Use FIELD_SIZEOF
Message-Id: <47AFB18F.1020006@hp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802102115100.23906@ask.diku.dk> <20080210211258.GE1754@martell.zuzino.mipt.ru>
In-Reply-To: <20080210211258.GE1754@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, lksctp-developers@lists.sourceforge.net, sri@us.ibm.com

Alexey Dobriyan wrote:
> On Sun, Feb 10, 2008 at 09:16:04PM +0100, Julia Lawall wrote:
>> --- a/include/net/sctp/sctp.h
>> +++ b/include/net/sctp/sctp.h
>> @@ -618,7 +618,7 @@ static inline int param_type2af(__be16 t
>>  static inline int sctp_sanity_check(void)
>>  {
>>  	SCTP_ASSERT(sizeof(struct sctp_ulpevent) <>> -		    sizeof(((struct sk_buff *)0)->cb),
>> +		    FIELD_SIZEOF(struct sk_buff, cb),
>>  		    "SCTP: ulpevent does not fit in skb!\n", return 0);
>>  
>>  	return 1;
> 
> Same here. Use BUILD_BUG_ON instead.

Ack. BUILD_BUG_ON is definitely appropriate here, especially considering
that SCTP_ASSERT compiles to nothing with debugging turned off.

-vlad

> 
> -------------------------------------------------------------------------
> This SF.net email is sponsored by: Microsoft
> Defy all challenges. Microsoft(R) Visual Studio 2008.
> http://clk.atdmt.com/MRT/go/vse0120000070mrt/direct/01/
> _______________________________________________
> Lksctp-developers mailing list
> Lksctp-developers@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/lksctp-developers
> 

