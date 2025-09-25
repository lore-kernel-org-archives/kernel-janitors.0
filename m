Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1B288D6
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Sep 2025 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807887; cv=none; b=i1RdnY0rpbu+AWU7KsTZFVhW92JHVrg0YX1C54PKqn4hhEVqDaGUszxRdVe5iEp6Cwss5YFrmdMFm9FIn5i34hUdzUVERr2DUQD1VIXwobMC54Ae1dJ/s8OJ/22DxAmG20wEZ9Gckf1vytqTwN23Veh1gHZVlXfC0ftqU1Hea6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807887; c=relaxed/simple;
	bh=gRLtCn/9YLyB0zWqN8PZsgBFqGS4K+6T6CbzUaBFmU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDzVvyTGDlalomIh04+9aNNV9tQfzf/wwRcMgxvw1X+3Q6EhS7zWFFjDTtEZKyaXOZrR92jfnthXbisMLk2KXBjr7BugDzhYnRrnuPnDNshBo+TeFpyND600wERB5Hfrowc2scFfPUupLhqU16F37wdVFDyKypGUNxPVDGcgwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GzwyHzTU; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GzwyHzTU"
Message-ID: <977f1b63-1617-447a-8ef8-775662ad0827@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758807872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PzbRKSk93f9Ztt0ubkW/2QbayTmgWgmgzFIGYPs3WjU=;
	b=GzwyHzTUM/8PxdEVH2O9dMuKgdnSm+lJ2RwLNb7nrKPh2uLFR17k3nizaOhBcYtWoQJb0v
	WhUpfEF2kku+dEyhgYUdx1ap358cUvkIQBOXzedxKbc9ImbAwszumhhYyXUTorFUYrwU6k
	ev5wyE/T8vn5kmN3PRJInKZTiPAL300=
Date: Thu, 25 Sep 2025 14:44:24 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 net-next] dpll: zl3073x: Fix double free in
 zl3073x_devlink_flash_update()
To: Dan Carpenter <dan.carpenter@linaro.org>, Ivan Vecera <ivecera@redhat.com>
Cc: Prathosh Satish <Prathosh.Satish@microchip.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aNVDbcIQq4RmU_fl@stanley.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <aNVDbcIQq4RmU_fl@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 25/09/2025 14:28, Dan Carpenter wrote:
> The zl3073x_devlink_flash_prepare() function calls zl3073x_fw_free() and
> the caller, zl3073x_devlink_flash_update(), also calls that same free
> function so it leads to a double free.  Delete the extra free.
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
