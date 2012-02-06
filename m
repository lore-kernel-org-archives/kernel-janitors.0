From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 06 Feb 2012 21:32:12 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <20120206213212.GA5019@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 06, 2012 at 07:21:51PM +0100, Szymon Janc wrote:
> Hi Greg,
> 
> > Changes since v1:
> >  - use pr_{err,info} instead of custom macros for logs
> >  - fixed quickstart_buttons_show issue pointed out by Dan
> >  - Use scnprintf in quickstart_pressed_button_show
> 
> Should I resent those patches to your new email address?
> Or they are just waiting in queue?

They are in my to-apply queue, don't worry, they are not lost.

greg k-h
