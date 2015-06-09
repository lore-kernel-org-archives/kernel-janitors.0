From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 09 Jun 2015 17:42:06 +0000
Subject: Re: [PATCH V3 1/2] staging: wilc1000: remove UWORD8
Message-Id: <20150609174206.GA23140@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433805815-4659-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1433805815-4659-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 09, 2015 at 08:23:34AM +0900, Chaehyun Lim wrote:
> Use u8 instead of UWORD8.
> 
> Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
> ---
> V3 : Capitalize the name on the From and the Signed-off-by
> V2 : remove the defintion of UWORD8
> 
>  drivers/staging/wilc1000/coreconfigurator.c | 2 +-
>  drivers/staging/wilc1000/host_interface.c   | 2 +-
>  drivers/staging/wilc1000/itypes.h           | 1 -
>  3 files changed, 2 insertions(+), 3 deletions(-)

This patch does not apply to my staging-testing branch :(

I can't apply either of these, sorry, please rebase and resend.

thanks,

greg k-h
