From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 22 Mar 2016 13:02:08 +0000
Subject: Re: [PATCH 3/3] staging: dgnc: use tty_alloc_driver instead of kcalloc
Message-Id: <20160322130208.GA32381@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160314042900.GA6179@SEL-JYOUN-D1>
 <20160321210532.GE9749@kroah.com>
 <CAHb8M2B5fYUbM3mmHUca9Yc4Fp3UfK1Epo-Y2Caj1W7RnMuz0Q@mail.gmail.com>
In-Reply-To: <CAHb8M2B5fYUbM3mmHUca9Yc4Fp3UfK1Epo-Y2Caj1W7RnMuz0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DaeSeok Youn <daeseok.youn@gmail.com>
Cc: devel <devel@driverdev.osuosl.org>, Lidza Louina <lidza.louina@gmail.com>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Mar 22, 2016 at 04:40:24PM +0900, DaeSeok Youn wrote:
> 2016-03-22 6:05 GMT+09:00 Greg KH <gregkh@linuxfoundation.org>:
> > On Mon, Mar 14, 2016 at 01:29:00PM +0900, Daeseok Youn wrote:
> >> the tty_alloc_driver() can allocate memory for ttys and termios.
> >> And also it can release allocated memory easly with using
> >> put_tty_driver().
> >>
> >> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> >
> > But you broke the driver in the previous patch, you can't do that, each
> > patch has to be 'stand-alone'.
> I am not sure about 'stand-alone'. this patch has to have dependency on
> previous patch..

Yes, that is ok, but your first patch said it was just function
renaming, and then the second patch broke functionality, and the third
fixed it up.  You should have a working kernel at each step in your
patch series, which you did not.

> And I have a question not related this thread,
> I had been waiting my patches merged and also have other patches on
> same file(in case of dgnc).
> I couldn't send next patches until previous patches are taken.
> How can I manage my patches for this case?

Just send your new patches and say they depend on the previous ones.  My
staging patch queue is almost empty at the moment so odds are I have
already applied, or rejected them.

thanks,

greg k-h
