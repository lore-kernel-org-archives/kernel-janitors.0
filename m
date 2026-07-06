Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DF23B5821;
	Mon,  6 Jul 2026 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334430; cv=none; b=g8sir4wOYkWMSm5W2/pXnl02QN7+1oZCCtKAVMpqfJ6vpNdQZxC8EyOsQnHDXFnyB374Pra1TDvuI4V1SKs2VR53PUYtMwhSdqqrsn6HG8uvI2gceZywl3HOR6uF25E90ECeOHFOlfnXWYHFWmIkUDdAEWhKWjkE5C8+n6iFUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334430; c=relaxed/simple;
	bh=gLqR/y0zG/97t6DOj0SteHHmSrNECKRYRAB22kZ6hv4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lCaob2FDaDxDr00hXkB1zg3MesnuBCi9RxhZNUeIFWwbgf0LlNx00LYza9OH76ypidxOE7lzy0tOt2XOjLr1fl4z8khImi2vV+7t7MFuOfcF+ueOhtxw1WqGN/Wilb3a2F4NN4CQRUhXZ862dBcNU6fqFz+QPSIj0/tBifjT5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=k46AxW4b; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="k46AxW4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783334411; x=1783939211; i=markus.elfring@web.de;
	bh=ul5AJDTYA7aLNwXWzGmKwSKEDzMH7D/FAfxASkHiZHY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k46AxW4b74+dGsGZGXG5BhtDMcJ3zal0RKPj8FoqCYvya9ee8X87lOs7/DHJsgYn
	 txBJ0MDaY/ZxkuzTxrWCCLgExLO8/G72DuLRiCkpACnZSrRUMBDqzBMsByk3cs/qk
	 bBD/75cUtu5JpnAetpNI2y4+yFd5nBxT3val2OBDVXI7RiQq1QU94nr/W5lCvFaef
	 dMBDvKbqUVjWXdmA2W8aRcgkE74oUB90vmIie9+7NEJJuFq4ir2qTgT0j/V1EsE29
	 I3xiF8WNMzO22YjuKiJVuKV5dNXfUIAVmUz9EX2dLqjUpLNGfJGyL/QRPncIkUfRa
	 4bzrD+6VjwrH9Y6dSg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M4KJX-1wgPlL3SqH-001EX3; Mon, 06
 Jul 2026 12:40:10 +0200
Message-ID: <f47abd6e-9337-404c-a24f-39a9dd7454d2@web.de>
Date: Mon, 6 Jul 2026 12:40:09 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] soc: fsl: dpio: Use scope-based resource management in
 dpaa2_io_create()
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <chleroy@kernel.org>, Roy Pledge <Roy.Pledge@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BgikFvy0UCxadnIWbi7Ro86BGCmLYEw6oPOqX+iYeIvp3uyEjkX
 iMz4VhaUg4JaFZoKx1lJgD+2vz8LxUbNXpA6uFktC8zrP+4+gSZCavHu2HlIA0wvnp2abUu
 xtc+PBTFF/wabDIv4n1KcNDGNfuVdyV/M51Ec8y//BWLITEAWgt6Q7/Ht+/VlUoLMkJ9AY+
 Ohfqp9rRIFduMIN3F1gXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QFnAfYh4y5I=;XCPEtS3zi7cAjoI5k3rCQtI1c0V
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 6 Jul 2026 11:18:39 +0200

Scope-based resource management became supported for some
programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
Introduce __cleanup() based infrastructure").

* Thus use the attribute =E2=80=9C__free(kfree)=E2=80=9D.

* Omit two kfree() calls accordingly.

* Reduce the scopes for the local variables =E2=80=9Cobj=E2=80=9D
  and =E2=80=9Cqman_256_cycles_per_ns=E2=80=9D.

* Use the macro call =E2=80=9Creturn_ptr(obj)=E2=80=9D at the end.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/soc/fsl/dpio/dpio-service.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dp=
io-service.c
index b252c3c7fa65..80fb11206160 100644
=2D-- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -133,17 +133,14 @@ static void dpaa2_io_dim_work(struct work_struct *w)
 struct dpaa2_io *dpaa2_io_create(const struct dpaa2_io_desc *desc,
 				 struct device *dev)
 {
-	struct dpaa2_io *obj =3D kmalloc_obj(*obj);
-	u32 qman_256_cycles_per_ns;
-
-	if (!obj)
+	/* check if CPU is out of range (-1 means any cpu) */
+	if (desc->cpu !=3D DPAA2_IO_ANY_CPU && desc->cpu >=3D num_possible_cpus(=
))
 		return NULL;
=20
-	/* check if CPU is out of range (-1 means any cpu) */
-	if (desc->cpu !=3D DPAA2_IO_ANY_CPU && desc->cpu >=3D num_possible_cpus(=
)) {
-		kfree(obj);
+	struct dpaa2_io *obj __free(kfree) =3D kmalloc_obj(*obj);
+
+	if (!obj)
 		return NULL;
-	}
=20
 	obj->dpio_desc =3D *desc;
 	obj->swp_desc.cena_bar =3D obj->dpio_desc.regs_cena;
@@ -155,14 +152,11 @@ struct dpaa2_io *dpaa2_io_create(const struct dpaa2_=
io_desc *desc,
 	 * the interrupt timeout period register needs to be specified in QBMAN
 	 * clock cycles in increments of 256.
 	 */
-	qman_256_cycles_per_ns =3D 256000 / (obj->swp_desc.qman_clk / 1000000);
+	u32 qman_256_cycles_per_ns =3D 256000 / (obj->swp_desc.qman_clk / 100000=
0);
 	obj->swp_desc.qman_256_cycles_per_ns =3D qman_256_cycles_per_ns;
 	obj->swp =3D qbman_swp_init(&obj->swp_desc);
-
-	if (!obj->swp) {
-		kfree(obj);
+	if (!obj->swp)
 		return NULL;
-	}
=20
 	INIT_LIST_HEAD(&obj->node);
 	spin_lock_init(&obj->lock_mgmt_cmd);
@@ -191,7 +185,7 @@ struct dpaa2_io *dpaa2_io_create(const struct dpaa2_io=
_desc *desc,
 	obj->bytes =3D 0;
 	obj->frames =3D 0;
=20
-	return obj;
+	return_ptr(obj);
 }
=20
 /**
=2D-=20
2.54.0

