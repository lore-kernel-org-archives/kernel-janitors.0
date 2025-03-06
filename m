Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA21B2080F0
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254422; cv=none; b=BPj+KkxZMMA9AeySfeiv8orLdrilDjXSQdFg+6dsvz9mK0N+P3W/30uu1trEUlCt5XAyLR8OJDKzGORjAyNPGTLC4h3Gdca/LazEwNB1eZj2X3yKikA9e+NIrEpGeTWCy9b2yVE2c/hzt98XeqCnk/AmUY9+DdiUQPYFz+6ueOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254422; c=relaxed/simple;
	bh=g8ftAWsannBKjScJBkCA+ah2c8W+V8QRLBe3IcWo8/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7jSZo5IHAbEEEKGf//RyqFLr2TAHjnrmd3XJ1Rch4QjxcWx3UXRXySMTZ1n8FYDMRohDQIIZdt/Fuipq1l66nPCcP9G826980Ul5EZlQZEL2tZlIgroJhVYhscQspQ4Hwlg7msBh/6dMJFBqMFOfNH4Sd0IpNBjy8+hQoBgn4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gqMuE07w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gqMuE07w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741254419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uubAh/lYg724YkjeIYAscgJbLGgC562xtf2/CZEmAQA=;
	b=gqMuE07w8cp1ykEqz5P2X4SHyQ9/ILZESCJ3ZfQEXWiQeBfp4ph2i0g4tuQTo6HC6ibWOG
	7y51+mLYvKMvKOZgJUqSyLocVtcwS+fGZc7I5JUCGM6vZkOB34EeGoqRmCf9Qwg4NZhFD7
	f36DVXe6N+g/1carFLfO8EEuwtOs2O8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-MaVYPpMlO0ekA8UIDXDQpw-1; Thu, 06 Mar 2025 04:46:42 -0500
X-MC-Unique: MaVYPpMlO0ekA8UIDXDQpw-1
X-Mimecast-MFC-AGG-ID: MaVYPpMlO0ekA8UIDXDQpw_1741254401
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bdcdf193dso1910275e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 01:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254401; x=1741859201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uubAh/lYg724YkjeIYAscgJbLGgC562xtf2/CZEmAQA=;
        b=iNfFRcoaZ0BX2ooEp8PqHL6I8PtBRJd4mBSeHrVDAuH34C7P2x+AcdatNsTwiCUguB
         R3ltl7ek8DXQtGMMEjoWqKFj2zQS1VpXx5DUeS6BzkW7yB0fbqR8s2h5a6eZWknod4MY
         HES41XJg97aWWMopeB79RH6d+zYJ83SEk4Ggd9ZLXm9SC4bOm24qrNl5LHWl5oLlu8Cv
         uKq0quIvaXrVDs2nIjr4Qw0+CbAfeIcKUfRK/NCu1EJYGbCKfELzkdrbuoevjSMmZPcw
         8qk8cjiDSi4yjVzinregFZMhUjrWswAtrFF6ipGFawcPpzG1pGuJU1oedXW+5wT4cqFf
         3PZA==
X-Gm-Message-State: AOJu0YzNtYigrB33EdW+7mmNYv9ovOZ7Kx+owF8xc4oOiyQ/vQRozb71
	RbBiQQhVNMkZcmwmaeXeFDU3Cec7ue2z8g4yPpecSXNTzsR30LPQXF4+sw7MflqWIrzJNfj9o7c
	SpwwOFkgWGnhEVZKXo8EIz6xuTavmZ2/xitZ85TWXOzUr0dah/kspwPhdBLSJ0Wur6g==
X-Gm-Gg: ASbGncvgTymd5V9aAE+UJIMiU/nbJ/my/bZRPvaYRnUBMYkn8veNqAy6Rh0/+Whp4tS
	bFGp4xHc4N6xMA0qgkMuO+Wl6zv/DpO0r1CfEGC40ZZFdvlkrfi0wQGjWEtYz19KN3ZrIuskB36
	HSrJHk4gAl8EIfU1YtHM6whO6R4ifv3M4axR4dKwfQMEhi4/3ddvFDMmbSlQADWPme8uOXxyQwh
	/s7i7vXj6/zG4IYGGcTgTE9QLRezk2S9L+/ib7UCcsGPck4WQLRzwXYLzZl889Sza1u7yWEUWlA
	8kVIGkgsKJEnCZQDu99rOKVTxCGjHONIRkAR6eCF18L8mbqK6zpny9psUNpoZEk=
X-Received: by 2002:a05:600c:45c6:b0:43b:c034:57b1 with SMTP id 5b1f17b1804b1-43bd2aed7a7mr43322515e9.20.1741254401104;
        Thu, 06 Mar 2025 01:46:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+0OwxS2kvbXPrOgsrLOM5Fgn/db/xRV171b/5GndlWVz9gP9UTft3oKMWDFA44upmCZSkgg==
X-Received: by 2002:a05:600c:45c6:b0:43b:c034:57b1 with SMTP id 5b1f17b1804b1-43bd2aed7a7mr43322305e9.20.1741254400704;
        Thu, 06 Mar 2025 01:46:40 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4293250sm44159625e9.16.2025.03.06.01.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:46:40 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust entry in AIROHA ETHERNET DRIVER
Date: Thu,  6 Mar 2025 10:46:36 +0100
Message-ID: <20250306094636.63709-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit fb3dda82fd38 ("net: airoha: Move airoha_eth driver in a dedicated
folder") moves the driver to drivers/net/ethernet/airoha/, but misses to
adjust the AIROHA ETHERNET DRIVER section in MAINTAINERS. Hence,
./scripts/get_maintainer.pl --self-test=patterns complains about a broken
reference.

Adjust the file entry to the dedicated folder for this driver.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37fedd2a0813..f9d3ff8b4ddb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,7 +726,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
-F:	drivers/net/ethernet/mediatek/airoha_eth.c
+F:	drivers/net/ethernet/airoha/
 
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
-- 
2.48.1

