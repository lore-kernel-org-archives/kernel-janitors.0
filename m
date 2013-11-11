From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 11 Nov 2013 05:15:02 +0000
Subject: Re: [PATCH] staging: r8188eu: various space fixes
Message-Id: <20131111051502.GC6890@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+1HSeq-dLweV4rCNwC-4NDGhpx_Xj=o4XiitJsTj-Tc-2upbA@mail.gmail.com>
In-Reply-To: <CA+1HSeq-dLweV4rCNwC-4NDGhpx_Xj=o4XiitJsTj-Tc-2upbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 11, 2013 at 01:18:48AM -0200, Marco Lavagnino wrote:
> Fixes various warnings from empty spaces in the file 'rtw_cmd.c'.
> 
> I hope I got it right now.
> 
> Signed-off-by: Marco S Lavagnino <marco.lavagnino@gmail.com>
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c
> b/drivers/staging/rtl8188eu/core/rtw_cmd.c
> index f45f4ed..850dcbf 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
> @@ -32,7 +32,7 @@ Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
>  No irqsave is necessary.
>  */
> 
> -int _rtw_init_cmd_priv (struct cmd_priv *pcmdpriv)
> +int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>  {
>   int res = _SUCCESS;

Whitespace is all corrupted, you can't send patches directly from gmail,
you have to use it as a SMTP server, not through the web interface,
sorry.

greg k-h
