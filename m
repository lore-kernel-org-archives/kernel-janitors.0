From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 10:20:24 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <alpine.DEB.2.21.2009141208200.17999@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
In-Reply-To: <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>



On Mon, 14 Sep 2020, Matthias Brugger wrote:

> 
> 
> On 14/09/2020 07:31, Lukas Bulwahn wrote:
> > Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> > support") does not mention that linux-mediatek@lists.infradead.org is
> > moderated for non-subscribers, but the other eight entries for
> > linux-mediatek@lists.infradead.org do.
> > 
> > Adjust this entry to be consistent with all others.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Maybe rephrase the commit message to something like:
> "Mark linux-mediatek@lists.infraded.org as moderated for the MediaTek PCIe
> host controller entry, as the list actually is moderated."
> 
> Anyway:
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> > ---
> > applies cleanly on v5.9-rc5 and next-20200911
> > 
> > Ryder, please ack.
> > 
> > Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> > 
> > This patch submission will also show me if linux-mediatek is moderated or
> > not. I have not subscribed to linux-mediatek and if it shows up quickly in
> > the archive, the list is probably not moderated; and if it takes longer, it
> > is moderated, and hence, validating the patch.
> 
> I can affirm the list is moderated :)
>

Hmm, do we mean the same "moderation" here?

I believe a mailing list with the remark "moderated for non-subscribers" 
means that a mail from an address that has not subscribed to the mailing 
list is put on hold and needs to be manually permitted to be seen on the 
mailing list.

Matthias, is that also your understanding of "moderated for 
non-subscribers" for your Reviewed-by tag?

I am not subscribed to linux-mediatek. When I sent an email to the list, 
it showed up really seconds later in the lore.kernel.org of the 
linux-mediatek public-inbox repository. So, either it was delivered 
quickly as it is not moderated or my check with lore.kernel.org is wrong, 
e.g., mails show up in the lore.kernel.org archive, even they were not
yet permitted on the actual list.


Lukas
