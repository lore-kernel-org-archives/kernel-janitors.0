Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D6336885;
	Sat, 14 Mar 2026 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773499262; cv=none; b=qvQZDzeXcFg5K0X/wcpbyEjH65H24qBNpg3R9HdQoNP+8yvh2ZrwCFiM0ONEZX5gdtrWiVHzLfGiilm5hM+rG+qRbmpaIKOf960GNh1Mrr7EayxoOAducilQQtvjEA3vP9R5UQuMDJ8OfFCDYFbwcnoT6SfgzMLff0/1FjfTHy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773499262; c=relaxed/simple;
	bh=tciOS5QVl2P6EJwsd/I/v0oWTB7ec3OrlMM+F4yh+p0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OKUBT51yqp738eawzs4zQvPK8dZ+c6K/Hm/ZRlzKGBaSBjA3dZoA0nB682funGnnScKCGWQZfg9LSW5k819WGKlBOPSmGdeXDfr00CaUbOSWBYgc0oC51KEIc+HZOH4KuTkDXyFD1JGIF4xIEwA8IkdZfys8pkmNaXljd3QFpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NTETp2OY; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NTETp2OY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773499253; x=1774104053; i=markus.elfring@web.de;
	bh=TUz360hSZrUu54zKcPDS6dTf/PZvtYhWjAtRM+8YPJ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NTETp2OYd7EIJ3+YQ7z+sN7AktQ1j/QbTd7cRgokiEgvdD+lQghEstwx2cCw9aqQ
	 EA/iM6y7i9NMQdP6MjwMNrQSYvwFaPS2jxKTIPDFvOjaiPeQzypmDlUgP8lrEF26F
	 Z38Sv2co6nBCzRYFSJcPv67Hfb9jIMCg/7d2ddRU8yMT4CRbAFlrRtUV4EH1dkujX
	 ZV69UKka5hWM0SRjs1V/xn+U2ShQs16bQPfZNVNcqhHN1puMjQyPd1G1qpMMzM1sm
	 2NWYotDYmbrH1eY952v0QkTJ7oFUysfpRjcwD/8sf8dWlOcNnlu32IOlfmoEZb5sF
	 VVc0HzAcMGIwU4gSSg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCGSW-1vt8Qo498k-00DhnF; Sat, 14
 Mar 2026 15:40:53 +0100
Message-ID: <ad901a22-7c48-41c4-a69a-2fae9ace6664@web.de>
Date: Sat, 14 Mar 2026 15:40:50 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] staging: greybus: gbphy: Omit a redundant
 pm_runtime_mark_last_busy() call in gb_gbphy_idle()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C1aVNNoTLgxKlb3mo3g+q2ghN53soTuv3AeCY5cDoxIkOqQJzig
 UgDqkld2Jj6nND9Qzn5+h3yi7OBLtOl9Hn4FmdyCEsddlQzI4A3eFC7S1bMggv7r+0wrUyh
 7jNcG1eCbPXt6KPCrcZWFMH+LrOQ5onAdlFow2R8R7TAPNM7ixWbahT/brENc9syDQaKfZO
 HA2APJwNNa4A/aFCVf9+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bVNS2M8gnFQ=;C9NqzFmjRdInn/7RKP3RyK3FhJe
 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
 YWOmI4Ed+JzGTSbo2O8iK3E/uel23aU/w==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Mar 2026 15:35:09 +0100

The device's last busy timestamp was set in a wrapper function since
the commit 18c1fe53d186867243f4cf17f4eef60737a16c4c ("PM: runtime:
Mark last busy stamp in pm_request_autosuspend()").
Thus delete a pm_runtime_mark_last_busy() call before
a pm_request_autosuspend() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/staging/greybus/gbphy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbp=
hy.c
index bdb0f5164a6f..949656e75e8b 100644
=2D-- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -53,7 +53,6 @@ static void gbphy_dev_release(struct device *dev)
 #ifdef CONFIG_PM
 static int gb_gbphy_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 	return 0;
 }
=2D-=20
2.53.0

