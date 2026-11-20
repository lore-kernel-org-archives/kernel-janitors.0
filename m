Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194146;
	b=yLcdPH/+BD1Ame52a+pJ7gssZb0w9ikdogVaIpyVLUaVIPAjJoGWMs5AO5UXRn6COTuO
	 AM6VAyLGXGkHX8OHhJlOjcFIqPIiAmyY3USXOQ+OnaeApszSLcgupJpKXrs9YMQ2REFNa
	 LE1etkMX3WBSz4o4WxYv/YbgUhS2PUCq49L0SigKQhPNsqYftNtbuQPy4ILo1PJYiHfas
	 Qh8xbsNA8oSwao8YKwGfhA1JW9aU6Va+PUCJk2VDj1mn8z90x9C+RkhFhhb6YvziU++Ek
	 yEtP9dlNDRvKSZ1mxJvp0vTvEGFuq4z2In9/Z5Y6jTkpvZjYCMpcoLxs+8WnR+Gk3rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194146;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=07oCIpupG8yXrr5ZuTvOZTkLRKl/h+AoSNLxt0pWwj0=;
	b=RyUK4uuVeFW0WC/wvNxpxayPWuIzLkXqRq1sbJoOJJ5EG443XkTWAQs3N5Yaur3kNlo/
	 4g3ACEBjSVjFzOJSaPdbL9YoEJBG2M1WYQFLddfk3ZKutOraR26nFiRXAV2iUjxg3gmrf
	 3dpkeiGzA0agxPTVujQDDBNztI9JjTYrPj0sh/PaC3dL5HOq+VH09grxi+CBemn68N7eM
	 YmHqjzEl4viM6anG1wmoh2OUSZW0Y3nXhG4yFQNJuSCa7QDrHUFodPPTAAtQ4OrE4Cjhs
	 i3pF2Y7KUw19lFmfMV3bXLxLLskiwIlShhwk6+Q95pMN89306w550KHLsXFivgmGD9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhU2nCnc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E8260A2604;
	Fri, 20 Nov 2026 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HhU2nCnc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D0C1F000D3;
	Fri, 20 Nov 2026 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194146;
	bh=07oCIpupG8yXrr5ZuTvOZTkLRKl/h+AoSNLxt0pWwj0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HhU2nCnclb4BgjEXKtSq12SvngbuhmoO744/60NjdEYuY6yN676NC7wnVUTCgAMKr
	 USsO/BxDUbjBLMqHbfDwQFjeuGsj9Whag05EOfTJdH5Wb8jS5q759QGoWCfGwM8y0W
	 NiP6bYEAj88Cc6tv2o59kE8pI7hsKEC+mAYD5TCON3XACHP6yhNb2CgpuBuu7IINYH
	 7ophms2SaqTXusCuHLGwurA5VBfV/ZElmV4lYsJTLCqXqk3YQd0gdYF1LGPOhBkX95
	 9ifeHNtcU9aG3xTqmFvgHLVd6VvIrTBet9HtWoa3Wtuu5k0y9bNfCY9d69iz0fFLHI
	 Z70b9OJIAMC1Q==
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
From: netdev-bot+sashiko@kernel.org
To: Markus.Elfring@web.de
Cc: netdev@vger.kernel.org, andrew@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, florian.fainelli@broadcom.com, kuba@kernel.org,
 jonas.gorski@gmail.com, pabeni@redhat.com, olteanv@gmail.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Fri, 20 Nov 2026 17:02:25 +0000
Message-ID: <179519414508.3136.7413624094290164260@kernel.org>
In-Reply-To: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch double-disables the switch clock.
- [Low] The commit message calls the change pure de-duplication ("Reuse
  existing functionality ... instead of keeping duplicate source code"),…

--

net: dsa: bcm_sf2: Use devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()

This commit converts the "sw_switch" clock lookup in bcm_sf2_sw_probe()
from devm_clk_get_optional() followed by clk_prepare_enable() to
devm_clk_get_optional_enabled(). Coccinelle generated the change.

> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.

[Severity: Low]
This isn't a bug, but does this description match what the patch does?
The conversion changes behaviour. It adds a devres-managed
clk_disable_unprepare() for priv->clk and keeps the manual disables (see
the comment on the diff below).

In the patch as submitted, bcm_sf2_sw_remove() still tears down in the
original order:

drivers/net/dsa/bcm_sf2.c:bcm_sf2_sw_remove() {
    ...
	clk_disable_unprepare(priv->clk_mdiv);
	clk_disable_unprepare(priv->clk);
	if (priv->type == BCM7278_DEVICE_ID)
		reset_control_assert(priv->rcdev);
}

So the ordering is unchanged for now. Once the manual priv->clk disables
are dropped to fix the double-disable, devres would gate the sw_switch
clock after clk_mdiv is disabled. On BCM7278 it would also gate it after
reset_control_assert().

Could a respin describe and justify that ordering change? Could it also
explain why priv->clk_mdiv stays manually managed while priv->clk is
converted?

> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
> index 1747a1f20c78e..011ce79392e8a 100644
> --- a/drivers/net/dsa/bcm_sf2.c
> +++ b/drivers/net/dsa/bcm_sf2.c
> @@ -1467,14 +1467,10 @@ static int bcm_sf2_sw_probe(struct platform_device *pdev)
>  		base++;
>  	}
>  
> -	priv->clk = devm_clk_get_optional(&pdev->dev, "sw_switch");
> +	priv->clk = devm_clk_get_optional_enabled(&pdev->dev, "sw_switch");
>  	if (IS_ERR(priv->clk))
>  		return PTR_ERR(priv->clk);
>  
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret)
> -		return ret;
> -

[Severity: High]
Is the sw_switch clock now disabled and unprepared twice?

devm_clk_get_optional_enabled() registers clk_disable_unprepare() as the
devres exit action:

drivers/clk/clk-devres.c:devm_clk_get_optional_enabled() {
	return __devm_clk_get(dev, id, clk_get_optional,
			      clk_prepare_enable, clk_disable_unprepare);
}

When devres is released, devm_clk_release() calls state->exit(state->clk).

The patch removes only the explicit clk_prepare_enable(priv->clk). The
explicit disable at the out_clk label is still there:

drivers/net/dsa/bcm_sf2.c:bcm_sf2_sw_probe() {
    ...
out_clk:
	clk_disable_unprepare(priv->clk);
	return ret;
}

So is the one in bcm_sf2_sw_remove():

	clk_disable_unprepare(priv->clk_mdiv);
	clk_disable_unprepare(priv->clk);

Every probe failure after the clock is acquired ends at out_clk. That
includes -EPROBE_DEFER from devm_clk_get_optional("sw_switch_mdiv"), so it
happens on every deferred probe retry. Unbind and module removal go
through bcm_sf2_sw_remove().

In both cases devres_release_all() runs afterwards and calls
clk_disable_unprepare() a second time.

When the sw_switch clock is present in DT, the second call would hit this
check in clk_core_disable():

	if (WARN(core->enable_count == 0, "%s already disabled\n", core->name))
		return;

It would also hit the matching "already unprepared" WARN in
clk_core_unprepare().

If the clk_core is shared with another consumer, would the extra call
drop that consumer's enable/prepare reference instead and gate a clock it
still uses?

Should clk_disable_unprepare(priv->clk) be removed from both the out_clk
path and bcm_sf2_sw_remove(), with the error labels adjusted to match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/d772ca26-d7f4-4857-9278-628b87e2252e%40web.de
