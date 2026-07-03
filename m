Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7172E3C3BED
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Jul 2026 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078031; cv=none; b=YGLBKAyU3DmYYDGPkKgpXEsEPuG98zTi80ds0NgKkMW6s7iJGort4ruziPv9sl5Hcm3Q30CA4qlWaxrYNHVowH6vU3YmROsA3LN5Yz71ZmVHOcfi+iLjv1zES5pwxWGisr/TkiIcFKgXrlStAtm0SPe6AkeVQTsI0ceJbrL3v9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078031; c=relaxed/simple;
	bh=7TZzsqMFbtcgc+w5SoueN6NnlsZVcur7+/g0tDCWPXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQfWnpBl/tZa7a22LIg38KRqU4HmHVIDyLCJXwVOguW2vkn+aNoJebuMlF1baMccrYHOo7w30tN/Rw5LPxQL5qHearANx7/DPQY9VE1f82S/yT17LXyqs1HnyAqQ1hQrtN4AZRcjFk2tSLFN1/lsrZf5drOiY3ciFES5J8aqmK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lc5KWNez; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tRCoxWYP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lc5KWNez";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tRCoxWYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783078023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dquujKaEWXj9SeOR2cw//kdvyk2bjQlGJyeh7Df3DyQ=;
	b=Lc5KWNezU4qSsrVes0aXD4wfZQ+XbqsCTLrWcV3dWLt5lEMwj7HnqSzcMC72HsOgiggeBW
	jsEWjo9JbnRWjWFomTJR5ryMVCx4bpIs0AadeVeiL1TeqlOzoNHOBPENIHN4RKYofc6TWy
	kGWm8ejuT33eY4AYWqKRNWxch7E76QY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-yglgp6N_NQeT4F32yAuI6w-1; Fri, 03 Jul 2026 07:27:02 -0400
X-MC-Unique: yglgp6N_NQeT4F32yAuI6w-1
X-Mimecast-MFC-AGG-ID: yglgp6N_NQeT4F32yAuI6w_1783078021
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9e994869aso8249065ad.0
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Jul 2026 04:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783078021; x=1783682821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dquujKaEWXj9SeOR2cw//kdvyk2bjQlGJyeh7Df3DyQ=;
        b=tRCoxWYPlE5d5t3BHjAFklAIa8tfB02OGSjJy/GcnowcQCE1Yj3e0O0H5+94VCtnGs
         LjPjJmykCdLRVJdztYqyylo2Gm1fME5qX1PECnp1G3HQjVs33E/2KmRlNAgl3xuka/YU
         FWuHE6tZxZh5MaKQ3PUMTSfqxmRGytqZRdmojqAIhKlB2Cn+tPmIElSi+yxeEqVFBTth
         vJ8gLSKe/7wtOlbgbPNItmqB1rYk4p6aIRXPsM5PUfMWhWgw0lhJgt2jHSrCl6g0FiGb
         O+MrWqlROYXrndBc1OYzOsbqj94DoMw2XKljRBxDzPBd4IBjbjjkgk2z2QEQCtwwYWkO
         jQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783078021; x=1783682821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dquujKaEWXj9SeOR2cw//kdvyk2bjQlGJyeh7Df3DyQ=;
        b=NnHdWmiPrHxOuowgsklUjWNnM7Y4Ef4Zvq9J7PUJqoeAQxW3nozS+QrWNaz5K3+2Yv
         aVuWdP/Mnx9EMA/51FWll+eSzTUzDXnY6/QmRwTygPLclRU4mUW5q6flp4/D0zqoxA7t
         jOvb9LC7Jz5vRxCPu7x1Q2+IQWksjtsLI3i8Wy164s5UBuByQuewQOOxJeRah1dPBFzG
         jN5eSWpfR0Xw0gsp+gLmjk1SJ7MtoaGAu36v4WLopisAW0V2I5dwmoquQ//yDZnSkady
         7ERojMikw5733x8rQuDHatNew7QkxkEZA2KaH31OKDIxjqEoqEfhpHx91QgvpLEIap/z
         Y/ww==
