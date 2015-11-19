From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 19 Nov 2015 19:26:32 +0000
Subject: Re: [PATCH 1/4] mtd: brcmnand: improve memory management
Message-Id: <20151119192632.GH64635@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447884254-26336-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447884254-26336-2-git-send-email-Julia.Lawall@lip6.fr>
 <20151118224440.GC64635@google.com>
 <alpine.DEB.2.02.1511190713140.2008@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1511190713140.2008@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>, Kamal Dasu <kdasu.kdev@gmail.com>

On Thu, Nov 19, 2015 at 07:13:45AM +0100, Julia Lawall wrote:
> On Wed, 18 Nov 2015, Brian Norris wrote:
> > On Wed, Nov 18, 2015 at 11:04:11PM +0100, Julia Lawall wrote:
> > > 3. If the continue is not taken, then host is added to a list, that has a
> > > lifetime beyond the end of the for_each_available_child_of_node loop body.
> > > Thus, of_node_get is needed on child, which is referenced by host.  A
> > > corresponding of_node_put is needed in the remove function.
> > 
> > This one's a bit silly. We really shouldn't be keeping the reference in
> > 'host' at all. Also, as of commit 215a02fd3087 ("mtd: grab a reference to
> > the MTD of_node before registering it"), the MTD core will actually be
> > refcounting the node for us, too, so this isn't really necessary.
> > 
> > I have a patch to remove brcmnand_host::of_node (appended below), which
> > should make this step obsolete, and be more obvious that no extra
> > of_node_get()'ing is required.
> 
> OK.  Should I resend my patch without this change?

Sure, that'd be good. Then I could merge/rebase mine on top.

Thanks,
Brian
