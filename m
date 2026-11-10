Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326672;
	b=2YcYdfsoUEtQjrNvRcj1aBZkcuNXnGoeJcvGnS2N0tih66Rd/X4BNnpXqTuNetHMJr9P
	 HfgF8E9w7zWVw/+zYq6WJ7MBDE/u/lvwexRCD3zCIaWaItCHFSR27KKzW5itrUzeHM3BE
	 g2GagdZvbiZhOn75wotyiCUE7ceDbPLYP7ZauUYeTrsw1AFSbwdLcQ9uZjjz214vPDfik
	 jQgskbO80QYoNWPAHmWZGvwmZypeYbET+QwIR8BoDS8B97pfzCSg9nsYcra909nDe6XRG
	 FeKdIPlh4BDSOQ1aq59agj/YR84m6RUBtC8IduKZWl/cBtZlvVECloioF1J92fO8DAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4vUoA2NlXGcNUrmfCjgkgqsXq9gI1RBudmDyICGei0k=;
	b=rsQtXZtQ//q0DVFQ7kMxgPc7k/FZqndKPeyI6Yg9MVScUCmiqEjK7On4ZkZvuiGkNgZE
	 XERM/pAfkkWjheidsBYGZEGt4m+PoaolxCx9wdkX91/lo0L9zS8lQyD0xhYldBbxyoP9B
	 1lJsN87vuIOVl9gCPJnD50PMjh7Ws41rBPVEeddtlslOUcOr1WJd6G9slnye4ytOdE4iS
	 gQbP5aL/piFBPXcXqtX9napDdqQqexPEop3xeg/+bvkSBSZfvPhPs0C0sOrDE+wetko6j
	 AICo0E8Q4DrOD+VqQZkB/bh6/KW4PVkQ92ubVJvnkrj3hezjSl/ZhLV0N5ael73RuTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkZXZyyE;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70220606A323
	for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 16:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70220606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EkZXZyyE
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49465892f7bso1557676f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Nov 2026 08:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326671; x=1794931471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vUoA2NlXGcNUrmfCjgkgqsXq9gI1RBudmDyICGei0k=;
        b=EkZXZyyELALl1yL9avVJv5lEXX2LYoHl1EpOSL0Q072MDRkldzJn0H9IG58wkGDEzJ
         18u/vxg7kD1o9178JHkH5L1n0UMjom/66QSgAdCOpMIJAI9iGC6zJzlZWYvdB/RIZ+mf
         ZlORW65mujj99BYyoVbpqz1slSzOVHDhRBDnglrfpmaDvWM8K4Uxg3nQE4j3Bz1JLzqn
         aBGAhplT9c0nuQnk4JqYdhK5DVUiYUdTGB7EErinTP10erFGLMujvAOa+zymBs7S5ohL
         ogUDmXYLVm06wyqrMoxQJzeUKlOKNUbMUOJUy74hmPwpdm8EBaTLoPAA6yxOYT7eWyTp
         7c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326671; x=1794931471;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vUoA2NlXGcNUrmfCjgkgqsXq9gI1RBudmDyICGei0k=;
        b=Ne00d83Se4gl//W/AfUR0/oOM0DfrbMW0fmbCACldCMqVsHnzYVYahAjaCtVJjNsIB
         BRkU2OXZEeLXdp5e5hFbz1j6A1El0tTbSwVIvMWMDHXn1YOWl96aQFAa/Vlb8ADqvevQ
         RSaR7RxocABfeBaZ7WN9tYebld/Pznp/XVYochwy9gM5nUQxMQekiFH0FSlVs1rpIAiL
         RGeqrnN1HePHzDAyVC6lKnSpb769THXBQiSLhXXfceooYM9gF4nHQO5/P8LftyRPTvdQ
         nsyET8J0I4Y/s6qiPhJ07WQlkv0OJuMv+LyW90O82JbA/9Nruk1ZSFsbT8ESh5CPZlAl
         Scgw==
X-Gm-Message-State: APuU4Z8cITPKlMyGFEPcKtM59yzOYSwAL0oCho/xgCOAJwFQQk/KF0jT
	YLoh60/slqHlGa+5bKcWggssGpIM9VqA0ErLRWKwk5pRHJ/1+80V2nPW
X-Gm-Gg: AYBFou2dIwMTWw2fzKcslgrd7ipxsWH9QMt7vZ90kGw4ujJp5c660VKsdH0TQ0sdt+L
	ObDwDJCiE5j1k9fvbYpL+09wanwfZL+3NY5/wGohTDLPRVQv+RsZtB8KTDjX7wgXggQfBi6XucA
	X2LcQWygMvVplGxtz/ttEJMabNrPoTAICbCdU3znkm36JBNF04+0UqrjsS0iA/er4mjaiSWhvSB
	uRLF36kkPn3ogSQdyEnnT0nyeP+CQjoFMvloRiqpvmj42jpmGionn42nkhyZCq+xwApLZEt9BX7
	KkXj6jtMjDufYvg7AuBukH3oAl5NCmSTFpGSLlzd+ladZpckHC3S4DHIH2XLSMMuHiBGhxXLIxO
	0qH8YEMoCdIVJkNYaJvkprmrXYsz57IrKM0x9UhRoB0OD+wZdWn2TEHYQTvLokEuIu5T4a0eOrr
	m8H/qyk8rGYmNS1HCSQGs62l6xw9OnRJZIboZQYjknXVljxFkl8SoIWtDpTgB6Rzz0QJC74YuCy
	NvEJfz0zKM/XABsaKMEFW1yz7JqKdIu6uUUH0DltFJn9oUU9sChAmBRhXzDCyJMiLGei3xS2qim
	GxcPkCRJleYkayP99ryYpwGXn90=
X-Received: by 2002:a05:6000:2584:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-4982ecf6404mr6123412f8f.16.1794326670681;
        Tue, 10 Nov 2026 08:04:30 -0800 (PST)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20327sm6048689f8f.26.2026.11.10.08.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:04:30 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Mukul Joshi <mukul.joshi@amd.com>,
	Philip Yang <Philip.Yang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: make the read-only const array fw_err_code_msg static
Date: Tue, 10 Nov 2026 16:04:29 +0000
Message-ID: <20261110160429.892673-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array fw_err_code_msg on the stack
at run time, instead make it static

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
index d025b4183b29..91c863649972 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c
@@ -5427,7 +5427,7 @@ static int amdgpu_ualink_metadata_init(struct amdgpu_device *adev)
  */
 static void amdgpu_ualink_remote_error(struct amdgpu_device *adev, u32 status)
 {
-	const char *fw_err_code_msg[] = {
+	static const char * const fw_err_code_msg[] = {
 		"Unknown FW error status",
 		"FIFO overflow",		/* error code 1 */
 		"Invalid RB command",
-- 
2.55.0