X-Forwarded-Encrypted: i=1; AHgh+RpZBrzMJKMm4KWmRfCB2N5Hk8qR9sbf78O1hHRFWYR6hkLCewqFi9HMR70pjYk8QCdcog6B3UmKahijoLciC7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVE9l9au3bC3NwFh28QPfhcqh/ZdBvxgKf5pyWY8nTfzaSegQs
	yR1X9C98cVFKvm/x+vvhhK29APc/kgYcXGqlgI/uT9l20BsSt5Hdou+2kAsFrG8bS21ehwJZxR/
	liRdSPxE4Zr97G/exZ9wQ9CYpbT6LyK/93VBdrWkPzon4TDNCxoogIuyvc8DoLpJkkcdq9g==
X-Gm-Gg: AfdE7clOmAfpr5/NnNb/idiNsbt6TIJQqOUMRr0amopGo5Ml3Vj+LCc8S1mKa9uGsBS
	RPLx6p6UAWLNERiDlYVN/cDVJuhJmCHy97n4q03eNV6gdgFxZXWsNRqP/gCeiJ1SIoc6qpNIJkr
	EYUC/0XmvTO8KluSBLDYn28MglWDEmxTQVxhWe5sjp/xay7SGHkTUFAxF8NYVl+f5ggTN791KT6
	Ooh5w7EfxpSQPiB4J0qjjr64CMRNMJgpmQ1Ewhueuj2wDmmxuZNz73N5r2hZuesQKGVyJrexUh8
	XInsNAvcQC1CqomT0teD8ktdTPI/CuaQtkW85iXktwqpl+xlqK8RxgWUwOy3VwJFW5Mlx8ZXeP9
	1ft6i5h+vSqKUvq1PhaEgdHMlIXNTw2KvTB6fqAGOw/CpU7cwUw==
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr102173445ad.45.1783078021226;
        Fri, 03 Jul 2026 04:27:01 -0700 (PDT)
X-Received: by 2002:a17:902:e54c:b0:2c9:adbb:5862 with SMTP id d9443c01a7336-2ca7e8b686fmr102173215ad.45.1783078020656;
        Fri, 03 Jul 2026 04:27:00 -0700 (PDT)
Received: from localhost.localdomain (122-63-67-56.mobile.spark.co.nz. [122.63.67.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260acsm8227305ad.6.2026.07.03.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:27:00 -0700 (PDT)
From: Tao Liu <ltao@redhat.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	bhe@redhat.com,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	linux-integrity@vger.kernel.org,
	pratyush@kernel.org,
	Markus.Elfring@web.de,
	kernel-janitors@vger.kernel.org,
	jarkko@kernel.org,
	Tao Liu <ltao@redhat.com>,
	stable@vger.kernel.org,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v4] riscv: Prevent NULL pointer dereference in machine_kexec_prepare
Date: Fri,  3 Jul 2026 23:15:31 +1200
Message-ID: <20260703111530.91285-2-ltao@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A NULL pointer dereference issue is noticed in riscv's machine_kexec_prepare(),
where image->segment[i].buf might be NULL and copied unchecked.

The NULL buf comes from ima_add_kexec_buffer(), where kbuf is added by
kexec_add_buffer(), but kbuf.buffer is NULL, then it is copied without
a check in machine_kexec_prepare().

Relevant path:

  kexec_file_load
    -> kimage_file_alloc_init()
       -> kimage_file_prepare_segments()
          -> ima_add_kexec_buffer()
             -> kexec_add_buffer()
    -> machine_kexec_prepare()
       -> memcpy()

Address this by adding a check before the data copy attempt.

Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/kexec/CAO7dBbVftLUhd2qrh7hmijTB3PEPfZAhykCGqEfrPoOcSrrj-w@mail.gmail.com/
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Pratyush Yadav <pratyush@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Signed-off-by: Tao Liu <ltao@redhat.com>
---
v4 -> v3: 1) Remove code comment.
          2) Replace (buf == NULL) to (!buf).
          3) Reword commit message.

link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-ltao@redhat.com/
link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-ltao@redhat.com/
link to v3: https://lore.kernel.org/linux-riscv/20260701025732.66330-2-ltao@redhat.com/
---
 arch/riscv/kernel/machine_kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..738df176ff6f 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -41,6 +41,9 @@ machine_kexec_prepare(struct kimage *image)
 		if (image->segment[i].memsz <= sizeof(fdt))
 			continue;
 
+		if (!image->segment[i].buf)
+			continue;
+
 		if (image->file_mode)
 			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
 		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
-- 
2.54.0

