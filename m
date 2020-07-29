From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Jul 2020 07:49:51 +0000
Subject: Re: [PATCH] net: nixge: fix potential memory leak in nixge_probe()
Message-Id: <81c16524-29f0-4331-5843-9b2e2c0ee22e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lu Wei <luwei32@huawei.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alex Williams <alex.williams@ni.com>, Andrew Lunn <andrew@lunn.ch>, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Moritz Fischer <mdf@kernel.org>, Yunjian Wang <wangyunjian@huawei.com>

> If some processes in nixge_probe() fail, free_netdev(dev)
> needs to be called to aviod a memory leak.

* Would you like to avoid a typo in this change description?

* An imperative wording can be preferred here, can't it?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idka1b005ffc388c2aeaddae20da29e4810dea298#n151

Regards,
Markus
