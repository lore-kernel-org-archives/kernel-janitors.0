From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 09 Oct 2015 17:47:39 +0000
Subject: [PATCH 0/2] delete unneeded of_node_put
Message-Id: <1444412861-2580-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

for_each_child_of_node performs an of_node_put on each iteration, so
putting an of_node_put before a continue results in a double put.

---

 var/julia/linuxcopy/drivers/clk/tegra/clk-emc.c         |    4 +---
 var/julia/linuxcopy/drivers/memory/tegra/mc.c           |    4 +---
 var/julia/linuxcopy/drivers/memory/tegra/tegra124-emc.c |    4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)
