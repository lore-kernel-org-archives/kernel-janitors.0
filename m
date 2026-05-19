Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B2023D7F4
	for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 04:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163553; cv=none; b=n3WyvXGXM1AP+VyBXerPJSL5ln+qpEyP2knzQfjsTeeW0FbN9QHwhHFfAiRZz4snaL6C8n/FNn1mr3aYorR5E1KFYxN7Ddu3hrDXB5u+bc9uobeSOxAX8uV48+1RH7+RYmtt05+LssZg0LqDNwIey/skw+xAOW6zWiH4HGIMVb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163553; c=relaxed/simple;
	bh=9wzbHp4shxKFJZcvsx9HwOuka3VvuH1DUff+EQY4jOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOJGsQbrfahbLHbpYklKg2lVdDEI8FNqrEpOlCBN0Lud6Vbzq5uk7PZZjrjhO07/i1w5mUqYrAZSj7CR3JEgBOdB+FAx4YGn3Jjt6/lJEv9MPZm4DRCLLwM07malFgkFEVvzb/XolYFTE748UzO5bfR80ETvXvx7r60uLc1/NJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DPBKteUh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hyYOPHKn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPBKteUh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hyYOPHKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779163551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1PWpBmlSY8l3hxO5apiC06YW33tZ7GfnGoImctCsrXQ=;
	b=DPBKteUhK36FfqLT3YRf5+SaQr8lJH1yrC9EeneZtB9yFaZy/6ny8l5Gd3yGy8m2zYK8TB
	oCQ8G6HKyFi9xHeoocluLE7Q4h99AIEcTQr8PIULFePkywhwDndwQwEPv9bPTY79YSnBYn
	rPOR/17f/QyNp6flTRYLDpy4L2BQlNM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-EHFdJk7rOCmqLbrZ6Jkvww-1; Tue, 19 May 2026 00:05:47 -0400
X-MC-Unique: EHFdJk7rOCmqLbrZ6Jkvww-1
X-Mimecast-MFC-AGG-ID: EHFdJk7rOCmqLbrZ6Jkvww_1779163547
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d7b7bacddso2481277f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 18 May 2026 21:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779163546; x=1779768346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PWpBmlSY8l3hxO5apiC06YW33tZ7GfnGoImctCsrXQ=;
        b=hyYOPHKnqhTv5QcgsXgfrepnXEjGA87qVh5W0CZ8cKEsv/Q8Pr0jnaX5YGwNOnmgsL
         PLwn6WQmdEYlyIm7To9dh53dk3AWb2ZVjKXhgZWMg02rE3emCpe+VDHvKcfEV84qFSvo
         oZqyxj7T7WpLBcUvCWGLtQPsS87ax3VlAqimLy6umqapW5DLveiaWJdTT8qR+BpZTqic
         EYAyhDNeYgLD/DvJVE+XI6HzVaizYDFRteZB2MKAJ7kvAsGYVHz2z70PFym4+nCNYZNz
         jPDn6o4X8cWIIr7CDQtKr9wO9pXY45AKf6tDTPqRedk4I6RPMLC3LVfvyBGAaqJoNoWg
         Yl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779163546; x=1779768346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PWpBmlSY8l3hxO5apiC06YW33tZ7GfnGoImctCsrXQ=;
        b=r7nc/TriaxPp0dmr0bB0Q/AKcw5//iXdEM6I913EEDcEYiVTbPRFHRmgdKfQTKR3k/
         UQzMYDeYCZ8Wwmn3eb8BrLPIk1LyGZLKcF870ub+DmgGKb3MGo90nVL6EE3FIhSdbvnY
         9mAQv/rEtjMEOPWrEVXdJFCrQsApodbrJyPo0+vWUEg+/9aDZGuQK93MBAO6AmFj89yb
         fnSUz406xJiaqc20us1G2oAuSQYoELZ0pn0Ww4aek75G/4rOLdfFWAgN+lDCMIy81XQX
         ff02aIYvZp+8xSeaAcsbca5ZzeT5mRLZlJN+ZUdxQuHwa4fqNN75i9XMXFjekJ4dj+sp
         /2kQ==
X-Gm-Message-State: AOJu0Yw/7FiULk6uIwnyImkXNSWURooGvDPcdS90KJJlyuhOpSof2uIL
	zvG9WZGjlENwC35+F3b0Ii1LEBrtuwsxNSyEf8IYzK16RQejW+JB45LaktkgC3DpZjG8Z9VCykB
	S4b7NtA4DNQUgO0jTS3Sx7lzRaIV3AoXd8ePoDEjd7EEwYvCfO06+YI/y0ElSYYaRz+zZvOmj9Y
	btEA==
X-Gm-Gg: Acq92OElcCOnjINBjqSxIwwWty9Onas9bR0/mCuiUqTX9I4exM82nekg/hG2b/zafr4
	tLZRoof8sMQxdJT+Jdm5+VvWGBVt0cIFX4pTqU0FgJ/mBTcK/vKgSLKIoWFA+q2/Xm948H7kWqj
	k1oIy6C2GN/Xxb46/rHEgEEpMZOiKO1kSYaoenZnbfISoKGVHJh3O/w+mCsboxtJWsu179jPYw4
	46JNWJ4ANGHkIYkc8y5mclHTK5yfGNKx8+x4f3BeAKoYjjjt0oUf318+NeMBoH2BR99DqbZHZUb
	1oonqWxieYl9RnsmBAKazgoR3cRuCF9Cw1UIdMgK6rsxgRdybVTTApMpMhiIObgqg2xzqAc1bwu
	/5EEid8tEIjCtn09Jpe82bK7EucSYV1ZchBb+E+QSNmyzLD/soUSzEAjAPtDCzwi1oa2M8Q8=
X-Received: by 2002:a05:600c:5296:b0:490:31e:d6f4 with SMTP id 5b1f17b1804b1-490031ed905mr156949745e9.18.1779163546557;
        Mon, 18 May 2026 21:05:46 -0700 (PDT)
X-Received: by 2002:a05:600c:5296:b0:490:31e:d6f4 with SMTP id 5b1f17b1804b1-490031ed905mr156949385e9.18.1779163546211;
        Mon, 18 May 2026 21:05:46 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm45793554f8f.31.2026.05.18.21.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 21:05:45 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop obsolete 3C509 NETWORK DRIVER section
Date: Tue, 19 May 2026 06:05:32 +0200
Message-ID: <20260519040532.277078-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 91f3a27ae9f66 ("drivers: net: 3com: 3c509: Remove this driver")
removes the 3c509 network driver, but misses to also remove the MAINTAINERS
section 3C509 NETWORK DRIVER.

Simply drop the obsolete 3C509 NETWORK DRIVER section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3dd58a16f06a..f986eb688ae4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -68,12 +68,6 @@ Maintainers List
           first. When adding to this list, please keep the entries in
           alphabetical order.
 
-3C509 NETWORK DRIVER
-M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
-L:	netdev@vger.kernel.org
-S:	Maintained
-F:	drivers/net/ethernet/3com/3c509.c
-
 3C59X NETWORK DRIVER
 M:	Steffen Klassert <klassert@kernel.org>
 L:	netdev@vger.kernel.org
-- 
2.54.0

