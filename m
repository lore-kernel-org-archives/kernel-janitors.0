From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 30 Oct 2019 20:50:17 +0000
Subject: Re: drivers/phy/tegra: Completion for exception handling in probe functions with SmPL?
Message-Id: <205e2b3a-2934-f5d0-6b12-59beee0d58fa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fe6868a4-01f5-2832-9081-7643be0ab4a1@web.de>
 <3e3f40db-2422-c64d-3825-35f8c2471eb7@web.de>
 <161bbb97-09d9-f128-bd25-ef9348534144@web.de>
In-Reply-To: <161bbb97-09d9-f128-bd25-ef9348534144@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-tegra@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, YueHaibing <yuehaibing@huawei.com>, JC Kuo <jckuo@nvidia.com>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

> But I stumble on another unexpected test result.

I got more promising results by the following transformation approach.

@adjustment exists@
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


The scope property of such a SmPL rule occasionally needs also more
software development attention.
https://github.com/coccinelle/coccinelle/blob/ed1eb8e06f800739d3992158d36945c0c4c6f0c7/docs/manual/cocci_syntax.tex#L860

I observe that the pretty-printing for the generated source code will need
further improvements (according to the Linux coding style).

Example:

elfring@Sonne:~/Projekte/Linux/next-patched> spatch drivers/phy/tegra/xusb-tegra186.c ~/Projekte/Coccinelle/janitor/complete_exception_handling_in_probe_functions6.cocci
…
@@ -461,10 +461,8 @@ tegra186_usb2_pad_probe(struct tegra_xus
 	pad->soc = soc;

 	err = tegra_xusb_pad_init(pad, padctl, np);
-	if (err < 0) {
-		kfree(usb2);
-		goto out;
-	}
+	if (err < 0)
+		goto release_memory;

 	priv->usb2_trk_clk = devm_clk_get(&pad->dev, "trk");
 	if (IS_ERR(priv->usb2_trk_clk)) {
@@ -483,7 +481,8 @@ tegra186_usb2_pad_probe(struct tegra_xus

 unregister:
 	device_unregister(&pad->dev);
-out:
+release_memory :
+kfree(usb2);
 	return ERR_PTR(err);
 }
…


How reasonable do you find the presented update suggestion?

Regards,
Markus
