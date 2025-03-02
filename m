Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2E51E47AD
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740927583; cv=none; b=EFg60hr1Gxp0DjPo4ReQ+DKHyL+Y8fCbI6am3K7fjsrSocpli4I59nb8YynA/sTrYPSf6pJeA8EzqBF2Gavu6JbYyhhgQHjBqMxZ+0W8Eu+J4anb3hgFDwvpDXgYi0kBzBLKUnkJlGBRhM4aUY3RbC42cOCA4eiXa+wGky+ogIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740927583; c=relaxed/simple;
	bh=dEP2cqeSMCkQOUObe5v/f+NSjsWbqaiovk6XDkqA1Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JifHEX1wzSXRUIm5ZdWS04ha3cQN1Oi/i7+lY2C2uDV93tqzEilOW1LSGv7+1zCvYSlModYj8TW06TqXs07ROsOwjF7eSJnv74uRAE+UfLOb4Gcoq15Ks8eMLuoZ1bzMTkqK6j9RHuK+c7jmh0SpkRRcMXvskYJ/3ylT8TnxB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Dx0/ybMq; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Dx0/ybMq"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id okmqtJVk70yWRokn6t9OJ1; Sun, 02 Mar 2025 15:59:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740927581;
	bh=KMpJ1cgSZnZMApMOU4s4omcRGFI4bQ1HNYVgjZASNXo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Dx0/ybMqwXj8mbrXBHEK6pjr9gGi0LI4qtj1udzo9LebLiYUEKhR/IgPOG24dEoDK
	 NOIYY2bkElFeMi2bSqs4/EFCCw/gpEQ3g1jT6Mb2xQlxMZmBTGo0Ofu5OtDD1y6w4C
	 fEcfOBYRKV53Ji6SqTgbCSGVyshsgKXRCJVBEXY9Ycj719ran9PVo92lb6wJig9xPW
	 6rVY+E5CHdfrG0/yl95P6J9CbGOrOmcQqF60QKIHFOuQza5S/xR2vKmw9v2Jf/rc/A
	 JxRFbkpP0e1ORq8zuo0i+vRnEFfBKWtIpQ1e6bd6Vdj9w4b5x4A97CsoVm7HcNpzwm
	 m8aS0h8jNJxyw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 15:59:41 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] powerpc: gpio_mdio: Use devm_of_mdiobus_register()
Date: Sun,  2 Mar 2025 15:59:16 +0100
Message-ID: <639cf94e5b5f0f9532b65a34844165b889934d52.1740926808.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
References: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_of_mdiobus_register() in order to remove the now empty .remove()
function.

Doing so dev_set_drvdata() is now also unneeded. Remove it as well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.
---
 arch/powerpc/platforms/pasemi/gpio_mdio.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index 2c54f5f063b7..6712ccb84c0a 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -234,10 +234,8 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	priv->mdio_pin = *prop;
 
 	new_bus->parent = dev;
-	dev_set_drvdata(dev, new_bus);
-
-	err = of_mdiobus_register(new_bus, np);
 
+	err = devm_of_mdiobus_register(dev, new_bus, np);
 	if (err != 0) {
 		pr_err("%s: Cannot register as MDIO bus, err %d\n",
 				new_bus->name, err);
@@ -247,16 +245,6 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-
-static void gpio_mdio_remove(struct platform_device *dev)
-{
-	struct mii_bus *bus = dev_get_drvdata(&dev->dev);
-
-	mdiobus_unregister(bus);
-
-	dev_set_drvdata(&dev->dev, NULL);
-}
-
 static const struct of_device_id gpio_mdio_match[] =
 {
 	{
@@ -269,7 +257,6 @@ MODULE_DEVICE_TABLE(of, gpio_mdio_match);
 static struct platform_driver gpio_mdio_driver =
 {
 	.probe		= gpio_mdio_probe,
-	.remove		= gpio_mdio_remove,
 	.driver = {
 		.name = "gpio-mdio-bitbang",
 		.of_match_table = gpio_mdio_match,
-- 
2.48.1

