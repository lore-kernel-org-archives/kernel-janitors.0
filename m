From: Greg KH <greg@kroah.com>
Date: Tue, 05 Oct 2010 18:43:57 +0000
Subject: Re: [patch] staging: rtl8192su: initializing past the end of array
Message-Id: <20101005184357.GA24708@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101004192641.GF5692@bicker>
In-Reply-To: <20101004192641.GF5692@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 04, 2010 at 09:26:41PM +0200, Dan Carpenter wrote:
> We go past the end of the array when we initialize this array.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/rtl8192su/r8192S_rtl6052.c b/drivers/staging/rtl8192su/r8192S_rtl6052.c
> index 2239809..f8a9536 100644
> --- a/drivers/staging/rtl8192su/r8192S_rtl6052.c
> +++ b/drivers/staging/rtl8192su/r8192S_rtl6052.c

This driver has now been removed from the kernel, so there's no file to
patch in linux-next :)

thanks,

greg k-h
