From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 02 Jul 2019 17:59:24 +0000
Subject: Re: [PATCH] openpromfs: Adjust three seq_printf() calls in property_show()
Message-Id: <20190702175924.GA20949@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <22563348-fefa-8540-9d71-de37764f0596@web.de>
 <c26343465261e636ef029b8d0d7cb46183a23d23.camel@perches.com>
In-Reply-To: <c26343465261e636ef029b8d0d7cb46183a23d23.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jul 02, 2019 at 09:08:04AM -0700, Joe Perches wrote:
> On Tue, 2019-07-02 at 17:40 +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Tue, 2 Jul 2019 17:24:27 +0200
> > 
> > A bit of information should be put into a sequence.
> > Thus improve the execution speed for this data output by better usage
> > of corresponding functions.
> > 
> > This issue was detected by using the Coccinelle software.
> 
> (wasn't Markus perma-banned?)

He's in my kill-file, I recommend you doing the same, it's much easier
that way :)

thanks,

greg k-h
