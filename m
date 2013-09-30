From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Mon, 30 Sep 2013 14:29:31 +0000
Subject: Re: [patch] staging: rtl8712: remove unneeded NULL check
Message-Id: <52498ACB.7090705@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130928095833.GE26611@elgon.mountain>
In-Reply-To: <20130928095833.GE26611@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 09/28/2013 04:58 AM, Dan Carpenter wrote:
> We knew "peventbuf" was a valid pointer and "peventbuf + 2" is also
> non-NULL.  I have removed the check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/rtl8712/rtl8712_cmd.c b/drivers/staging/rtl8712/rtl8712_cmd.c
> index 088647c..53f247b 100644
> --- a/drivers/staging/rtl8712/rtl8712_cmd.c
> +++ b/drivers/staging/rtl8712/rtl8712_cmd.c
> @@ -471,11 +471,9 @@ void r8712_event_handle(struct _adapter *padapter, uint *peventbuf)
>   	if (pevt_priv->event_seq > 127)
>   		pevt_priv->event_seq = 0;
>   	peventbuf = peventbuf + 2; /* move to event content, 8 bytes alignment */
> -	if (peventbuf) {
> -		event_callback = wlanevents[evt_code].event_callback;
> -		if (event_callback)
> -			event_callback(padapter, (u8 *)peventbuf);
> -	}
> +	event_callback = wlanevents[evt_code].event_callback;
> +	if (event_callback)
> +		event_callback(padapter, (u8 *)peventbuf);
>   	pevt_priv->evt_done_cnt++;
>   _abort_event_:
>   	return;

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry


