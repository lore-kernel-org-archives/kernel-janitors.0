From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 05:39:40 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <alpine.DEB.2.21.2009140738570.24617@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, Joe Perches <joe@perches.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>



On Mon, 14 Sep 2020, Lukas Bulwahn wrote:

> Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> support") does not mention that linux-mediatek@lists.infradead.org is
> moderated for non-subscribers, but the other eight entries for
> linux-mediatek@lists.infradead.org do.
> 
> Adjust this entry to be consistent with all others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Ryder, please ack.
> 
> Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> 
> This patch submission will also show me if linux-mediatek is moderated or
> not. I have not subscribed to linux-mediatek and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer, it
> is moderated, and hence, validating the patch.
> 

Okay, my patch showed up within seconds in the archive:

https://lore.kernel.org/linux-mediatek/20200914053110.23286-1-lukas.bulwahn@gmail.com/


I think the linux-mediatek list is actually NOT _moderated for 
non-subscribers_.

Please IGNORE this patch until someone can confirm if it is moderated or 
not. I will then send the patch that reflects the actual state.

Thanks, Lukas
