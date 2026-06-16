Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779B53D5643;
	Tue, 16 Jun 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632832; cv=none; b=RP5iMBFrnNvcbwDNPR8P8z2CqR4ozAX+AlkkO3+j2nvhVo+Ag9qC9HraBZzEydREUGrWXhI20Y1EC23Il+dC+4EJ2uBTdusC6Hgk1I0s7ycOE7Np4XbKajremJWl+cqB1wA5wL4mNZWCJ0Uh6+v3jZc9YXlymYoU42m4qxDyEi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632832; c=relaxed/simple;
	bh=zdBKHXWEgGIUE86QTAzp1EzLyu+ez4sxNXXQ3aWb9iI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ERT9Nfx2gJ/vpvPrBWbP3J2ECapoPHnNHj7M0Davov48NOJs5UlGU0pzRcKQu8rzKrDZJ3Q9BO+QA6La3FwEYkqgwmmvwQlefK1l3WOLBhwj/KCBnI+RCdT/Vtx/HBghG+oNVga36Q8GzwFmpyOBdXo2xFivqpJmweNNTSwYmq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ArzpMYEe; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ArzpMYEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781632828; x=1782237628; i=markus.elfring@web.de;
	bh=lzjC8qZKeHmK1rAImWaAQXyV+9RAUuzecI2dryJsQlo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ArzpMYEeY/p4nHk/cRpN2GFOKS+z3plHNClGKZkiecv9SUD/eodIVjxAGVNgshDt
	 G9jX5eoRVabAf2Dknc755iG7Dx+cdNFQuQukFHnP3oRu8gx7t+R2dxr3Lp95ZllRO
	 zM0v3BKpLxb+QMiukk0KXRqCpuhCg1SX6d1cd2Ru74kAo76/90nZbuGIZiu40JrIb
	 S732cw7boYWoZHsHX4g2cQzlR+oIKUr89IuCDZ0ZTNmzgH0LR2bOUYnl+16mxcG/v
	 oNIShk4zJXwsWbOWN5wI+v6KyIqX5rqJao1YhUUyuu68dR0fOkISlbvrWThf88W+0
	 fXdKlJzB4nGx3EOb0A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5QmF-1waMtl2DrB-000SBr; Tue, 16
 Jun 2026 20:00:28 +0200
Message-ID: <46883bdb-ad86-4814-8d33-98e2a342e31a@web.de>
Date: Tue, 16 Jun 2026 20:00:24 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jfs-discussion@lists.sourceforge.net, Arnd Bergmann <arnd@arndb.de>,
 Dave Kleikamp <shaggy@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Yun Zhou <yun.zhou@windriver.com>, Zheng Yu <zheng.yu@northwestern.edu>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] jfs: Use more common error handling code in jfs_readdir()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YO/xAIlsw7LO3y2eqEtKOCf9i0wyYKqbESs27SQVWit/+l+SwI+
 VdZfT+N6ghk2PZQLP5mKDlnUzwWVRd+jaBndLbvluz3TRH2UVMP6mSilYutSMaZHtHo5jmD
 ngHH+a/pbpV2x6VZLwG4uELZ/kWcislixnydGXe+W59BhKzpilA4HdGDdAWsrv2I6u+DtOK
 HH/jW4f5rQX+xM/g6rQkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DjmmThq8o8s=;LdSQCEzA09Qh5dLcEG9O8/GT4aT
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jun 2026 19:50:07 +0200

Use an existing label once more so that a bit of exception handling can be
better reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 fs/jfs/jfs_dtree.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 8ce6e4458cc2..f0efdffb9e5c 100644
=2D-- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -3036,10 +3036,8 @@ int jfs_readdir(struct file *file, struct dir_conte=
xt *ctx)
 		}
=20
 		DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
-		if (rc) {
-			kfree(dirent_buf);
-			return rc;
-		}
+		if (rc)
+			goto out;
 	}
=20
       out:
=2D-=20
2.54.0

