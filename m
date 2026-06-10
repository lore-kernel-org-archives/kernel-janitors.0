Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70314390CAB;
	Wed, 10 Jun 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082228; cv=none; b=M/tY/ytJ4E7+tPUv8+RSKosBYGo2rv6GK1WvQ0QDWfFE2ENk4Lgk/Q/6w9Qf00LIfZuYrDtwpZJV981KH1EfZF93THkWw2hqjd+NZ/LFeS5YQfwO3H/bF5HMH8MBn4V2aNws76fzgclonoKWus4EAnqfawM5gVu88g6drFUdLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082228; c=relaxed/simple;
	bh=ZzQqgpGO7X+xo8c0bUKpMHF1PiDU+bTXQKZx3T0PDUM=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=iQz/w2+czgZ/sg4a/+cTPrp/DIcKmnvOcqEeqzNFEe0i2R2CFWbznjd8EK4exDjDSCp1crTefdeDlPFK2qhQ3CitxmT73OMKOoeLSvjW9QzEyfVlOyJtFXCYRzX/Bh3ZnhqYrDTgEVD51TaEVx/0THJah3iFnOeGJ3MCjo9onj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=OSyXXD+a; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="OSyXXD+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781082214; x=1781687014; i=markus.elfring@web.de;
	bh=axcZCRRhVgWj7aSzXs8AgsiWX1yul5QcLYGpZV+D3jo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OSyXXD+ao62vVwg1APUYiaeWjy5FfScjo4dblxcCOH5r+AwIX+xalSaiEeg0lrNi
	 IQwvveLe1iJnOI/zyJu28oMv3rolQUKZ8z5/5bBni6XDFhR61KvpGR3OtFJdM2kMQ
	 /RcDZ3wgWeE/7EgEj86u1GzNul6kd2jfhu5OGWRCtb95aqHBvcsTRlkVpNRiFUSVd
	 RMlH8ZFj9zQKyLuXPXMCFThEuGbjXlIblcUJ75hq6Z/hkfuQvwqWtl37x2Wb+OEeO
	 i28WDI6n3JAnG47WQi1R6Yc6THHk1gqBPmtVM7NeXKzZeB5+NKbJtk6eV1KiARHvV
	 2q6zs0mWUfK325l6Wg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1d3k-1xDCPe2Qu0-00uf6n; Wed, 10
 Jun 2026 11:03:34 +0200
Message-ID: <355b018a-7881-469a-9b6a-b11d2e944c89@web.de>
Date: Wed, 10 Jun 2026 11:03:31 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sound@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] soundwire: intel: Use common error handling code in
 sdw_intel_probe_controller()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BSxJz7HkJPzaeNI58yx7EzCDrp8AfgEXgk08tn4qvNR9wWYR3KZ
 IG7QfuVcZpj458dlvajwCy+zqIszJWTqey+8rpE3hcaWRqKiv5euGiMaQmMJRTK35WUaKdW
 7Nx+5snjxJ0Jkewd7scMXu7X8rd0ob8XMPqSjfCiJWZznZGS12uYSXBbmuO4APBVkYA2FnK
 Y5ntFRjn28RJYCa1FBYeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uv9IR897oeA=;4qGC4WOcL3iNMtPSOuvgvzrWOd8
 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
 LwVz7u0tqE9B6/7wiceopRIe/5w=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 10:56:23 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/soundwire/intel_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init=
.c
index ad48d67fa935..8eaf62dabe55 100644
=2D-- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -199,10 +199,8 @@ static struct sdw_intel_ctx
 	 * number of links is small, this is simpler than using a list to keep t=
rack of links.
 	 */
 	ctx->ldev =3D kzalloc_objs(*ctx->ldev, ctx->count);
-	if (!ctx->ldev) {
-		kfree(ctx);
-		return NULL;
-	}
+	if (!ctx->ldev)
+		goto free_ctx;
=20
 	ctx->mmio_base =3D res->mmio_base;
 	ctx->shim_base =3D res->shim_base;
@@ -276,6 +274,7 @@ static struct sdw_intel_ctx
 		intel_link_dev_unregister(ldev);
 	}
 	kfree(ctx->ldev);
+free_ctx:
 	kfree(ctx);
 	return NULL;
 }
=2D-=20
2.54.0

