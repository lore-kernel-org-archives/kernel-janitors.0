Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77224329371
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Jul 2026 03:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782875092; cv=none; b=mtqko75cRkWN1/Kodlv43I5O1//KkfpGctlyOQ2qVyKI+cB8hYnUr/e5i+T0Kf+MmMInDsai549hwFV7UGc/m/dHNaGLUdrgr9nENVzG3yNnj9LcjmoCVVLoR5lS5xAp3BgrH+qiLj2KMJURhddWfog8/xHWdZnhOOrMKvJrTwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782875092; c=relaxed/simple;
	bh=2Jg+aOfLexsl4IhrEflsYtUIJytswVTro/wp/06/3xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rat4Z9VDMBtx9uPQzplX5LmJYJCdvYwXaauZDWZxZqIkrF14HO5vEiEttBq5Orl2rhEm6vlkYjkk/BeAbmzpRSdcXJQN9hwXeSXBqVn5FuJ0476fxD+lY0HyhDJ39WvwCJ3jYPran67QouwtV5agJ5W7dCKoJpQL/Vxwl+YWGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZep78r5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qkgxvlyg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZep78r5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qkgxvlyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782875090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lCaMYc8eNrfsW+6kx9m1j6d4lfDzKZwvqiqCl5u41Vk=;
	b=OZep78r5E94HhoNIh5+3YWq6USO5nPf0+KN7AUkPJRwB4R/2g0c1PoVEYIOw50F+ZKJTRt
	8gxce4Cp4RfFgIZ1RDN8O+UP91KGGokrKYx+ZBk0F0vIRjA0pRaZSDHmv+kYOhT/qTv73g
	hIbGzsEaDL9Ffsa9oHhX46+nuom5UwQ=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-0L07pHvZPAeoRSpcLxqqkQ-1; Tue, 30 Jun 2026 23:04:49 -0400
X-MC-Unique: 0L07pHvZPAeoRSpcLxqqkQ-1
X-Mimecast-MFC-AGG-ID: 0L07pHvZPAeoRSpcLxqqkQ_1782875088
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139f2c46ef1so243247c88.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jun 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782875088; x=1783479888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCaMYc8eNrfsW+6kx9m1j6d4lfDzKZwvqiqCl5u41Vk=;
        b=QkgxvlygYUvTHBe/z7q7bflFxxAHhJ5IEwOPQ4d0tf5NRq4K4U+3JbR1oa7IMO9duB
         ey1zwyYEFvIkWbVVIcTNcmy1+SiJ7e1UyQ1Aq33Sr94HOoXM5BQ0hrWfxl5xVKIycKcc
         hyMDWQwze3Iplpnm3XtZKBeRYQm/VHj8gP8ydTGyxis1u+YJWyXH40O3uGnwM6ZfQqh6
         gXMxrhLHSsMWDiCR/1sxWih0Jh/3AWSrhbIdMbi33j2jQIPJvWqEg6bpGkre5KmNnSrB
         3EoaSXyn56AvHDVqNQJaJbEkj8wlEaKpzlVsMhw+6aUI1p6Jf+ijP2wzIPvyNYpTh0Tq
         Vwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782875088; x=1783479888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCaMYc8eNrfsW+6kx9m1j6d4lfDzKZwvqiqCl5u41Vk=;
        b=n+EmzyvMZ+xW2UyC9vjjPhT/UK6z6jIQOf5S0rQiF9TpMKAIVrzuIxJpYlkxr6j+Rh
         wOlssfffFkIIsop4hL1xhibn0eyYT1pwxOKjIXe3Ik8IgmdypfEpu8byxi3jtOKVmcNz
         3H7JZ5P01DriYOFgvxcI5d15GFwer4SNxiNeFeQhNgD5dtrMp0kc+11kV3lo2hh1g2V3
         V6p9dg/e5Yjo/2p9nnmf4RU7c9V57HZwBNgLc6wRFfi8IcSdDBkM0xJSQLeZsFtyqdGF
         Vqj82kPVVbcWuHQ0L3VTQWeUgk9rpjQVEjY449gob1AnECbGRVHdhpetn6WDz1nkz42e
         iGtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SDzGN38BAz1hmfbBijZVzEttW7veVURpwjtKlfyac+qzia0RigGd2JpPOl4RNolC43i4k0EqtIf+RsQr1g0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSfSjx/Lh31DF51kdLZNATL+y76dZWmdS5Enx86umgxdQVXZVQ
	G5LMjgXcPj+LX/8ZUC30MXSUtgs0sL6qgaUYEwbYKCMsqqF9RRik7RuhxRdVfa1bMnkflEHtYgV
	ziOBDOF9sqWLHCfOrs+ux58RV3e39nn8Wjul4HuGJ1PCSLQk7u8PIAyInEQklCG8m+xmp1A==
