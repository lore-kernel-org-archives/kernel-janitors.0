From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 29 Oct 2019 09:40:56 +0000
Subject: Re: phy: tegra: xusb: Complete exception handling in probe functions
Message-Id: <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
In-Reply-To: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-tegra@vger.kernel.org, JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Thierry Reding <treding@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Coccinelle <cocci@systeme.lip6.fr>

> I have got the impression then that the exception handling is incomplete so far
> at these source code places.

How do you think about to try the following small script for the semantic patch
language out on the directory “drivers/phy/tegra”?

@display@
expression object;
identifier exit;
@@
 ... when any
 object = kzalloc(...)
 ...
 if (...)
 {
*kfree(object);
 goto exit;
 }
 ...
 if (...)
*   goto unregister;


Will any search pattern variations become more interesting for corresponding
automatic software transformations?

Regards,
Markus
