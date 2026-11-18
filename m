Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016138;
	b=z2pV03rxolsdhZ0BcuFRoUd3WeiAmPviucEKtRyjnEXW3bhEf5Dfia/OsURjpzFmYczg
	 mG/8xA6y7pvRUp2OtuanqkpmoaQy8UA8P8B5XrUkItQVmz9RSTSbj0iPs3X7TfDSV5H2H
	 VhDzpei7uiFOxeFfFB4Gf26sOLtuN+6c+uEvnaKnONLLJcs7M/ZSAOCl2J7Wy7GXm7EF7
	 XEx4Wu8chKcSKmS9B6oEte1XOLHUcnGZdj9aPngrRHtoRENIzyR775xEhv09NWcVLFA0O
	 AERYr2eG3xuy302Ml0NJuQYYnh63kMz1wWTaBVcvngm2221uDvEPfocg1nuf9j+FoYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:X-Mailer;
	bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
	b=hoje7JF/r/l3HKAx6lOIKCWHrljeAWhJvFl18LuYTDaTzHMkOp/fleI4OCzOvjwe2eMR
	 3t5ao99yXCsBOm3eOOWgKnRfM+0VLkbfqzSDToz2CDw38VTCnzDuD99mgM7RObrNLnr1r
	 WmCVZ836cvXpzVY5Tuh18hKmOU/CNRhZL0XgnbIZKb6Ufy0FOlEgXySpqA3/arjoXEwr1
	 shtPbnszUP1FeMPLu21o7goKF8Sktnx0jW3p8JPGNjWU3L7SOjIOPJnnBCamexrYB0t1u
	 ZS8f7byScTXlb3kyk0ucCKjtnhzHjqNBjCvdTHsDw8cqIsETCfl/mbbwJRLupMEmEqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MTsFx2sg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E42606A31C
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2026 15:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MTsFx2sg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a357b1c649so674675f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2026 07:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795016136; x=1795620936; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
        b=MTsFx2sgMd0Z4WbUsoLOaDhO5xlXrQNfdC/3++xk6BwyI8gy2QdPz9iv0aFbS2bgtf
         6nRajQixwfLm+qI0DVqjHsRp9OKoV1JPX7zBkqpthR9yGJ5K2/jDdpNmL0sTGhUN+yCW
         oHpGEo9EO4uGdokbxY4C+3v1hCvcdUHCbIzLqrWc4rqiXQMAK3Hf0k/MDEUPR0UAO5RP
         gaKsFzGJxh/WFuJ5wVyFBVFJmGD8H/UXhIjwvcdiWY+GJkByarbgTSiMzHWl8SH3WVQT
         3EbbW7DU+hCB+bivyfRciVkkOCyoGcwslj3o6YTxesN2SP79gQ2t+ipFiFOMrIVs6I6O
         xKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016136; x=1795620936;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I38LaCNb2hWbpAi7aqstQLKMG4G4TLfyKK4eAQEVhf4=;
        b=TMYsE9OqdSbp/4XJKXn3IM4NA+lbh4Sjt/+euNhRutvFH19epjpVAbrEt73Hza6Ngc
         OBKyT1oWF9XVKQUC8giAslVCofPu/HrM4Y07GH/6tI+xM8idrIkzbnHXT/Ql4dwnsIdF
         GAXqRGDVdgVTI1R4M1RvLsOtdjV3Rq0uc24/dZFfh9J4q/Z7W3YoF3XismYmJg7k7/QW
         YJEyNBR7xtFr1RFog1Nwu4p6vPdXBeMJGnnBJi71z/VSats2Bfvy4Ek7QmfdwWVl0Jur
         0/qOJJaHyZIX5Huid6kFq0QOtR8q39efs4xog0n2Whl3+Uao5zEbHeSUlnjcuYA/unyF
         YfTg==
