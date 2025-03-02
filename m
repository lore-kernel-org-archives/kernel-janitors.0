Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6681E47AD
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740927580; cv=none; b=f3Hd0DAVDA26cyGF7LKoE+260RqKB/KVY1wZIyOGAdezYZssrg3iyQSJ1PPFTbL7GMdDo309Gj8uOvjvx1PZYD5xvsqQ+hkzif8EBqbjjd1h1LMT8UIi9lKjE/a9yXd/BBsGScXNG7sP2RtmTa2KjjVlkiKpRLR65mQmVL3HQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740927580; c=relaxed/simple;
	bh=vG5djXaFhKK3CzDRSFtUV0aHIyTlukv5vBOR74eFVik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxpGzphTET3fm4iVt63Blw+7aJ2IwtcbmUISAFbWYMynGB9WZZN1l2VYOyWne35bHJskp+VO03xI1arMm4NjIeykK4vG0L4SgecTIguf10tOW/NP01/xjvSxFXXYaVhlzz6by+iGjLzVvqv4FjG7zWUA1ECetvydjJ89bXZF3V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=N5rXtFnP; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="N5rXtFnP"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id okmqtJVk70yWRokmut9O82; Sun, 02 Mar 2025 15:59:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740927569;
	bh=CHITz2+YWVCqZNH8zM0mCk4OaRmTsJ9xq+F0/7AL1r0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=N5rXtFnPdciX4yYY/+OAbDtQWCPVFXb0Q7ZwJp8RQBxYKLhiMBfbZELmQBspi2cz1
	 UQfhmOdjvcCKk8TTVQw3QfKhcIjwpXFb15L44d4zDcZYuBJTEK7MFXW2pCFKjXAzEe
	 cKfqVLg6T7j+bKTKCacfO0894mvXRItoyqSZ1g1o9VfvgmqHCef9O9EUCkv+Orl6Tu
	 kPikree9OBxPQRsJkIMX31J6B4IZUIQWWkmEb0fDkWhYRi8rUCNLBZ2LG4lbPcRT1S
	 7XITGjy/ij66aTeP0D4yYEFD8PvqSHCBm+EEM8FpQBDp/8wCUKI6iMIACeYJh0ei05
	 BGeJgUR0rJwkQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 15:59:29 +0100
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
Subject: [PATCH 0/2] powerpc: gpio_mdio: Simplify gpio_mdio_probe()
Date: Sun,  2 Mar 2025 15:59:14 +0100
Message-ID: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While wondering if it was correct to call mdiobus_free() in the remove
function and only kfree() in the error handling of the probe, I
arrived at the conclusion that the code could be simpler here.

Patch 1 uses mdiobus_alloc_size() instead of a hand written
mdiobus_alloc() + kzalloc(). it also uses the devm_ version in order to
save some LoC (and answer my initial question)

Patch 2 uses devm_of_mdiobus_register() to completly remove the .remove()
function and save some more LoC.

Both patches are compile tested only.

Christophe JAILLET (2):
  powerpc: gpio_mdio: Use devm_mdiobus_alloc_size()
  powerpc: gpio_mdio: Use devm_of_mdiobus_register()

 arch/powerpc/platforms/pasemi/gpio_mdio.c | 41 ++++-------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

-- 
2.48.1

