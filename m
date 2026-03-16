Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF43EDABE
	for <kernel-janitors@vger.kernel.org>; Mon, 16 Mar 2026 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773692835; cv=none; b=lZ37w9UzOq7j3E0iBucJycLgnZp9Zf2rWm0Z2l+dRNMd5V+YDR5yvFTupkjPpVPBidgg0D+SrYsahfXMW7t88UEhf8ADH1zvArRb/0fwQqUAMyyBTBtlioNNy7x5BqcGG5rgNIl/CZD8CQUw/OOozcuqPrwZlWQTcbu6xWC5dwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773692835; c=relaxed/simple;
	bh=8okJ2fmzvjNNFPFXI9EMfIxITHFwACLEFFZDTbRfHNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XJG2+L1DY1TT+cvY2n4T5RxeRI/oqIyziAWFVUwqCze9NSzHHx+3j/FNnhGAzZcZEZypywZqXvpY/zfi1aeUYEZrIyuA1Bysv6A80a23YTXnlB5TfAuwyLNRQyKlzvW24Wvkrsc1deSpQUaHWKOH5iE+0lgzwBel4yohOpbyNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYA4sFjr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYA4sFjr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso44067885e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Mar 2026 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692833; x=1774297633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGkSCnkaww1lWR+SNMIGIRrj8X0ysk6mGmmOv90jF6Y=;
        b=jYA4sFjr2sMDGi5vBQn5kPJ1AMmWfLUmNi/Gdk7HfMmIulKmWpDo1LHwMc/1b7YVme
         AehBw9LuPdN9GcIYtUC6y9/fvpyV3qCiBKsQXdf4H/UrOesuiFKCqXCEb8fmh9/CVyNl
         W/HSBRWZ3QB4dyuKBAl5fda9lGuuzwQuFZ+ktZauXV0Kio8NkfBcLIy810K4YXrnenTN
         k47UN81aOwNiCc664TFe0PoUaDa85jcaowkSG45RrWBGLtBLEAicEhnuoiRt98K1aFbc
         oK3/Njh70qh50hjqbeoPJUhmWrC5wth2PdIvLUi8z6NkA5ioJknj8KEQsJ//Ls51idQd
         8QCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692833; x=1774297633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGkSCnkaww1lWR+SNMIGIRrj8X0ysk6mGmmOv90jF6Y=;
        b=UExKUrW8KidnO0VbBwZQxiBF6MA9OflUHkBurFoI/hocwtmzrHoCiYTVR161dcwyUy
         gBXN0KQuwOBjlT4LFX63owT1PM9HJO8FFxXCyAWCI1rnuZ68sboVUfZl4fgYV6+v+SVo
         VpUDthT6PD/MQ02oHSG6zktc5OlfsSkSJkOzO1SkPb4J36E7e5EM8lCFyHWC/j1CtVyo
         EkFwkzvcMZdshup1ocDZbuoPoj+zImYFL44cw4XhGezU4ShwkTQ4b6BtdcmyGwoG9S9u
         PfBIoCR1K7PA1s27T/juKzKzq5C3HTAbwAYSGs5YLQoETi4KVeK08rdmhMo/GMBXy3hL
         IUiA==
X-Gm-Message-State: AOJu0Yz1w5H2v8XvHaz9c73Z4R7CkSlI/3fXifr7H6NslQYOzil/D3SL
	RP1JybPaTSyuCeUOQ4gyVW0wTDw5fO99SsOGNSZkezIHovNioTcRBnGh
X-Gm-Gg: ATEYQzyVm8RTQQtZWp0x0uHsnXFtJdeqUjWzSVDNXNFBbbz0PWOYKpZkshc+AOGaA4y
	5TDyHzUtdm72uHfE8pP10Kw1/vZ0jJuhsvzEOnO0e64AOF13rDTak5VKC8fLv9HT4l4rQqQDnYt
	C2P1aCsgq3P9BE0rGcoUhBQjh7WH01w1s5JCb3dj6WYORtO0MVTSSeNKRusQjYiiZg4DWXfDbaH
	iyXLAldliDKDUvgWuUo4lu4lDDPdEaVW5e/qkYkTNTiVDoFhlbSjzzhtmpIMH6aOZi+6oyjt3Sr
	8AmJw6KTLP503deZEc/bqtwoNMncxzWOR1LE0oTtuxWUYfgw7mFWwPXcB/93v9PZo1H56z58vAV
	tP7sMjMIMbZ8Cyde4xUKVI4RQJHUL93hAT+kETKzCTaK44gV/zoSVQ6K1Dn9AsMQjaiJEe77WEP
	s1v1mr1K6fii5NFUYENOoeQw==
X-Received: by 2002:a05:600d:8499:10b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48556714fd8mr184206035e9.20.1773692832397;
        Mon, 16 Mar 2026 13:27:12 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777105sm172470675e9.4.2026.03.16.13.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 13:27:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" -> "receive_peer_dagtag"
Date: Mon, 16 Mar 2026 20:25:48 +0000
Message-ID: <20260316202549.33978-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a couple of typos in drbd_info and drbd_err messages.
Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/drbd/drbd_receiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 06d83b5ffafb..100207623182 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -8850,14 +8850,14 @@ static int receive_peer_dagtag(struct drbd_connection *connection, struct packet
 			    strategy != SYNC_SOURCE_USE_BITMAP &&
 			    strategy != SYNC_TARGET_USE_BITMAP) {
 				drbd_info(peer_device,
-					  "receive_peer_dagatg(): %s by rule=%s\n",
+					  "receive_peer_dagtag(): %s by rule=%s\n",
 					  strategy_descriptor(strategy).name,
 					  drbd_sync_rule_str(rule));
 				goto out;
 			}
 		} else if (ps != strategy) {
 			drbd_err(peer_device,
-				 "receive_peer_dagatg(): Inconsistent resync directions %s %s\n",
+				 "receive_peer_dagtag(): Inconsistent resync directions %s %s\n",
 				 strategy_descriptor(strategy).name, strategy_descriptor(ps).name);
 			goto out;
 		}
-- 
2.53.0

