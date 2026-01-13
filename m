Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED035CB7F;
	Tue, 13 Jan 2026 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303767; cv=none; b=jYtIE/dVZLt80LdthPkoENbXL2wYnKCplsjw3AP5kHmbdKK3J8ygpMDOkY4e7CRF4M6zEu4LhKlenQcFjfwA5Uxwuz7D93q1OuYfvNLQM5Horaqvf/Gj99m0RWQvJBnFZeQPZfVJ3JNf/KUqvnZYCcBpwxCyuIYyBwJQrgKCKnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303767; c=relaxed/simple;
	bh=I9bRCWprr8G3noUKSistuEk+ABAmZUJFanXOb9/Rb0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kx5KI+691QX5v5IC1MyfqJhuM3BscVNU+dcryIqIWoFNPJAj2BzkC7rbLK703bnJsFYo37fADKVlq6n4L9uf5zE+excCkiUXWsVq2v6lMF9xCctxw/1mCBluZhloyVzdKq5qab0ix0uGIDHc4KwKDnRDNigZrEuPFXoYoqwGU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObnYfWtY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObnYfWtY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F99C116C6;
	Tue, 13 Jan 2026 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768303766;
	bh=I9bRCWprr8G3noUKSistuEk+ABAmZUJFanXOb9/Rb0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ObnYfWtY/z9fRA0yz9vxRpL96ScPCkFjMHCFjSuj3z39f2PCzcbekNoyQv/kXnZvX
	 4v2YtwWLZBH04DS5ndfDlKoiC9ikOKkOqoH/D41yOwwW8zvYRXhp9zc+9GYABpNjdL
	 nknxsUuLsvf6rxKZjLR6roIWEr44pkVTm/ofR0SPDidt/V9945ZDiYBeZ4Aau2kYnO
	 8RNR4MBYCWzx2Dacj4e8dLrCdwbFLE1V9OCt80/L7Ydg4ziyYQ8vYmGUrD5FGf/dSh
	 HOaDPpTTqfAiQIQ8jp/8ZCcEpF3/KfQA2VAwkdq6uWeZxUeUbwdFXDgLv8O44SQaYT
	 pUIcJBll4Y2wg==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
 error27@gmail.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave
 IDs
Message-Id: <176830376359.826049.1740927035022094922.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 16:59:23 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 10 Jan 2026 12:19:58 -0800, Harshit Mogalapalli wrote:
> ida_alloc_max() interprets its max argument as inclusive.
> 
> Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> allocated, but the IRQ domain created for the bus is sized for IDs
> 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> ends up with an invalid IRQ mapping.
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus: fix off-by-one when allocating slave IDs
      commit: 12d4fd9a657174496677cff2841315090f1c11fc

Best regards,
-- 
~Vinod


