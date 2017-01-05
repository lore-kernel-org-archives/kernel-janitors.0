From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 05 Jan 2017 17:46:54 +0000
Subject: Re: [PATCH] staging: gdm724x: cleanup long lines to conform to kernel coding style
Message-Id: <20170105174654.GA8757@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170103201002.GA18938@emilgedda.se>
In-Reply-To: <20170103201002.GA18938@emilgedda.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 03, 2017 at 09:25:20PM +0100, Emil Gedda wrote:
> Refactor code to remove multi-line derefs and code duplication
> 
> Signed-off-by: Emil Gedda <emil.gedda@emilgedda.se>
> ---
> 
> Tried contacting the mentioned people in the relevant TODO, but after 2
> weeks I still haven't received a response, thus sending this to you
> directly. Error messages still need to be changed to use netdev_err, but
> that's for another patch. Sorry for the spam, still new to this.
> 
>  drivers/staging/gdm724x/gdm_lte.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)

Please use scripts/get_maintainer.pl to determine who and what mailing
list to send patches like this to (hint, not the janitors list.)

I'll review it if you fix that up and resend it.

thanks,

greg k-h
