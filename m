Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2FD13790B;
	Sat, 14 Mar 2026 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773500746; cv=none; b=tKWBfp9I84EbYVHwPXiMtWMqrzEUYBtaZyrYkm3x4bMXku1PUAlnipKQqai2PbBixKvfo+oxCvq3gfFJwZ5BmseOQoOvKRFLCihiGoPxBWQJsBzWGFagTaq8o4YBm6D95YtPv3ixmJ19gEOuy/FNCz4D2UwSYZqOVvKrXVrZfa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773500746; c=relaxed/simple;
	bh=5OkPCkIO2Chb1GfTfyyaT6f+XOYbRvC8MXxEDNV8Xl0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=odu/5mWIicVFGyMfr/s0rLX/omvo2x0qAlQSInls2ajr+qaO7a0QhmK2a7df3rNIOzudpkU3ScHPiAgnppAZLII5QaIn3HCXRdfhqeFczoHWbVo3wMNT4IAprc8bpLlnZ4nmWdWAADVEkCqG8zxbnY8EbSYJJcZDFOCteP3UjwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mlVAK7Q7; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mlVAK7Q7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773500728; x=1774105528; i=markus.elfring@web.de;
	bh=nLgecqG5wv0gkv1vhTXN+YmDs9SaUsIerAOSxJe263A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mlVAK7Q7mslxmW6b2XvOQZWuqbU7PRhciTKhkenZoqHkgryTXgIL7/KNhdU9FsEG
	 vxryIOj7866PSp4CCt0wc15qOlgEJl2TKjUPSymB41BVTQtZe5lx485cRAmFvpdEW
	 yrlhGDNzDkd3hM0zqp/vkP1zAAtQKLtonzJ8wOUzgDErbYtFPGTX7TzhC2548hrCx
	 GmBKCNhyZZF4uBq31x3+VaFjavavo5+vhIVOkjdoUrrBajgOBEHeA/FxIpmCbpBO6
	 q0CSX1WAAXBay8l4JJtbyLfI0FPQd5ORaUrc+dDxvekfGwtNhXJWK0583BK7lSMfN
	 RJpc3d2sjBziLHKvkw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZjIb-1w4t4C3QD1-00ReCq; Sat, 14
 Mar 2026 16:05:27 +0100
Message-ID: <03573ebb-54af-4bd0-9730-5f55d24ae0c9@web.de>
Date: Sat, 14 Mar 2026 16:05:23 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] greybus: Omit a redundant pm_runtime_mark_last_busy() call in
 two functions()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0j5tmQUR66W6XrpmtNSF+oxhGanndf1TzOEIeOjb/q7uN8gxJeR
 /lIXL7ssWR9MuWrvHSJUY/CefHbsXjh3/SBQg+UvLRiCIUUhmftSdyggUhpMqKUC5pdtg5M
 IMa/TlUbDMsZ6WjekZDBXESdP7+acGI3p4mCnLh6cP+3TvRHP3aa+LhSsfw2NIWy6cpuHiO
 B+0wszlsCv6XoH2NPJWDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uVJRMV+t8Ug=;PtkvDjU9W3v1MrF3ZV5elZZUGFG
 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
 Dqy25ETc0rE

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Mar 2026 16:00:20 +0100

The device's last busy timestamp was set in a wrapper function since
the commit 18c1fe53d186867243f4cf17f4eef60737a16c4c ("PM: runtime:
Mark last busy stamp in pm_request_autosuspend()").
Thus delete a pm_runtime_mark_last_busy() call before
two pm_request_autosuspend() calls.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/greybus/bundle.c    | 1 -
 drivers/greybus/interface.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/greybus/bundle.c b/drivers/greybus/bundle.c
index d1831d0986e9..d8d8e9ba7869 100644
=2D-- a/drivers/greybus/bundle.c
+++ b/drivers/greybus/bundle.c
@@ -155,7 +155,6 @@ static int gb_bundle_resume(struct device *dev)
=20
 static int gb_bundle_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
=20
 	return 0;
diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index 4ee4bda4a267..ed56f90369d1 100644
=2D-- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -753,7 +753,6 @@ static int gb_interface_resume(struct device *dev)
=20
 static int gb_interface_runtime_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
=20
 	return 0;
=2D-=20
2.53.0

