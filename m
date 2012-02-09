From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 09 Feb 2012 01:17:39 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <20120209011739.GA17363@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 11, 2012 at 11:27:33PM +0100, Szymon Janc wrote:
> On Wednesday 11 January 2012 23:22:35 Szymon Janc wrote:
> > Changes since v1:
> >  - use pr_{err,info} instead of custom macros for logs
> >  - fixed quickstart_buttons_show issue pointed out by Dan
> >  - Use scnprintf in quickstart_pressed_button_show
> > 
> > Thx for comments.
> 
> Opps.  Please ignore
> [PATCH 15/16] Staging: quickstart: Add QS_INFO and QS_ERR macros for logs
> [PATCH 16/16] Staging: quickstart: Bump driver version to 1.04
> in this series...

Ok, I think I got the right ones, please check that I did.

Also, you just created the following build warning, please send me a
patch fixing it up:

drivers/staging/quickstart/quickstart.c: In function ‘quickstart_acpi_ghid’:
drivers/staging/quickstart/quickstart.c:212:5: warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument 3 has type ‘acpi_size’ [-Wformat]

thanks,

greg k-h
