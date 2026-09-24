Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD39422533;
	Thu, 24 Sep 2026 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234254; cv=none; b=YrfFsZsa3fvpuFcvTsM9A7M7CuMSZF74qTSZz3Cqfs2vhhfk0f926HFrIA1qaH6vjDTDGxUBlg7jbhjErkLtK7GeaKDukXspJdC9m/CLAD7EMta7uxGCgKGybmWC1ezgzh2V8uWS/aNfu1V0TZ9iauVwFhoxCmL6jC6fil1cYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234254; c=relaxed/simple;
	bh=qXcS9oLAZKB6olEYpMZDyG1dstmpAwZ4Bxdqnh70MdI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mEEb6ojAt4OqpRBPkVW7zf43jB+A53GS3x/mgbYZ2gviUMoRp8iwzikXl518Li90/n54x9X8VKem8UgV1iD7If87+RaqPTWS+Kr2GTiZ+vQH9C2XVnVSECpzQh1p+Xtzv989eNwl90QCMo43ll6bahpoTMo7WbyvLkC/IT2tdPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=nsN52tMa; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="nsN52tMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790234248; x=1790839048; i=markus.elfring@web.de;
	bh=0t7YOYeSnpVlNJjWBSQP4LBSfpfHSi2gjM6NX4GmRgY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nsN52tMaqaMF2SHl7YJScNZljYStNHREhoffIOt7bWhixaj0Qb4h+1DpcfDumw6A
	 Dwb6qWvH7XShy5MU4t3g26+k00FGXLDSoNrcsU/DYN2YoZuSsnjkGDuhomSAaZ0ZK
	 n+rfEXV/YgfmAeCBFC4PvRxi3ILaRPZ2edrYBCw5O2LChiJP/tDl4c3VPpDLfM9KQ
	 LJBKa96rSkw7hdp7SG0rVQty9j15VtbnieQWx8YMRcSgGdi4JWIW33A10IGp/O2tU
	 S1aiEn0/JQ1N87In68gtC7M+TzQQ56Dfd6R2Zvr9ukBn/w7RHWKFRObBO7w6XiMhz
	 iai/GZoCHyxWCuKS+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMpCg-1xQ48C0nxs-00MjcY; Thu, 24
 Sep 2026 09:17:28 +0200
Message-ID: <7862715c-da53-49ba-9fc1-6ca5c5d39dde@web.de>
Date: Thu, 24 Sep 2026 09:17:26 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/2] soc: fsl: dpio: Use scope-based resource management in
 dpaa2_io_store_create()
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <chleroy@kernel.org>, Dan Carpenter <error27@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Roy Pledge <Roy.Pledge@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <6c08552a-49e9-4ee0-b1ba-b27e17ade9c5@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <6c08552a-49e9-4ee0-b1ba-b27e17ade9c5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+rMhZgZMkKvSzMOsFbb8Jp/BAOed9W/APFxOyOXc468CLAS1jnd
 BT1xLN0/XRLMDyWhZZUec4+7WHBJakilSSmnh8gItEsNNHCq8oyHqxm6bAIlWOJthd1nmjs
 ulcKPvXFWDu2jvCpj889joeOEn6TGVfAQs1n4lwOhoJ2xF+OXDSpzA4oDWp/HSSaCly0EXS
 CoSAn97bJ+oiGq4W1qKYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fc5/6CW58bY=;IFMcXgCiqasdJDdCJZO7rhjKwid
 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
 SpT4CFlQ0uLhXoPww==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Sep 2026 15:48:11 +0200

Scope-based resource management became supported for some
programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
Introduce __cleanup() based infrastructure").

* Move some source code from the implementation of the function
  =E2=80=9Cdpaa2_io_store_create=E2=80=9D to a new function.

* Use the attribute =E2=80=9C__free(kfree)=E2=80=9D for the local variable=
 =E2=80=9Cret=E2=80=9D.

