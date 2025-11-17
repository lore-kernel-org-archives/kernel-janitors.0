Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781B2222D0
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Nov 2025 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763376808; cv=none; b=d7dE+NB26iss+f40ATerFsY6ejkXMjw2FKkEpCeo7JFJAIYjw3+HaHDbkGKRsmBBRm7RuXY8vf3kKnn8e6kaoT8mLUAILUFCzvnHwu1CHtAsAOvH44/RvaiUiPoVDmOGvBq7lHxb7XIqBZHkj0lrb0KhTc9rVwwubnVn4AgRQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763376808; c=relaxed/simple;
	bh=t/lsRJlaKVnu+sFg/nodl22JmmoNkTylqaqdMaZ/A8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RUNWiUzg+LZbC53csqVXBzbU3Cnerb9oiEjT6D1G/nLpszG0BYBa+bIgLhx3LuEPuqrj2+aDeLfFjP/0UBddqjpSbplp2eOOGngTDEmhebjj65AD0DjkR5ksFYa7T6EPQoybYLUoa83EkJLAHLgoIZnPR0nYSVuu+0my0RcH8EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MOGFhub7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TS7fIqV7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOGFhub7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TS7fIqV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763376805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=weVeL7pIqCgj1dtVVc6JSJqw4U67U2QZhJHC1a/+/A0=;
	b=MOGFhub7woPTXqk4+3CyDI4OyvvD6aYTJTudEh2WDnJq5hSlIVquBPzRUnUTm3wcmSgUSF
	Jh2Bs7wwPnVFBlPr8ggvSqoU9RvokPeYAE55uYC0Ruj+RX5YIOcSyciDUCr2yaJ6HANaZ4
	2rfBa91AkMihmmvUG2tYutWFuneEwDA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-0BuH36byOKiqda8bZ1jLkg-1; Mon, 17 Nov 2025 05:53:16 -0500
X-MC-Unique: 0BuH36byOKiqda8bZ1jLkg-1
X-Mimecast-MFC-AGG-ID: 0BuH36byOKiqda8bZ1jLkg_1763376795
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47797caba11so8553535e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Nov 2025 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763376795; x=1763981595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weVeL7pIqCgj1dtVVc6JSJqw4U67U2QZhJHC1a/+/A0=;
        b=TS7fIqV75sgWn0DMNfLxKW1MYO3Urvk63XmkkdHES5GmyLbSjXej1fFBDCTJPsR58v
         h+ouvn/JdvEzv/48KpUhLjfB6RCNuuFzbdR9J35ejGapHpoCfMLFY7SKOKj3s1VWH40d
         yinV2KrVu+0L5HVQ/aR28/zJ3GeZFW0BpO5pKJG5MVylKMukkSfUEG0lP7sqZf6ziFcF
         0XP8QFKTtJOb0m1XNHxeUh4AI6arZ4jIIohrJXeZH2NNXXdjwWjhjvcJfvHJJ/c8doyj
         ZCDl7fv4F9MgNFvtrU7vuSNJkxMc2Q9wgY4hUXcvNrWRaS8wWjxLE4rChGhdbfQLxUys
         YKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763376795; x=1763981595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weVeL7pIqCgj1dtVVc6JSJqw4U67U2QZhJHC1a/+/A0=;
        b=fvFrJD4YPHBi8uJnDosGWmG769Frp7ucEGWMFEtfM/Spgl3NXk9KCQB59EzF0HOJVO
         SGOYQJmaKUdXKeIBv7tniZyuTUOZJsSADZ208izQcGKfkfd16qx6rcuhtgH8jb4/Rv/3
         GvJcv0BBdrjUjyBlPIiGm3ULSZuy6DuHiFQx53EPazwreSBAPTNP90iK3FeVJw0UQm6s
         1No4Rd/oqIZtJOumuHj+8QKU6wx7ZV9UW/DyspSck+8vD3993mM7l2Z2BQz7ZKayCn+m
         7bOuZsdjpnaZ97jNS8NZuXWjjCFNFZfowvexnu/SwtjF/cQpwNYhxwjLCn6fP4q4vwvP
         2QnA==
X-Gm-Message-State: AOJu0YylLCa2gzVVY5uZIciNAz5uoWb+La+UIGjy7xknVSoC81pB3i4G
	EXg8i/6aUiUm5GUv8p8moArFY5MWmKAFuxS7YIzlRJ8VZfFHXqFCtSaGiustjjJK9frOfYCTcgK
	/R5OQp1K7Me3JMjDc8+ngePbDGCPGNp+ypiU8+qp9dp0Nk+N7GFkN6IF7jEbNe43dwUgcJA==
X-Gm-Gg: ASbGncsCgaibsRAFWGjDKMyNeL4AU3Txxhwh/ms1vgpcUNfEosrqmZRwhuYNrzo7NAh
	4VxG6HnznLQXnifAA4DNBEsrFsqqXg8P/dF5lW3p4ZjX1TJN2cfZZ7UUjMewofGza5NKUaK3C0o
	MUnVZN1mgX6vuB+kZkrW0FG+KA0FjBRRNi4tUO7gdkZmmfVjuCi3wHDfYz1iCzQ8eptoChIQvXL
	/9modQFsj+hhbjpjokzJ3FNr412CSkiF8QlhPyD7b9DvqquvEorr8al/kDLzMA+G/dY1WAWhkZn
	W/+MeCoYoqXsHYfEoKkyew384G3Dk2yNMpSmwELKMR3YRUJlb1s6rzwB5qx2iyjg2BX9HBnp5WC
	28ACGzJGgzdqnRgshBZu4GObtkY7w6qvN/tHTUzWvQbNMDvqx
X-Received: by 2002:a05:600c:4f93:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4778fea6decmr109501515e9.28.1763376795059;
        Mon, 17 Nov 2025 02:53:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3HZ/EG+0hLE0xWKTG2B7uZjltnrN6g+YvdWpiFjHbgXkbHVzQZWmsH8z3tv8OtmAgayjJWg==
X-Received: by 2002:a05:600c:4f93:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4778fea6decmr109501235e9.28.1763376794681;
        Mon, 17 Nov 2025 02:53:14 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477975022ecsm141346085e9.4.2025.11.17.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 02:53:14 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: refer to intended file in STANDALONE CACHE CONTROLLER DRIVERS
Date: Mon, 17 Nov 2025 11:53:11 +0100
Message-ID: <20251117105311.293508-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 23db6eed72bd ("MAINTAINERS: Add Jonathan Cameron to drivers/cache
and add lib/cache_maint.c + header") intends to add a file entry pointing
to the cache_coherency.h file, but messes up to name the right path.

Update the entry to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 320045a6bad9..30eaeb3675d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24725,7 +24725,7 @@ S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/cache/
 F:	drivers/cache
-F:	include/cache_coherency.h
+F:	include/linux/cache_coherency.h
 F:	lib/cache_maint.c
 
 STARFIRE/DURALAN NETWORK DRIVER
-- 
2.51.1

