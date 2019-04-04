From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 06:35:21 +0000
Subject: Re: [PATCH] Bluetooth: hci_event: potential out of bounds parsing ADV events
Message-Id: <20190404063521.GF32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330072511.GA5502@kadam>
 <f1baaa05-bd1d-f2cf-410a-7073e85412d3@gmail.com>
 <CAM_iQpVNqyoBirtKg-rbOHsOZCZ0Oz5PTE2sFQnHQnv6s7g2gg@mail.gmail.com>
 <20190402063313.GA32613@kadam>
 <CAM_iQpW=X2X5A873nSPM7yLBiWZM+rsJk+uMpiOioYPFsFP9vg@mail.gmail.com>
 <20190402201322.GG32613@kadam>
 <CAM_iQpWjwOwawBN3yiZ0F-B-HDSOW8KGfpLGhAsf5yE0A=wtDA@mail.gmail.com>
In-Reply-To: <CAM_iQpWjwOwawBN3yiZ0F-B-HDSOW8KGfpLGhAsf5yE0A=wtDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Tomas Bortoli <tomasbortoli@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Jaganath Kanakkassery <jaganath.k.os@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 03, 2019 at 03:51:18PM -0700, Cong Wang wrote:
> On Tue, Apr 2, 2019 at 1:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Tue, Apr 02, 2019 at 10:42:38AM -0700, Cong Wang wrote:
> > > > Btw, get rid of all the likely/unlikely() macros.  Then the other style
> > > > comment would be don't move the "ev = (void *)skb->data;" assignments
> > > > around.  It's ok to say:
> > >
> > >
> > > Similarly, pskb_may_pull() may reallocate skb's, although very unlikely
> > > for bluetooth case (skb's are linear). At least it doesn't harm anything
> > > we move the skb->data dereference after pskb_may_pull().
> > >
> >
> > It harms readability.
> 
> Why? I can't see how it harms readability if you have pskb_may_pull()
> in mind that it potentially reallocates skb->data.

You're making the code more complicated because you're pretending that
we didn't linearize the skb data already...  :/

regards,
dan carpenter