X-Gm-Gg: AfdE7cn3lkve0mR7+vXzB9bA+/W4G7c6YNUUZ/aAXGPJpfBKIrgMu3TxPsr2RmON+Zk
	qtOIJL4SnBcAvchL3mM1qI5bXlQEy5CK6Tr7XwQTIsjU+DzqYr2ylIx4WClEzbVg4uddbrj6wCH
	mBILyWk/r1ZGvxT0bDtWe1RHV+uA912hQRaZAkqUbVJbkXLHu51unv6KC3JWVHMNHnKWl0ZxcQe
	AaBbXiRWukU08DajON2bfCfwkBF5PIV/5UH6NkNU/CwxTcCBY0diZ7IcZQ68UllEvwDOLQPuKMG
	tYN8zfGb3rzBDwnpNHOeTRKQumsusPNOCy6JTn92L8ZJfjPzLbPaEtcKA2YL5gdL5wa38PTI239
	JeREsUHSZhB8FsC47f/vItYQO6IsDEMz5CiqeWAxXSJ4DIRHR6Cesykg=
X-Received: by 2002:a05:7022:23a3:b0:139:ed5a:eef3 with SMTP id a92af1059eb24-13b315a4cd0mr2248696c88.50.1782875087299;
        Tue, 30 Jun 2026 20:04:47 -0700 (PDT)
X-Received: by 2002:a05:7022:23a3:b0:139:ed5a:eef3 with SMTP id a92af1059eb24-13b315a4cd0mr2248677c88.50.1782875086647;
        Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
Received: from localhost.localdomain.com (122-63-73-73.mobile.spark.co.nz. [122.63.73.73])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba8dsm15858670c88.13.2026.06.30.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 20:04:46 -0700 (PDT)
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
	Tao Liu <ltao@redhat.com>
Subject: [PATCH v3] riscv: Fix a NULL pointer dereference in machine_kexec_prepare
Date: Wed,  1 Jul 2026 14:57:33 +1200
Message-ID: <20260701025732.66330-2-ltao@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A NULL pointer dereference issue is noticed in riscv's machine_kexec_prepare,
where image->segment[i].buf might be NULL and copied unchecked.

The NULL buf comes from security/integrity/ima/ima_kexec.c:
ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
but kbuf.buffer is NULL.

Fix this by simply adding a check before copy.

Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Tao Liu <ltao@redhat.com>
---

v3 -> v2: Add fixes tag; Replace "reference" to "dereference".
link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-ltao@redhat.com/
link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-ltao@redhat.com/

---
 arch/riscv/kernel/machine_kexec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..afc68f6a4aa1 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -41,6 +41,13 @@ machine_kexec_prepare(struct kimage *image)
 		if (image->segment[i].memsz <= sizeof(fdt))
 			continue;
 
+		/*
+		 * Some segments (e.g. IMA) reserve space but have no buffer
+		 * loaded yet. Skip them as they cannot contain an FDT.
+		 */
+		if (image->segment[i].buf == NULL)
+			continue;
+
 		if (image->file_mode)
 			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
 		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
-- 
2.54.0

