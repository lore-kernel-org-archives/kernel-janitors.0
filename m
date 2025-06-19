Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8466124339D
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Jun 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344604; cv=none; b=frG3mbsuJLFsNqrSoIwc0Gwx/+pWfoxWVDj9ECr7pA/t3pLfcU+JaHwi6uw8pyMZa0IJjO3syOhBfSznkXrlUnGqZCdlCoS8dgKwLQNwVRN8vHAzPZfmh8moNAdsco6764g1p2qxZqqNoeetJVKIXjW+1sQMQxAJm4Dw6kmfwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344604; c=relaxed/simple;
	bh=RmY0Xevw8TVnFstaNyUj2eJowpNdXKcRW6wC6tdkF2E=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tPj17YEc0keeUNpF12XheZpmJHaXDEyPTA2eeozN4LX0Y8CTdGDPnEI+BF7pWJ5i6vEc+gx666NZFqqS9B5uh1z9r+PuKgk86ELSfga3PFA2bjCvy1R1cBiMweOQJ+SXyx63sWq3GL23tMgDSLwnOSaQWVlUqRFvtydfvPa/VZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=K3psz1id; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="K3psz1id"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742caef5896so641929b3a.3
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Jun 2025 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750344600; x=1750949400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyLGIeI2pWRWGSJdrrn8FqSqrDl0tOwVhPMyUFPxpmE=;
        b=K3psz1idNX3kspWDOGvB0I4HG5Gwymsle511CdV00wSCotC7O3aDGY1n8D0h4A9DPk
         qTO76Hq1nFwh4Y7Dyy+nRrGDsZV/jn1xEjZgWAVMF59USMspyyh2bu3re7ynLBpNWdQD
         SUM8aeOWLmKDUefA9NMiTIWpsHPUrtS+SSnLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344600; x=1750949400;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xyLGIeI2pWRWGSJdrrn8FqSqrDl0tOwVhPMyUFPxpmE=;
        b=EehekTifjREgD5XlJ0EX+sCnjMDv7HsZeoKtXykl1N+XHRtNLjDK9iW5p2qTUGWeT2
         t/FOUJ+oAlWhdnobYrTTHnkTMFVcjo0MCN3BbJc4qQEfGwKhqspIiQGcbAs13i+DVqyg
         zFmHHH8Ra8shu9XsvssfQnP7MW+H6twABuJoWpeq2vgeiolZbGy726lYcnJhz+2aJScb
         C4aZgG5cllvWzypXSkhjqAO8VnY4IO5gVYpdNkn0OnhJjK14SbcrX9pLtoDvSQjlYu6M
         TbH75ZZM1ypwp+v62zJNYGvnWokpxOKotdflqh4bnIbGHgY43h9LTZpt05wqCMB/FM4J
         4R8A==
X-Gm-Message-State: AOJu0YxyNg5OvSaIdyVJ2PAInqAggaFfaAzWkMelumQ+csCpbyz4zmwB
	Q/ZS5IVnd0WpcmcmX9Q0HHWYRQFqdjwomdCr1LkH0bWJHIyAZwbye0YhCl3RwI9kjYz3UoJqfOR
	gtEH1Xg==
X-Gm-Gg: ASbGnctA3F18G0v+02eOpfc6p/yyi4D3zldExmIP7V1alcm5ZldAbbAmLF+HeypI/s9
	SNtxuhCv4y04uL6dSJkQ2RvOSLXUakXWqtlLYJXsdP2GYq0wq0pZE5t88gJWyky1FDasCT4EkGb
	DwMwFXBv9xNp/mZ3W8j8E1bWuBRFg8bqwg2LIoZDOUeccyFoRT+KrwTfc9IBZbYNfY6h+3CJSGo
	b99Cb3Lv7ogyDKFHyd6DlpVP1NfAfEfHRAEDtcUVoP/LB9cj7eIojNLo0rayYrgs159HvZ2Be5T
	g3lu6u+GeBZrG4/87k7u1kgZSpy4zQjDz1RpB/o0DwiR7BQ17jbctiNfHgI4rdxP47S4gDajcYD
	XLQSKw7oKPk/NMHueo1do6fPfumb01W4I4E4=
X-Google-Smtp-Source: AGHT+IE0IABp03aQi/MMdsx50TsZhfjlS77ZjBf2ZnkWRLyJkwYN80FXKFOnWqqtHBqMUe2X9qwO7Q==
X-Received: by 2002:a05:6a00:228b:b0:748:fb7c:bbe0 with SMTP id d2e1a72fcca58-748fb7cc2d2mr4770370b3a.24.1750344599760;
        Thu, 19 Jun 2025 07:49:59 -0700 (PDT)
Received: from [10.229.43.247] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b569sm84792b3a.20.2025.06.19.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 07:49:59 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Colin Ian King <colin.i.king@gmail.com>, Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 19 Jun 2025 16:49:53 +0200
Message-ID: <19788aaee68.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250619082554.1834654-1-colin.i.king@gmail.com>
References: <20250619082554.1834654-1-colin.i.king@gmail.com>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [PATCH][next] wifi: brcmfmac: Make read-only array cfg_offset static const
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 19, 2025 10:26:15 AM Colin Ian King <colin.i.king@gmail.com> wrote:

> Don't populate the read-only array cfg_offset on the stack at run time,
> instead make it static const.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> .../broadcom/brcm80211/brcmfmac/pcie.c        | 24 ++++++++++---------
> 1 file changed, 13 insertions(+), 11 deletions(-)


