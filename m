From: Alan Stern <stern@rowland.harvard.edu>
Date: Fri, 14 Sep 2012 00:29:06 +0000
Subject: Re: ehci-dbg.c:656 fill_periodic_buffer() warn: variable dereferenced before check 'p.qh' (see line
Message-Id: <Pine.LNX.4.44L0.1209132027090.5121-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120913234902.GB6340@localhost>
In-Reply-To: <20120913234902.GB6340@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 14 Sep 2012, Fengguang Wu wrote:

> Hi Richard,
> 
> FYI, there are new smatch warnings show up in
> 
> commit 3807e26d69b9ad3864fe03224ebebc9610d5802e
> Author:     Alek Du <alek.du@intel.com>
> AuthorDate: Tue Jul 14 07:23:29 2009 +0800
> 
> drivers/usb/chipidea/../host/ehci-dbg.c:656 fill_periodic_buffer() warn: variable dereferenced before check 'p.qh' (see line 599)
> 
> vim +656 drivers/usb/chipidea/../host/ehci-dbg.c
>    596 
>    597                         switch (hc32_to_cpu(ehci, tag)) {
>    598                         case Q_TYPE_QH:
>    599                                 hw = p.qh->hw;
> ...
>  > 656					if (p.qh) {
>    657						tag = Q_NEXT_TYPE(ehci, hw->hw_next);
>    658						p = p.qh->qh_next;
>    659					}
>    660					break;

smatch is right; the test on line 656 isn't needed.  I'll take it out.

Thank you.

Alan Stern

