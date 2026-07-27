Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7483E5A2A
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2026 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151968; cv=none; b=stTQLPbzoStmKPFccy5MT8ykkvZpID3BOW0IwxABGiFtoDdD8/Bjiv0dxGjlDURX3Os6x0gx4bIT4FkWsKFgT9e85x2oLAAaugz+IwqjWI6iQ9brePYNIXPr/mQu+yygW8wsyzHKcDvtF7TCQffwmrWPPIT1b3b7p+Ycu/qFjW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151968; c=relaxed/simple;
	bh=U+dkbR7/dqwY+nTWh/oI8knR7yS6an6E3JNdGT0FQcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DswyFlX2o3wdpV0SJzy0Wt8gBiDzIn1Co98xCDEe8YUXiWzYeRNaX6bOtBxRwZ7el8n3OzH/b5k+hHQ1oeG7B9flunoHfh4bBYKhYkfIFbJyPMAnB41qXrtGIEokszKxgw3d17CnWzGNdLXvazKYgePVt3vYr7f4Zsg/3snquqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1Qtf1Fx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1Qtf1Fx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2526939b3a.1
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Jul 2026 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785151966; x=1785756766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEenGUm5RioXWNnfd2RzwGu/SqP7QkoWXITZGeqYw+o=;
        b=s1Qtf1FxxNtIeGzM8irC3K1mBFITPGI1F7K4PWiCCs3GB6/dVLapNFfhPUfxTKekVP
         Ay+zZD9o3n4YvSBSJnApmHXTrIbSo+iW1q8fbOTsjtdfZq9ur3HSzPKF0ruwRYGWSgaq
         DLEupOJPih9jz2ySkC0s4K5S15oz9a+AL8DZ5AYqdm0iSJoswG9eeKn6jxxUFraqn7MR
         In7bwx62k4a09MOHwhK03svDdzRSwv9Lza4pbxOy8KcZD5OVycWhri8EpSX3sNZjCZ2t
         eTfG8eXn/ZIMvjMRJodpsMBCtnS7/ezaQhWqQmuNasp1Sv1bC8iAh4LNZUi9/IyqbwuS
         L8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151966; x=1785756766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zEenGUm5RioXWNnfd2RzwGu/SqP7QkoWXITZGeqYw+o=;
        b=cMKx3aLA07iOL/bs2h3pIn0pWe4kq8x8Z418tRe+3uwcJTTXdybPA8jJtOf6MslAP7
         m/dWIkmlNjRtZowxPa/mIiGILil8QHkbr42ycrD/KYIR822+pod/mqDhHe0AP1mYiTyR
         t24meL1CIHp4saZEl5TfoPr/U5nlYJeaUIMWvVAIL8xPnYoHaVaoc4L4Dnx5ljOes0tO
         J03KTtDLA/HgZARja5t7ny50gm5gEVJ1O5s0kDHZsF0xZbtpMcIyPTr2lyyXdWb3HtWE
         hNbTyLpDyOk1HU+SSp4mAfnYsUf4SpIUiDkRw2VVqI6BsWfZzrXgKpFtL6hWdFgV8FVd
         Ue6g==
X-Forwarded-Encrypted: i=1; AHgh+RpF96An2ZptWjHkx/L0SFSB1E93SSf48UX+QTZ+cs+aGv0KwdVvzDoHeNRlTjgQmrbvXUHp1M1sq7SKrixAdbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWaafvOtbAfEGBerqVwp4rBEAf0wUnghM8fb8w9sJNYPc0e2HR
	7hSNSGmuk6R7W90ChICDQV9sQvqnvpQIMcLOfJ3Q1mvJ14w9YAAvi1PA
X-Gm-Gg: AR+sD13Pbr0wzz8OdZVlBVnjcHnyCpLTyv7wkm0OkvK+EwNQqJXNsfDzR/hj8aA0boh
	oZhHiJM1eELFNnEieIH9VRyLSvlEiw+eek1/aIWHAvUa3vaoKkfTO9hCA7gfEYjAioEHGjeRRwe
	/t9rbsiNMikW9W55ONr0v9N4BJF07yR4JW5G9N7742k9lFOrhvFxqJ/3cuxaWao72HIvQRPA5Cv
	X4x4KOmZWcTtaxKtgBuNui3q310lKAcsNq96WcbCGRlfi/gViWkUaet7ij+JuRb83xm0gOQuyG8
	L2UJaIaUHYHoN/03BPSmpTTjccnByACt7c0ik7qUnLfzb+iVC9eyHVdJxjJt8h1tabMCLlUm3Gq
	vwB8SPShjB9jqIWph4OAOoP/Q47GmBesh0OiTAmWCXPyf5ea9+vE9o1a1TuedQ2PyLzK2O/ac6U
	qpHpIq1Ak=
X-Received: by 2002:a05:6a00:f03:b0:848:469b:3d19 with SMTP id d2e1a72fcca58-84e59462fcemr6582221b3a.29.1785151966109;
        Mon, 27 Jul 2026 04:32:46 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53253d70sm2900157b3a.2.2026.07.27.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 04:32:45 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:32:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <chleroy@kernel.org>,
	Roy Pledge <Roy.Pledge@nxp.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: fsl: dpio: Use scope-based resource
 management in dpaa2_io_create()
Message-ID: <amdB2K43gRBDhBPI@stanley.mountain>
References: <690827f2-e746-4378-bb7c-9948cd69dc15@web.de>
 <d95d2f4c-f3cf-44eb-b61b-79ba7891674d@kernel.org>
 <d2e5df25-c8b7-4ee6-8ebf-1725542baabd@web.de>
 <f47abd6e-9337-404c-a24f-39a9dd7454d2@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f47abd6e-9337-404c-a24f-39a9dd7454d2@web.de>

On Mon, Jul 06, 2026 at 12:40:09PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 6 Jul 2026 11:18:39 +0200
> 
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> Introduce __cleanup() based infrastructure").
> 
> * Thus use the attribute “__free(kfree)”.
> 
> * Omit two kfree() calls accordingly.
> 
> * Reduce the scopes for the local variables “obj”
>   and “qman_256_cycles_per_ns”.

Why?  No one does this except bcachefs and that was removed.

regards,
dan carpenter