X-Forwarded-Encrypted: i=1; AL+hErG0KRzhY56W4yNBJ3TD9N+/mWQ0mGqfUlLUvpukqGNc9WLBe3CQ8kTGih2I2hZi4H8dR9k6prW0j7TvpSI+ruA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4QpRI7N3dLKtgOLw9npFlR1tkPLrPCU5ANxqFTYIHYTnAGA14
	BItNGwHPn6WtS5oxFC2bHbSS5wFSvsd0SS1kHbeXYDU6US1KRfAd23Tm2WesYhiMizk=
X-Gm-Gg: AZFdTZcodMhtfWVWbEyThpEKgqzaOSTpNmbyDOxgrcSH6iczr8Dw0IJ/2hvucIxberu
	2lyZHnJIdFAr6gnG5jjQ+5twHe6S2Uk2LgmfoyNnyfEMq3xwuPD0ScqKdHJkWZFMNzGB+kyHUVB
	mi2HiwHbN/gzsTbmHCTKaH3S5k61rEJl/uT6+9EGfJb8WIPyIVhTvRgjcTD2vErYmZpsZggjbDe
	LT8WRMBAbzRufafYNuIPsG6wM5RXpbNm9pLOvHzgNMP7pgVTZXQTTLApdzQthMh5clZjwYGAfeF
	3Ejg/44kEM3eyoXe8X2mOJ+WcEcDX9jgaTF0qLaNuAAiSvZj4B0qRfmq3MFcDXt2dr1ArDezAxu
	zMfvxHf6px9PyC3pFqKsoLujBtsKF1OZyXlNixEDwIL1fmfo/sd2XHJzrv0mAZ9PiPUWaDYOSi0
	1RWB2dH9ItWKmamcqtiUu/l0zQNbG1cv201NO0YVerODCP0LDThWw9aA8gd/EQL8ULYIplofFJi
	oBtNf28FhsD14gngzvtWyado1s0uC/xFIdZzjxPaRw0UnnC/zXlU31tmmZ+rOsGmeIDWZsyHc7g
	jAzW06ElfTUQwDLqlAk=
X-Received: by 2002:a05:6000:144c:b0:4a6:bc53:246d with SMTP id ffacd0b85a97d-4a6bc6269b6mr5843166f8f.45.1795016136152;
        Wed, 18 Nov 2026 07:35:36 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11643sm5196571f8f.49.2026.11.18.07.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:35:35 -0800 (PST)
Date: Wed, 18 Nov 2026 18:35:32 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Jintack Lim <jintack.lim@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit
Message-ID: <av3FxJpUvpb_8qMC@stanley.mountain>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In theory, an L1 hypervisor could issue a TLBI IPAS2E1 for an IPA
above the host's IPA limit.  The s2_mmu_unmap_ipa() function would
pass it to kvm_stage2_unmap_range(), the page table walk would fail
with -ERANGE, and that would trigger the WARN_ON() in
kvm_vm_stage2_unmap_range():

	WARN_ON(stage2_apply_range(mmu, start, start + size, fn, may_block));

The TLBI's IPA field goes up to 48 bits, so this needs a host whose IPA
limit (its PARange) is below 48 bits, and it would also need to support
nested virtualization.  There are very few CPUs which meet both these
requirements.

The fix for this is to return early.  Since there is nothing mapped above
the limit, there is nothing to do.  This matches how handle_ripas2e1is()
also ignores TLBIs that start outside the PA_bits range.

Fixes: 70109bcd701e ("KVM: arm64: nv: Handle TLBI IPAS2E1{,IS} operations")
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
This bug was identified as part of our formal analysis work at Pereq.  I
have not been able to reproduce it on real hardware.  The only CPU Claude
can think of where you might be able to trigger it is possibly the Apple
M2?  Not 100% sure about that.

 arch/arm64/kvm/sys_regs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ef4554656ddf..19a914941aff 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4236,6 +4236,9 @@ static void s2_mmu_unmap_ipa(struct kvm_s2_mmu *mmu,
 	max_size = compute_tlb_inval_range(mmu, info->ipa.addr);
 	base_addr &= ~(max_size - 1);
 
+	if (base_addr >= kvm_phys_size(mmu))
+		return;
+
 	/*
 	 * See comment in s2_mmu_unmap_range() for why this is allowed to
 	 * reschedule.
-- 
2.53.0

