From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 09 Jun 2015 17:44:27 +0000
Subject: Re: [PATCH V2 1/8] staging: wilc1000: remove WILC_Uint8
Message-Id: <20150609174427.GA29608@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 09, 2015 at 09:19:32AM +0900, Chaehyun Lim wrote:
> Use u8 in stead of WILC_Uint8.
> 
> Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
> ---
> V2 : remove the spaces on the subject
>      Capitalize the name on the From and the Signed-off-by

As your other patches didn't apply, this series didn't either.  Please
rebase all of these, and resend them all as one series, not two
different ones.

thanks,

greg k-h
