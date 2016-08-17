From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 17 Aug 2016 06:25:26 +0000
Subject: Re: [PATCH 01/15 RESEND] staging: dgnc: remove redundant NULL checks in
Message-Id: <20160817062526.GA17218@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160706061113.GA18469@SEL-JYOUN-D1>
 <20160815170546.GB24214@kroah.com>
 <CAHb8M2DBZa8k3ZeM0OxcRf-7zFijCN2v3yt3FXs6EhY7cpXidA@mail.gmail.com>
In-Reply-To: <CAHb8M2DBZa8k3ZeM0OxcRf-7zFijCN2v3yt3FXs6EhY7cpXidA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DaeSeok Youn <daeseok.youn@gmail.com>
Cc: devel <devel@driverdev.osuosl.org>, Lidza Louina <lidza.louina@gmail.com>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Aug 17, 2016 at 10:05:03AM +0900, DaeSeok Youn wrote:
> 2016-08-16 2:05 GMT+09:00 Greg KH <gregkh@linuxfoundation.org>:
> > On Wed, Jul 06, 2016 at 03:11:13PM +0900, Daeseok Youn wrote:
> >> The dgnc_block_til_ready() is only used in dgnc_tty_open().
> >> The unit data(struct un_t) was stored into tty->driver_data in dgnc_tty_open().
> >> And also tty and un were tested about NULL so these variables doesn't
> >> need to check for NULL in dgnc_block_til_ready().
> >>
> >> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> >> ---
> >> RESEND: This patch was not merged for a long time, if there is any reason
> >> why this patch could NOT be merged into staging tree, let me know.
> >> There were no comment for this patch.
> >> I cannot understand why this patch have to wait long time to merge.
> >> And I also sent emails to mailing-lists for reminding this patch...
> >> please let me know, what is the problem to merge this patch into staging tree.
> >
> > Please note, staging patches are at the bottom of my priority queue.
> > Combined with a vacation, conferences, and a merge window and there are
> > a lot of pending staging patches in my to-review queue.
> 
> That's Ok. but I took a long time to wait for merging my patches in
> this case. :-(

You are not alone.  And what's the rush?  These are just trivial staging
driver patches, it's not like you have the hardware for this device and
are needing these patches to get it to work, right?

thanks,

greg k-h
