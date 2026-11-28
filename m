Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876320;
	b=LSHZdwS5Qyul74rLTww8/RHYigPupL8+Xo2UNfi7kgl9P+5HBXnzI+Rg7Orj6xaIWSNA
	 nCI9bVQPlv9d95hfkAzx2Pd11itXACqDdCJkVliGsB390i4NDX4YD0WWVARwHWRnSkSAv
	 SsH2J8Amf+OYTO2ya+7rcoEMrB8p3en2eR498nU2xOtzvr5J6Sg6IpDC3ZcyCFCp/1YXN
	 jUuX0iPTjYth4sxWEKEvck/AER+IY4p7HTwCf5wapgDstsEgx/ljEdCS/C3C621vHNmJQ
	 uc3q/ww9GPtlB2n/NokTDNY0OrkHLB3VhoJ0fJaUvy5HV2XHAHQggUkc/oELEPTGWgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876320;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wHEpWiTKlcV7eo5kxboULZbcV5KCmM/FnbLliE7J2KM=;
	b=q+WmOgxbVw/n5SIpkcQK1RMDvCUfNCEkpCBZgYQfZBUhd4w24d2Eqri7MMSAT6POf130
	 UP+692Xx/i55sNdP2MC67ykaYvckek7pjtCuAqXa748Nf12rlU0fAbUenJeE5o1LmOWMJ
	 v9dQpH0RWZgLtKNRnupqWAgEGYfvlaHenPAzSwp6Bi4wCw2o5aLF7hiWQopo2hv33/l0y
	 xQbYKyQSyvRKh289yZyyHIX/uOSUfJDmrNoEkKB0qRM0tzqyghnI0C5B6W8ZyKGH1cETp
	 n8KVELOjcLBaeVbe6WfG5KMWmtRXfTxxwqakJ11+3m2Ui4XYwD12XL2GSXcGCz4NUKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZFYp9oI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22815606A31C;
	Sat, 28 Nov 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZFYp9oI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9D61F00893;
	Sat, 28 Nov 2026 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795876319;
	bh=wHEpWiTKlcV7eo5kxboULZbcV5KCmM/FnbLliE7J2KM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mZFYp9oIAFmV4r2TVx43nKEtLOVyzUabzl2WzioGz3lhQ6ECnaA7VbktItznfMZJa
	 2dwgw5YVVz2waiIhujS6Jn3RfG+zKcU3cK1K85ekyLs2BKr7fJSv9VB+pgVoYGgXmM
	 sDZKjwnpXm/EkqVXQqfVAARgReTElkoDDMNQt7j4/NJiYfXBl9khlBHt4mY6UGekx9
	 BuDTyUmsxT1dSDJbZCFFUUhs+ta41g6X2U3sM7MrHusJDgYXOmJdMrrZEMguJyeaPX
	 qKsd3jPNFUFSWeIddaaEoEC2iUIgNbCw7kbZTAJPuWCaTlCWRb8EV7oLMhIE5X2/Pm
	 an/ND/jhjoxeg==
Subject: Re: [PATCH net v2 1/2] bcm63xx_enet: Prevent unbalanced
 clk_disable_unprepare() call in bcm_enet_remove()
From: netdev-bot+sashiko@kernel.org
To: Markus.Elfring@web.de
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, hemanth.selam@gmail.com, kuba@kernel.org,
 jonas.gorski@gmail.com, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, christophe.jaillet@wanadoo.fr,
 f.fainelli@gmail.com, Frank.Li@kernel.org, Julia.Lawall@inria.fr
Date: Sat, 28 Nov 2026 14:31:58 +0000
Message-ID: <179587631846.3135.16815258842003970286@kernel.org>
In-Reply-To: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
References: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes a bug that does not exist, but carries Fixes:
  and Cc: stable tags.
- [Low] The patch guards clk_disable_unprepare(priv->phy_clk) in
  bcm_enet_remove() but leaves the identical unconditional call at the…
- [Low] In bcm_enet_remove() the patch moves
  clk_disable_unprepare(priv->phy_clk) ahead of…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is in the
  same probe/remove pair and survives the whole series.

--

bcm63xx_enet: Prevent unbalanced clk_disable_unprepare() call in bcm_enet_remove()

This patch moves clk_disable_unprepare(priv->phy_clk) in bcm_enet_remove()
into the has_phy branch and guards it with !priv->use_external_mii. That
matches the condition under which bcm_enet_probe() enables the clock. The
patch has a Fixes: tag for commit 7e697ce99ceb and is marked for stable.

> A clk_prepare_enable(priv->phy_clk) call was specified within an if branch
> in the implementation of the function “bcm_enet_probe” while
> a clk_disable_unprepare(priv->phy_clk) call was unconditionally performed
> in the implementation of the function “bcm_enet_remove”.
> Move this clk_disable_unprepare() call into a corresponding if branch.
>
> Fixes: 7e697ce99ceb09538cdc1dfa9ebb3db60236b0a7 ("bcm63xx_enet: use managed functions for clock/ioremap")
> Cc: stable@vger.kernel.org

[Severity: Medium]
Is the unconditional call actually unbalanced?

bcm_enet_probe() only sets priv->phy_clk inside the branch that also
enables it. If devm_clk_get() fails, it resets the pointer to NULL:

	if (priv->has_phy && !priv->use_external_mii) {
		/* using internal PHY, enable clock */
		priv->phy_clk = devm_clk_get(&pdev->dev, "ephy");
		if (IS_ERR(priv->phy_clk)) {
			ret = PTR_ERR(priv->phy_clk);
			priv->phy_clk = NULL;
			goto out_disable_clk_mac;
		}
		ret = clk_prepare_enable(priv->phy_clk);
		...
	}

