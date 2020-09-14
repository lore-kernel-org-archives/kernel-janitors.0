From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 15:23:58 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <alpine.DEB.2.21.2009141717470.17999@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
 <alpine.DEB.2.21.2009141615020.17999@felia>
 <f511570405799df421397ff65847e927745dad08.camel@infradead.org>
In-Reply-To: <f511570405799df421397ff65847e927745dad08.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>



On Mon, 14 Sep 2020, David Woodhouse wrote:

> On Mon, 2020-09-14 at 16:57 +0200, Lukas Bulwahn wrote:
> > Well, I am happy to send any PATCH v2. I guess we, you, David, Matthias 
> > and I, now just need to determine if the list is moderated or not.
> 
> It really isn't.
> 
>  # /usr/lib/mailman/bin/config_list -o- linux-mediatek | grep -B5 ^generic_nonmember_action
> # legal values are:
> #    0 = "Accept"
> #    1 = "Hold"
> #    2 = "Reject"
> #    3 = "Discard"
> generic_nonmember_action = 0
> 

David, I guess if you have access to the ground truth on 
lists.infradead.org, maybe you can dump the actual setting for all those 
lists?

$ grep "lists.infradead.org" MAINTAINERS | sort | uniq

L:	ath10k@lists.infradead.org
L:	ath11k@lists.infradead.org
L:	b43-dev@lists.infradead.org
L:	kexec@lists.infradead.org
L:	libertas-dev@lists.infradead.org
L:	linux-afs@lists.infradead.org
L:	linux-amlogic@lists.infradead.org
L:	linux-arm-kernel@lists.infradead.org
L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
L:	linux-geode@lists.infradead.org (moderated for non-subscribers)
L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
L:	linux-mediatek@lists.infradead.org
L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
L:	linux-mtd@lists.infradead.org
L:	linux-nvme@lists.infradead.org
L:	linux-parport@lists.infradead.org (subscribers-only)
L:	linux-realtek-soc@lists.infradead.org (moderated for non-subscribers)
L:	linux-riscv@lists.infradead.org
L:	linux-rockchip@lists.infradead.org
L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
L:	linux-snps-arc@lists.infradead.org
L:	linux-um@lists.infradead.org
L:	linux-unisoc@lists.infradead.org (moderated for non-subscribers)
L:	wcn36xx@lists.infradead.org


They are all reporting different settings and linux-mediatek and 
linux-arm-kernel even inconsistently. The inconsistency and a poor attempt 
to resolve that is what started this discussion.

I can then send out the patch to adjust MAINTAINERS to your ground truth 
from the server.

Thanks for your support,

Lukas
