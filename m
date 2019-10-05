From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 05 Oct 2019 17:00:22 +0000
Subject: Re: [PATCH] mwifiex: pcie: Fix memory leak in mwifiex_pcie_init_evt_ring
Message-Id: <0bbe35aa-dddb-a3b6-bdeb-c54322f3efc3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004201649.25087-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191004201649.25087-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Amitkumar Karwar <amitkarwar@gmail.com>, "David S. Miller" <davem@davemloft.net>, Ganapathi Bhat <gbhat@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, Nishant Sarmukadam <nishants@marvell.com>, Xinming Hu <huxinming820@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> In mwifiex_pcie_init_evt_ring, a new skb is allocated which should be
> released if mwifiex_map_pci_memory() fails. The release for skb and
> card->evtbd_ring_vbase is added.

Please improve also this change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idNa655343ce4180fe9b2c7ec8cb8ef9884a47901#n151

Regards,
Markus
