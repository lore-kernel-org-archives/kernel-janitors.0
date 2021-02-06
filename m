From: Peter Chen <peter.chen@kernel.org>
Date: Sat, 06 Feb 2021 07:46:10 +0000
Subject: Re: [PATCH] usb: cdnsp: Removes some useless trace events
Message-Id: <20210206074610.GA2648@b29397-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204092035.32424-1-pawell@cadence.com>
 <YBvMENpo3OTp5vrj@kroah.com>
In-Reply-To: <YBvMENpo3OTp5vrj@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pawel Laszczak <pawell@cadence.com>, peter.chen@nxp.com, dan.carpenter@oracle.com, colin.king@canonical.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kurahul@cadence.com

On 21-02-04 11:27:28, Greg KH wrote:
> On Thu, Feb 04, 2021 at 10:20:35AM +0100, Pawel Laszczak wrote:
> > Patch removes some useless trace events that can
> > be replaced by ftrace.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> > ---
> >  drivers/usb/cdns3/cdnsp-ep0.c    |  5 -----
> >  drivers/usb/cdns3/cdnsp-gadget.c |  2 --
> >  drivers/usb/cdns3/cdnsp-ring.c   |  1 -
> >  drivers/usb/cdns3/cdnsp-trace.h  | 10 ----------
> >  4 files changed, 18 deletions(-)
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied, thanks Pawel.

-- 

Thanks,
Peter Chen
