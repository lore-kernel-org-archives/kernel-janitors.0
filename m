Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB70409638;
	Tue,  1 Sep 2026 02:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228595; cv=none; b=Vgn/bNM55LitDilPqlNAIQqgq7lAWZdn87DnWMTb0UiMs/RlvQXPtY3VgFkmtHBEPXe48pk5JBKYrc39ncgOqTkqA4pIhGYV7uHT37Vx/93A2ohiT5CyRpND5WRRTT5hJMtF3w9sspTvf/hYL4uBbanKZ5qGudarSYdOiiwVJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228595; c=relaxed/simple;
	bh=dgTMmxrqHDBgHeFFnFE3ld7C/DI0Al/q4VtZ9UGefvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBNMnGNJLyuqfdXGf5DxlDheBVBeW9I/d9IHFmyS8ZK59k9iJPmZ2awCvIsVDqUCVSeSV6k23gytRfgRhbChtSoVQNqddi+RfpPHFUpTngOxXbmryBNAoNsTo8BM7S68G3woOLheqc0N/jCMw3Esy1x5YmvwT3urf1hkiiWhhN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtMNzUG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtMNzUG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462841F00A3E;
	Tue,  1 Sep 2026 02:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228582;
	bh=DIXu405LdzJ+TjUOOSzT9uTdjKFaid4EAEekEpAg7MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LtMNzUG/E81ZfcquDRnEk28pzGbMPz5TzhCbD7v9YYMHcxpMbckFFzGlGue6CQn5A
	 gSTytrErEMt0pL1iu+Uc09drbGaYZZ3Snrb2OxGT72/x3cyrP82eJ+LItPmitKLn+c
	 OLdFPwjxFVSq96aspkl+9L8KuNEGyLzk2CwrgSTqE5C3PLSLReG9/nnrBgUhY1lSLx
	 rl7xFhnxltq/4g2AQ1y/5lXCW5XXT0lBqf/gpWOI+l+76pgOgnMTqwiGvT3gO5kjaz
	 P+I4a5f8TshnYrbjGcyoAVyx9RSgd+2noSycTc8N+HljwTuUjMu6ZlQPZ1I+lqcAbc
	 /Slp+XKiliizQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dan Carpenter <error27@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] soc: qcom: smem: Fix signedness bug in smem_dram_parse()
Date: Mon, 31 Aug 2026 21:09:20 -0500
Message-ID: <178822856283.1835959.10872244976816365079.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <an1toQ-acGR0kOWj@stanley.mountain>
References: <an1toQ-acGR0kOWj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Aug 2026 10:09:21 +0300, Dan Carpenter wrote:
> The "ver" variable is type "enum ddr_info_version".  Enum types are
> dependent on the compiler but in practical terms here, "ver" is
> basically an unsigned int.  It needs to be signed for the -EINVAL
> to be handled correctly.
> 
> 

Applied, thanks!

[1/1] soc: qcom: smem: Fix signedness bug in smem_dram_parse()
      commit: 22f129fedb153a17d80b1d883a7c4dd2417cf38e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