In every other case phy_clk stays NULL, because the netdev priv area is
zero-allocated.

BCM63XX_ENET depends on BCM63XX, which uses the legacy clock code in
arch/mips/bcm63xx/clk.c. Its clk_disable() returns early for NULL:

arch/mips/bcm63xx/clk.c:clk_disable() {
	if (!clk)
		return;
	...
}

clk_unprepare() is the inline stub in include/linux/clk.h, and it only
calls might_sleep(). So the old unconditional call did nothing whenever
the clock had not been enabled.

This looks intentional. Commit 4e78e5c5d881 ("bcm63xx_enet: drop unneeded
NULL phy_clk check") removed the earlier guard because "clk_disable and
clk_unprepare are NULL-safe".

The Fixes: target also doesn't seem to match. After 7e697ce99ceb,
bcm_enet_remove() still had the guard:

	if (priv->phy_clk)
		clk_disable_unprepare(priv->phy_clk);

Nothing changes after the later patch in the series ("bcm63xx_enet: Use
devm_clk_get_enabled() in two probe functions") either.

This patch doesn't change runtime behavior. Should the Fixes: and Cc:
stable tags be dropped, and the change described as a cleanup instead of
a fix?

> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> index f6595fdc888d1..cc9a5cd2a2a3f 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1915,6 +1915,9 @@ static void bcm_enet_remove(struct platform_device *pdev)
>  	enet_writel(priv, 0, ENET_MIISC_REG);
>  
>  	if (priv->has_phy) {
> +		if (!priv->use_external_mii)
> +			clk_disable_unprepare(priv->phy_clk);
> +
>  		mdiobus_unregister(priv->mii_bus);
>  		mdiobus_free(priv->mii_bus);

[Severity: Low]
Was it intended to move the EPHY clock disable ahead of
mdiobus_unregister() and mdiobus_free()?

Probe enables mac_clk, then phy_clk, and then registers the MDIO bus.
The probe error path in bcm_enet_probe() still undoes these in reverse
order:

out_unregister_mdio:
	if (priv->mii_bus)
		mdiobus_unregister(priv->mii_bus);

out_free_mdio:
	if (priv->mii_bus)
		mdiobus_free(priv->mii_bus);

out_uninit_hw:
	/* turn off mdc clock */
	enet_writel(priv, 0, ENET_MIISC_REG);
	clk_disable_unprepare(priv->phy_clk);

I couldn't find a concrete failure caused by the reorder:

- unregister_netdev() has already disconnected the PHY in ndo_stop.
- MDC is already turned off.
- The bcm63xx internal PHY driver has no .remove callback, so
  mdiobus_unregister() does no MDIO access here.

Still, disabling the clock after the MDIO teardown would keep remove()
as the exact reverse of probe.

> @@ -1927,7 +1930,6 @@ static void bcm_enet_remove(struct platform_device *pdev)
>  	}
>  
>  	/* disable hw block clocks */
> -	clk_disable_unprepare(priv->phy_clk);
>  	clk_disable_unprepare(priv->mac_clk);

[Severity: Low]
If the unconditional call here were a problem, wouldn't the same apply to
the out_uninit_hw label in bcm_enet_probe()? This patch leaves it
unchanged:

out_uninit_hw:
	/* turn off mdc clock */
	enet_writel(priv, 0, ENET_MIISC_REG);
	clk_disable_unprepare(priv->phy_clk);

That label can be reached without phy_clk ever being enabled:

- has_phy == 0 and pd->mii_config() fails.
- An external PHY is used and mdiobus_alloc(), mdiobus_register() or
  register_netdev() fails.

Both calls are NULL-safe, so this has no functional effect. But the two
teardown sites for the same clock now follow different conventions, and
the later devm_clk_get_enabled() patch keeps the unconditional call in
out_uninit_hw.

Should the remove-side change be dropped, or should both sites be
handled the same way?

>  
>  	free_netdev(dev);

[Severity: High]
This is a pre-existing issue, but it is in the same probe/remove pair.
In bcm_enet_probe(), when has_phy == 0 and pd->mii_config(dev, 1, ...)
fails:

		if (pd && pd->mii_config &&
		    pd->mii_config(dev, 1, bcm_enet_mdio_read_mii,
				   bcm_enet_mdio_write_mii)) {
			dev_err(&pdev->dev, "unable to configure mdio bus\n");
			goto out_uninit_hw;
		}

ret is not set on this path. Its last value came from
clk_prepare_enable(priv->mac_clk), which is 0. After the later patch in
the series it comes from bcm_enet_change_mtu(), also 0. So probe calls
free_netdev() and returns 0 without ever calling platform_set_drvdata().

On unbind or module removal, bcm_enet_remove() then runs with
dev == NULL:

	dev = platform_get_drvdata(pdev);
	priv = netdev_priv(dev);
	unregister_netdev(dev);

Can this oops in unregister_netdev(NULL)->rtnl_net_dev_lock()->dev_net()?

No in-tree board file sets mii_config, so this path needs out-of-tree
platform code.

Should ret be set to the return value of mii_config(), or to a negative
errno, before the goto?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/0302adc3-dbf2-4e62-ac9b-8923ac285506%40web.de
