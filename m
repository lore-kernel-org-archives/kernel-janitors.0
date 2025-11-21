Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549023451AF
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732891; cv=none; b=U+/7SYrahSxxurN+kqNszwbJSnrb7EtmZcvenKmwecdf5owOx/2MsGXaMbkuzhnZUm2CWl9ij8DyQ+xhFcQ0miFva4PbDcuNt2wTxLMuU8gGuSBgD558gHoB2FY9D9Pmqxno0jO/PHPNMgNSNu4/SH6M3PETcZo6+w5OheVqGxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732891; c=relaxed/simple;
	bh=HUriaRk/sRu0TmMYADWBFzCnBMyGIFGHindz1Y1mdPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ea9eUMEIJGPigORJuXHAdeIOnEqVvgBIc4a19d/Eg2bBP5uBf1oAJZMZySLqwLj1B45Ux/PLHLtjraaK6hMa1e3xACpnHJ2mnU2fyXqE3wDN3mYHFWD+co64wB2OkVRMOLHdLceX0Ilswqxvw3SNejnxXlPpOiMIoG05DK2aeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NCTKB101; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WQAeET9c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NCTKB101";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WQAeET9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763732888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=;
	b=NCTKB101dSK/SHXMG35tCAV/rRsj0wsHwcEVVAtY+6kvpMYAIN4fxMsSlm0IN1EOBJDOYs
	ZzXUR60ABTErGlTQfB0qGUxgY2ZtkgYLxMwKDDMnIKfMFd+poX9m5kp4GsCGLysjZtmR7X
	L5Eg8YL0j5xid/jJ3o0K3HnDewrEQrQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Gzq2Z9dOOwazzkmmsB1nKw-1; Fri, 21 Nov 2025 08:48:07 -0500
X-MC-Unique: Gzq2Z9dOOwazzkmmsB1nKw-1
X-Mimecast-MFC-AGG-ID: Gzq2Z9dOOwazzkmmsB1nKw_1763732886
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779981523fso24838365e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763732886; x=1764337686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=;
        b=WQAeET9c5KCYrDerK8GAudb70j2F4eo1BbBkioft5d/sNKtGmNchGs8+cCCWauMKwA
         idF2ZHDtQfn9FFmGTf3A8MfGguEG9EwBHouex4qh5aDHymZDNwiGXezppJNw+Lh1KUW1
         IkijpFPG03N/AlLrO0osSXMsBp4CwbgTUXZk75MKajOVyE+UKS0q+DSXJqYZ+PCBpFBq
         scja1ufJDcgbFuA0sLTNjvtbVrvuE9QIBsVhie0IUPMCQTagnMoQgLEmTP4ys3BCNftz
         7p6EoJcb0VxXcfopynv+5xtdIEf2QKDuf3nc/+ODwUEUClPII6nzwehK/2+X7bxGrRHA
         bQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732886; x=1764337686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrY3SHusps5/5qA8/cncoJy7l+pDMbgMB9Ky427icWE=;
        b=REMJ3Wmni0OeCSyn0VLBkVGiULwgoLVORlKImDKBgg5BWb65hn0ghUEqlt6Ho65f8y
         AW1WUWqjGW0UguNndzC+pljf+3jmYmK2a7IgmqAkXyA6uuaSArz/xCDxVNdbm3Y3Ws0F
         mMBl8VCnC1DBnsxMlqYcin2N2Ji5aiHZ3FdSBvINb0o5vE1ZMWx6sNreyTP5xW8Cby8p
         8rbauN0VXiQGy+XN6W/WZGhT4g9C8rnP6EECwHTTdazNMoJxO8I/jMuOv2qxEr4QEGwS
         qbzx4x9g9lvXArdITgdw31TL+JqxVi8qI10S0LonmVXS4Cq/9P5zRHMUHbZ0RgUtuwGP
         CZNQ==
X-Gm-Message-State: AOJu0Yzws4XFQFvm87XOy0LM9I1VCbST4hjEl67JeCMRPMAetqVoCwGQ
	MKC0ANm3CQgMXULzslfBgG3f6qWQhGTcpVbvshW+0MCGYic9dHw8PqL5iROyKFjcGw6Z86s8geF
	KfeD5S+WgMlvuvMZ601FyD+e6pN4MDEAY+UNwGEWw5eZXHUCcinAUWyGJQJA4ea1QJ2ROQg==
X-Gm-Gg: ASbGncuRH/2S5o0ljANjtBX2ZxGbGKifrngrMSBX27V6criWJ/RH9pgoJIdX8tSt8Yl
	Ax/hIOdvYEy3VAmFfunzG5hUVacPhkL9Rq+ZK4pCWLOD5WZXRT6zpOOOOSt+FIgNskTKqW/pTl0
	Twi9JuR5zhtOujiV9VxjOlxiysz6dpcsImP+W7Bi6AG6rIggqZK5u25REZAJULPScPPpeLP3v4Y
	GB4qfx3B+l57/Ukgj1aQi5g6pJFEWUGFRXqukzaQy2qPXUA4ivg+S0CgzkVsjrsAX5IrZNsYYbO
	P0FSoYPAXyYpqHuiaZmWmZSrMBm1mMmzP02P1f8Dvy8jnUKC2Tp3dqqTPsD1pTeBCObYOGMqckU
	G4qIF8/T3SLkzydgozRgDaDhq0LSRSUIxziU4c4tfSMXJqa6SR1MZGlyjtl4=
X-Received: by 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477c10d6fdamr23385345e9.10.1763732885723;
        Fri, 21 Nov 2025 05:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHegkSSe+SGWHMtR6kA9u/Q4TOGuunCa4Ux8zesgUiVCtqnZZi1NI5I0T5vVAJrKK/r4LK5Pw==
X-Received: by 2002:a05:600c:8b35:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-477c10d6fdamr23384955e9.10.1763732885315;
        Fri, 21 Nov 2025 05:48:05 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ff3sm11713394f8f.16.2025.11.21.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:48:04 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <himanshu@thechauhan.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: refer to intended files in RISC-V SSE DRIVER
Date: Fri, 21 Nov 2025 14:47:55 +0100
Message-ID: <20251121134757.120782-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 5ffe60d26107 ("drivers: firmware: add riscv SSE support") adds the
files riscv_sbi_sse.[ch] and intends to refer to them in the new
MAINTAINERS section RISC-V SSE DRIVER. This section however refers to the
non-existing files riscv_sse.[ch].

Adjust the file entries to the intended file names.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e2ed9827be3f..4a29af3f9d74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22483,8 +22483,8 @@ M:	Clément Léger <cleger@rivosinc.com>
 R:	Himanshu Chauhan <himanshu@thechauhan.dev>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-F:	drivers/firmware/riscv/riscv_sse.c
-F:	include/linux/riscv_sse.h
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
 
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <dfustini@oss.tenstorrent.com>
-- 
2.51.1