* Omit two kfree() calls accordingly.

* Replace a return statement by the macro call =E2=80=9Creturn_ptr(ret)=E2=
=80=9D.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/soc/fsl/dpio/dpio-service.c | 49 +++++++++++++++--------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dp=
io-service.c
index 317ca50b0c2b..cb870aae30b4 100644
=2D-- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -4,6 +4,7 @@
  * Copyright 2016-2019 NXP
  *
  */
+#include <linux/cleanup.h>
 #include <linux/types.h>
 #include <linux/fsl/mc.h>
 #include <soc/fsl/dpaa2-io.h>
@@ -638,37 +639,20 @@ EXPORT_SYMBOL_GPL(dpaa2_io_service_acquire);
  * assist with parsing those results.
  */
=20
-/**
- * dpaa2_io_store_create() - Create the dma memory storage for dequeue re=
sult.
- * @max_frames: the maximum number of dequeued result for frames, must be=
 <=3D 32.
- * @dev:        the device to allow mapping/unmapping the DMAable region.
- *
- * The size of the storage is "max_frames*sizeof(struct dpaa2_dq)".
- * The 'dpaa2_io_store' returned is a DPIO service managed object.
- *
- * Return pointer to dpaa2_io_store struct for successfully created stora=
ge
- * memory, or NULL on error.
- */
-struct dpaa2_io_store *dpaa2_io_store_create(unsigned int max_frames,
-					     struct device *dev)
+static inline
+struct dpaa2_io_store *dpaa2_io_store_create_impl(unsigned int max_frames=
, struct device *dev)
 {
-	struct dpaa2_io_store *ret;
 	size_t size;
+	struct dpaa2_io_store *ret __free(kfree) =3D kmalloc_obj(*ret);
=20
-	if (!max_frames || (max_frames > 32))
-		return NULL;
-
-	ret =3D kmalloc_obj(*ret);
 	if (!ret)
 		return NULL;
=20
 	ret->max =3D max_frames;
 	size =3D max_frames * sizeof(struct dpaa2_dq) + 64;
 	ret->alloced_addr =3D kzalloc(size, GFP_KERNEL);
-	if (!ret->alloced_addr) {
-		kfree(ret);
+	if (!ret->alloced_addr)
 		return NULL;
-	}
=20
 	ret->vaddr =3D PTR_ALIGN(ret->alloced_addr, 64);
 	ret->paddr =3D dma_map_single(dev, ret->vaddr,
@@ -676,14 +660,33 @@ struct dpaa2_io_store *dpaa2_io_store_create(unsigne=
d int max_frames,
 				    DMA_FROM_DEVICE);
 	if (dma_mapping_error(dev, ret->paddr)) {
 		kfree(ret->alloced_addr);
-		kfree(ret);
 		return NULL;
 	}
=20
 	ret->idx =3D 0;
 	ret->dev =3D dev;
=20
-	return ret;
+	return_ptr(ret);
+}
+
+/**
+ * dpaa2_io_store_create() - Create the dma memory storage for dequeue re=
sult.
+ * @max_frames: the maximum number of dequeued result for frames, must be=
 <=3D 32.
+ * @dev:        the device to allow mapping/unmapping the DMAable region.
+ *
+ * The size of the storage is "max_frames*sizeof(struct dpaa2_dq)".
+ * The 'dpaa2_io_store' returned is a DPIO service managed object.
+ *
+ * Return pointer to dpaa2_io_store struct for successfully created stora=
ge
+ * memory, or NULL on error.
+ */
+struct dpaa2_io_store *dpaa2_io_store_create(unsigned int max_frames,
+					     struct device *dev)
+{
+	if (!max_frames || (max_frames > 32))
+		return NULL;
+
+	return dpaa2_io_store_create_impl(max_frames, dev);
 }
 EXPORT_SYMBOL_GPL(dpaa2_io_store_create);
=20
=2D-=20
2.55.0

