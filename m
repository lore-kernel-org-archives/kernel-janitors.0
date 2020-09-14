From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 15:31:38 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <alpine.DEB.2.21.2009141731030.17999@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
 <alpine.DEB.2.21.2009141615020.17999@felia>
 <f511570405799df421397ff65847e927745dad08.camel@infradead.org>
 <alpine.DEB.2.21.2009141717470.17999@felia>
 <bc5ba52bb0c123d0ed038e5dce9474f27ac2f750.camel@infradead.org>
In-Reply-To: <bc5ba52bb0c123d0ed038e5dce9474f27ac2f750.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>



On Mon, 14 Sep 2020, David Woodhouse wrote:

> On Mon, 2020-09-14 at 17:23 +0200, Lukas Bulwahn wrote:
> > >  # /usr/lib/mailman/bin/config_list -o- linux-mediatek | grep -B5 ^generic_nonmember_action
> > > # legal values are:
> > > #    0 = "Accept"
> > > #    1 = "Hold"
> > > #    2 = "Reject"
> > > #    3 = "Discard"
> > > generic_nonmember_action = 0
> >
> > David, I guess if you have access to the ground truth on 
> > lists.infradead.org, maybe you can dump the actual setting for all those 
> > lists?
> 
> ath10k:generic_nonmember_action = 0
> ath11k:generic_nonmember_action = 0
> b43-dev:generic_nonmember_action = 0
> kexec:generic_nonmember_action = 0
> libertas-dev:generic_nonmember_action = 0
> linux-afs:generic_nonmember_action = 0
> linux-amlogic:generic_nonmember_action = 0
> linux-arm-kernel:generic_nonmember_action = 0
> linux-geode:generic_nonmember_action = 1
> linux-i3c:generic_nonmember_action = 1
> linux-mediatek:generic_nonmember_action = 0
> linux-mtd:generic_nonmember_action = 0
> linux-nvme:generic_nonmember_action = 0
> linux-parport:generic_nonmember_action = 1
> linux-realtek-soc:generic_nonmember_action = 1
> linux-riscv:generic_nonmember_action = 0
> linux-rockchip:generic_nonmember_action = 0
> linux-rpi-kernel:generic_nonmember_action = 0
> linux-snps-arc:generic_nonmember_action = 0
> linux-um:generic_nonmember_action = 0
> linux-unisoc:generic_nonmember_action = 1
> wcn36xx:generic_nonmember_action = 0
> 

Thanks, I will provide a suitable patch for MAINTAINERS.

Lukas
