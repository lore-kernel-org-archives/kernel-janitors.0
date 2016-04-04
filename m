From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 04 Apr 2016 19:26:09 +0000
Subject: Re: [PATCH] staging: vme: fix bare use of 'unsigned'
Message-Id: <20160404192609.GA10731@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459464794-27986-1-git-send-email-clifton.a.barnes@gmail.com>
 <57017ECF.1060404@gmail.com>
In-Reply-To: <57017ECF.1060404@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martyn Welch <mwelchuk@gmail.com>
Cc: Clifton Barnes <clifton.a.barnes@gmail.com>, martyn@welchs.me.uk, manohar.vanga@gmail.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org

On Sun, Apr 03, 2016 at 09:36:31PM +0100, Martyn Welch wrote:
> 
> 
> On 31/03/16 23:53, Clifton Barnes wrote:
> > fix checkpatch.pl warning about 'Prefer 'unsigned int' to bare use of
> > 'unsigned''
> > 
> > Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
> 
> Acked-by: Martyn Welch <martyn@welchs.me.uk>
> 
> Greg: Whilst this patch seems valid and compiles fine, I no longer have
> access to the hardware for this driver. I'm aware this driver has been in
> the staging tree for a rather long time. I will check to see if there's any
> intention for further work to be done on this driver, if not I guess we
> should be looking to delete it from the staging tree.
> 

Thanks, let me know if you want it deleted.

greg k-h
