From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 07:08:32 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-usb list remarks consistent
Message-Id: <alpine.DEB.2.21.2009140834010.17999@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200912121346.2796-1-lukas.bulwahn@gmail.com> <alpine.DEB.2.21.2009121416500.3770@felia> <20200912124025.GA174230@kroah.com> <da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com>
In-Reply-To: <da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sat, 12 Sep 2020, Joe Perches wrote:

> On Sat, 2020-09-12 at 14:40 +0200, Greg Kroah-Hartman wrote:
> > On Sat, Sep 12, 2020 at 02:19:02PM +0200, Lukas Bulwahn wrote:
> > > 
> > > On Sat, 12 Sep 2020, Lukas Bulwahn wrote:
> > > 
> > > > This patch submission will also show me if linux-usb is moderated or not.
> > > > I have not subscribed to linux-usb and if it shows up quickly in the
> > > > archive, the list is probably not moderated, and hence, validating the
> > > > patch.
> > > > 
> > > 
> > > The patch showed up in the archives within seconds:
> > > 
> > > https://lore.kernel.org/linux-usb/20200912121346.2796-1-lukas.bulwahn@gmail.com/
> > > 
> > > So, the linux-usb list is most likely not moderated. Patch validated.
> > 
> > Yes, it is not moderated, and never has been, no idea where that idea came from.
> 
> There's also linux-samsung-soc@vger.kernel.org
> that is listed as moderated
> 
> Are any of the vger lists actually moderated?
>  


Joe, I found these five list entries with inconsistent remarks:

- linux-usb@vger.kernel.org:
  - Patch: https://lore.kernel.org/lkml/20200912121346.2796-1-lukas.bulwahn@gmail.com/  (the patch here)

- linux-aspeed@lists.ozlabs.org:
  - Patch: https://lore.kernel.org/lkml/20200912183334.22683-1-lukas.bulwahn@gmail.com/

- linux-mediatek@lists.infradead.org:
  - Patch: https://lore.kernel.org/lkml/20200914053110.23286-1-lukas.bulwahn@gmail.com/
    - initial patch here was wrong.
    - waiting for somebody to confirm that it is not moderated to then 
send the correct patch.

- linux-samsung-soc@vger.kernel.org:
  - Patch: https://lore.kernel.org/lkml/20200914061353.17535-1-lukas.bulwahn@gmail.com/

- linux-arm-kernel@lists.infradead.org:
  - by 'majority vote' (131 vs. 27), it is probably moderated.
  - no patch sent yet; patch will follow once the others are accepted.

Then, more patches on adding 'exploders for non-subscribers' remarks will 
follow.


Lukas
