Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C203254B8
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Mar 2026 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471041; cv=none; b=MozVvp+Ci5IAy06BlNYlXkqfdkAaNzGTkTigPgZ8OogWq2z2YoPEgZwDgwP0f/S2Usku7Apw7YK5eyJBtHGRGhAN6sXhfhSrCPbF6yyQypoitiQfsFffN571+sFf8U9N2qtSS1KalM1iJp+B2KOgL3g/LIgiEAOL0xPKLZDWA+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471041; c=relaxed/simple;
	bh=A7WM0pIZlTNQ6/sw4ggzrYQUodDKo0RefyCH/DquylI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rwUbDeSUwNqCS4WyOjzAUimZ0c9JBSTlFRqn5lxEebmDid+55JpqhqWetmKldmMxx/YAuFgj/pNP13nGSYrLIYd0x9Ma5ENSsknqQ0bdutvNqz6y4+qfOlfkbd56xpXop90V9n9tPsm/phL0vKRkGPKsQxrQOfxvBqAHsIggkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3mB/6uw; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3mB/6uw"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48374014a77so3324735e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Mar 2026 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774471039; x=1775075839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1DX4aAtegOD8vXyQbyF+aQ9WUFcHaqVvbbM+vAMIw7c=;
        b=j3mB/6uwynXPM/NnpPzo0HybwZFwSgzTjJ1ss1AAbTQrfrNw/YGDkbGAyQfc+Brs8D
         msgjexJQ+NzLC6nK+mHeIeZKCqLGeG0dpt1nmwrqHJHoM37cigtPVNUVzxeG21qKkzfe
         FepG5ebOvNCiy+zjdVnogNiMp+gf5RR1ITpSptCoAI1ihJUWNmuVCEvIkxKdpEeRNH/A
         1LliYCA5Z6FuuI7HChKor/H75fGOIYUoEaCOSvXL6sBBssd04IsQBi7e8QeociVVFXXc
         OYqyb/j/KMHIw+s7/dx3YyV/jlZwl+dMT7blha7wUy5OtU+pWQlArbKSBvPKfPgAepIy
         Y9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774471039; x=1775075839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DX4aAtegOD8vXyQbyF+aQ9WUFcHaqVvbbM+vAMIw7c=;
        b=tHJiR6w2kXLN4x6RhFndDMLAeTtXtHOWELy4yiSZJ7FHomQkqwG/hMbrbMm6ee81K4
         UlyLyCLXJa+uVbb98b4efx/B5C4fO4mOdG23sS4NjDw6dKaa/fderSJICgnu16KhGAKY
         pJGX1OrFHnxLCLYieOiE5so/72GbU1Z7g+C0zbfmiCH/7e05o5IsgHoZmByB28IEQk7r
         NqDCeCXL3yZPoM68UknfhhLUSS06evsP8gQwh/LGHvTD0qXpeVJ07PRn+Qi8cHVRratG
         PWQ31fwRqEfH0ahGEBH9QYCp0A/5bjFEHEkHu6X/dwD775GLxDcKgywoy8CQixrQuQeS
         lYbg==
X-Gm-Message-State: AOJu0YxriIt8M/Tpv2wklNlR3ui3yUqNydf5W/S0WUjx5oyLmb5CW/Ws
	bz3vwNOtyH8zPmyRYdKVR8HjP8sC1D9L4Mt5ml88+JuJeB6aT77j2oK5xHfQF41T
X-Gm-Gg: ATEYQzxyLdLB9zTSA0KlIYUJGt6QwVrKrv/y3QldqozIu2VfYtgDSZOBvA9BdVpqK9V
	v4/A++p0ymgSkmP6pDNPGlmj8dW+1jSHltwf+00zhmTWoQ17kKKzXWtqcMTc7xRWMsq5E6rPjn6
	dG7YYv1tNULxZ+IBwmX1YGahxBNzf3RKjv/KGLCqdXjP9gcfq1quC966x956Xup6piOv9Hf0BPs
	7AVjDeZWZ+bncjAmHU0xW0tb6oRJh89EU1L4TOgqyU0DEqYVHZCdliAyjbIpC/jrcnfJ0GGi+Tb
	ZCpkl+9dLZEo00SEwHGFyzyEwdK7C695oVgAbtDGV7PBzeYA4yg/nVPG6/JSlN6r26EKfqrpk+o
	P46GTVs+ykVFp1HNCeVGI+Adh6ilMxdxJj41EkIsPLqxBKnzV+QZcC8wvadsB+HRXdwOGtSYEKA
	9vRZjTAJx0lTp0pQakfI//8EFgAB8ewTnp
X-Received: by 2002:a05:600c:a402:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48715fef22dmr55320015e9.13.1774471038500;
        Wed, 25 Mar 2026 13:37:18 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb4bf57sm3459985e9.0.2026.03.25.13.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:37:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] EDAC/i10nm: Fix spelling mistake "readd" -> "read"
Date: Wed, 25 Mar 2026 20:35:55 +0000
Message-ID: <20260325203556.1228975-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a i10nm_printk error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/edac/i10nm_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 6f61b7614230..63df35444214 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -196,7 +196,7 @@ static u64 read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width)
 	case 8:
 		return I10NM_GET_REG64(imc, chan, offset);
 	default:
-		i10nm_printk(KERN_ERR, "Invalid readd RRL 0x%x width %d\n", offset, width);
+		i10nm_printk(KERN_ERR, "Invalid read RRL 0x%x width %d\n", offset, width);
 		return 0;
 	}
 }
-- 
2.53.0

