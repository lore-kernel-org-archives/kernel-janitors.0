From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 30 Oct 2019 10:44:26 +0000
Subject: Re: drivers/phy/tegra: Completion for exception handling in probe functions with SmPL?
Message-Id: <161bbb97-09d9-f128-bd25-ef9348534144@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
 <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
In-Reply-To: <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-tegra@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, YueHaibing <yuehaibing@huawei.com>, JC Kuo <jckuo@nvidia.com>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

> Will any search pattern variations become more interesting for corresponding
> automatic software transformations?

I hoped to achieve something together with the semantic patch language
by the following transformation approach.

@adjustment@
expression object;
identifier exit;
@@
 object = kzalloc(...)
 ...
 if (...)
-{  kfree(object);
    goto
-        exit
+        release_memory
    ;
-}
 ... when any
 device_unregister(...);
-exit
+release_memory
 :
+kfree(object);
 return ERR_PTR(...);


Do you find such a change suggestion reasonable (in principle)?

But I stumble on another unexpected test result.

elfring@Sonne:~/Projekte/Linux/next-patched> spatch drivers/phy/tegra/xusb-tegra186.c ~/Projekte/Coccinelle/janitor/complete_exception_handling_in_probe_functions1.cocci
init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
HANDLING: drivers/phy/tegra/xusb-tegra186.c


How would you like to clarify why diff hunks were not generated
for functions like “tegra186_usb2_pad_probe” and “tegra186_usb3_pad_probe”
in such an use case?
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/phy/tegra/xusb-tegra186.c#L445
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/tegra/xusb-tegra186.c?id=bbf711682cd570697086e88388a2c718da918894#n445

Regards,
Markus
