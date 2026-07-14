Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2694CA264
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056554; cv=none; b=FZSA+6aA/wEHfzfeKcBqTHKmQwBLwVr3IPMBZxo2ddTmYmdZ8zYwoubpbLNZej1Kdec1iMEADf5PU0O2ql91DZNOAnPZa1B2oVQOs6EiGzjYobRgkrJW/tgNOj5I+pJZwCPiRMTbzq+yaN8noR08QL4Ev7xwHawkL3bRCZ7h/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056554; c=relaxed/simple;
	bh=gR9OgTYQ9fjGLmRFLC+m4hXCInJcvIxRkK82+UFP0WA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zze8q0og/3+2NSBGfbfvdbpF7Ukz5BKdwHLefiGwKYTn+zwSQ/Gc4qZCrenrbfh5LHO3O8yt2YLKxqfATFeRlpG1rOOlrj5uilPQC3FAcJFiJpFXPl/iSou7pO13AQYdec0Aq8D7zP3MmTj29r09y5+5Yh3zYJZ0AevoBykwYXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZbECPdR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZbECPdR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f60208a5so39826605e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056551; x=1784661351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVmBD966C9OYKfvXL3zarSW+MDcZqfgKZz9YMy/NnbI=;
        b=YZbECPdR6rWvh190eaGYke7OS2atGHLooE8+c+qhcZhnxQg6hewjaMF5ITtSusz4A1
         fY0mkOcp5BjIADrtbo4Q5/ygJnKDsgrXIqso/paKsDmp2Hpaq8T2nh8AT/H57O5l1dn5
         Mp2JvgqFJq+8Uasr4QFQ8HDy+h7Gom/LrUp/OlrNwygZ+cdxsRgcFaELkGz49H2vGSca
         Ukl+qvwdTBtF38JfUHV/MQU73npyFeiizRv7yt/qWphKZoXqAHrWSRbyx5EkGxbdUh9k
         pQVvdzDr+h/gzenV3MGC3BO2jrCxeCwiE3CdYv8+6NQ1X9JQ3A4pmcZLYJS0RBwpy0gN
         kCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056551; x=1784661351;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVmBD966C9OYKfvXL3zarSW+MDcZqfgKZz9YMy/NnbI=;
        b=ihS4K/C5VKz7iv2yhx2z7EV1t5CF9/+Y1E+2ydH89J1rCgBr365DBCfLZET9ihqSO4
         5txMNAZV5m35LjOtIGDnFRijyhT8v9KhMbq0QO+sN7UwTe2ABOzInhcUfH0e65MWVrq7
         dKruaNWhpjS/8LIqAb9yymSZzlBjSOtdQwMEwcw571mARnY0E0q5aV2weMgPnNscgbVy
         8aeHIn8jQRipEoPA7uQYfMkiov12W+WIp0bwUff0ufPOm6r2tXiBYNg3ItJBhXXJ4sBa
         yanhUScp3VC2kprx7E3QySE38LL+4Mz39DcDhoX7GJ8znrmCuT+0cYo+4rqFsII8H2lp
         YNlw==
X-Gm-Message-State: AOJu0Yy/0VTfpH9P5cpD0n3f+KSy7eA7B2siEakFKFUwveGJx6ECouct
	47OnVNOQAdmnEZ/7w3xm9BCX1wHrOPMHMF/YF5Sd2e3ZxeKR56ztxWZk
X-Gm-Gg: AfdE7cnDXFlloXpohRN20987SAHdnOFuwn6NNvIj0u4VW/73MftpSI/JqBO6ArC2R1h
	8VAYkbiviuVgL7bjfSM0Ywp3aQlVGdFOaiZl2UbsBny/tPhUcNMd6q55doGR6b9HNWei742QAGu
	9ZJoxnlbsOCCQyBe12o2X4y6XMBOuy2m2EbJ09lm8R6wOXI6fJHndEnuHibLQXPUn1Jbs6Q0g6K
	Uz006cUCQ5UR4coQZw4EQfkXe5CyJOlYAQBxhk9+gwpI7flezrobNrTYAy4vW3PO1+wIm/iFYiD
	FtXe9V/OB8FdlVFq7IMMU6QSv9Fi7Ty465Ajuv7S0ZaJ06nmAp2iCO2lYjCDmY06itUYOtKPMJg
	Mo0FXJFJBm84rbkPs2aBm6GtzbMnKiteLrrK14fwl0fYkEnc4gluWW32oqe9dfP/19eXfMvhjXl
	GGeISAbYBKJbw=
X-Received: by 2002:a05:600c:604a:b0:495:3aac:1098 with SMTP id 5b1f17b1804b1-4953c28ef1amr1040425e9.32.1784056551104;
        Tue, 14 Jul 2026 12:15:51 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508725c0bsm96157365e9.2.2026.07.14.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:15:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: dsa: microchip: make read-only const array ts_reg static
Date: Tue, 14 Jul 2026 20:14:05 +0100
Message-ID: <20260714191406.195375-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array ts_reg on the stack
at run time, instead make it static

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/dsa/microchip/ksz_ptp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/ksz_ptp.c
index 8b98039320ad..5bdf829a6e38 100644
--- a/drivers/net/dsa/microchip/ksz_ptp.c
+++ b/drivers/net/dsa/microchip/ksz_ptp.c
@@ -1101,8 +1101,10 @@ static void ksz_ptp_msg_irq_free(struct ksz_port *port, u8 n)
 
 static int ksz_ptp_msg_irq_setup(struct ksz_port *port, u8 n)
 {
-	u16 ts_reg[] = {REG_PTP_PORT_PDRESP_TS, REG_PTP_PORT_XDELAY_TS,
-			REG_PTP_PORT_SYNC_TS};
+	static const u16 ts_reg[] = {
+		REG_PTP_PORT_PDRESP_TS, REG_PTP_PORT_XDELAY_TS,
+		REG_PTP_PORT_SYNC_TS
+	};
 	static const char * const name[] = {"pdresp-msg", "xdreq-msg",
 					    "sync-msg"};
 	const struct ksz_dev_ops *ops = port->ksz_dev->dev_ops;
-- 
2.53.0

