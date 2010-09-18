From: Corey Minyard <minyard@acm.org>
Date: Sat, 18 Sep 2010 19:19:19 +0000
Subject: Re: [patch] ipmi: make static checkers happy about range checks
Message-Id: <4C9510B7.6050903@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100917190702.GA5384@bicker>
In-Reply-To: <20100917190702.GA5384@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm ok with this, I don't think it will make any real difference besides 
the compiler converting that comparison to unsigned.  I wish I had made 
that unsigned.

-corey

On 09/17/2010 02:26 PM, Dan Carpenter wrote:
> I'm working on a Smatch check that complains that addr->channel comes
> from the user and it might be negative.  It actually can *not* be
> negative because we already checked that when we called
> ipmi_validate_addr() from handle_send_req().  Also it can't be greater
> than or equal to IPMI_MAX_CHANNELS because we already verified that as
> well.
>
> Although this change doesn't do anything, it's still a cleanup because
> it makes the checking consistent and also it silences the static
> analysis warnings.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
> ---
> Really, I would prefer to just make ->channel unsigned but the type
> comes from the IPMI spec.
>
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 4f3f8c9..57f4c80 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -1527,7 +1527,7 @@ static int i_ipmi_request(ipmi_user_t          user,
>   		long                  seqid;
>   		int                   broadcast = 0;
>
> -		if (addr->channel>= IPMI_MAX_CHANNELS) {
> +		if (addr->channel<  0 || addr->channel>= IPMI_MAX_CHANNELS) {
>   			ipmi_inc_stat(intf, sent_invalid_commands);
>   			rv = -EINVAL;
>   			goto out_err;
> @@ -1657,7 +1657,7 @@ static int i_ipmi_request(ipmi_user_t          user,
>   		unsigned char         ipmb_seq;
>   		long                  seqid;
>
> -		if (addr->channel>= IPMI_MAX_CHANNELS) {
> +		if (addr->channel<  0 || addr->channel>= IPMI_MAX_CHANNELS) {
>   			ipmi_inc_stat(intf, sent_invalid_commands);
>   			rv = -EINVAL;
>   			goto out_err;
> @@ -1797,7 +1797,7 @@ static int check_addr(ipmi_smi_t       intf,
>   		      unsigned char    *saddr,
>   		      unsigned char    *lun)
>   {
> -	if (addr->channel>= IPMI_MAX_CHANNELS)
> +	if (addr->channel<  0 || addr->channel>= IPMI_MAX_CHANNELS)
>   		return -EINVAL;
>   	*lun = intf->channels[addr->channel].lun;
>   	*saddr = intf->channels[addr->channel].address;
>    

