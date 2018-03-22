From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 22 Mar 2018 17:16:49 +0000
Subject: Re: [PATCH] staging: rtl8723bs/core/rtw_mlme_ext.c: Replace yield() call with cond_resched
Message-Id: <20180322171649.GA28191@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180320214541.cknrcuercnhfrx2a@debian>
In-Reply-To: <20180320214541.cknrcuercnhfrx2a@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Avery <tavery321@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 20, 2018 at 05:45:41PM -0400, Thomas Avery wrote:
> Remove yield() call, yield() does not guarantee progress, and should not
> be used. Cond_resched() is a safer alternative
> 
> Signed-off-by: Thomas Avery <tavery321@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

You sent me 3 patches in 2 days with almost the same subject for the
same driver.  Please resend them as a patch series so I know what order
to apply them in.

Also, always use scripts/get_maintainer.pl to find the proper people and
mailing lists to cc:

thanks,

greg k-h
