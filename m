Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3511344D02F
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383420; cv=none; b=CjaL5BsHH8gdNGmCXld2WptY9YHbgnasH64zs6rmioJER2/JeSqMkX8Y0xU3NIrirIWwB7ozSAKHfFVq+3LeRb97B6A9CuwcziXgcqoPqclU7hUSwBNBdWnvuvwFl0L0KXzv8cMGnhypAEWzHMQtDH57bGVOjIVOSLIVDg8iGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383420; c=relaxed/simple;
	bh=omKdTqW56cQNgMCJYhjGQoBYjcJDylgCWQlF/x9N2vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqvoVsRI5r80lhu3ZDWkRqDJCwllrL6B7SMbGdHqxMzXxwfyTHZ3JGi5mkwRFiw106Gx1mVWj9/8IbQx5opoZgl7vNPscfpcgvTBwBZP0a3rZ0n/7EH9a6cc0HfZFPgnQkfVRvgsuZUR86b4soJXbDAhjJXsV27HwImD8xaSVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csFU2Z6q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csFU2Z6q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so104075515e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383418; x=1777988218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GaLbgtCyLwXTc2vjiwqYx7+YT/HZgQXbQZLJbUSF57E=;
        b=csFU2Z6qErP0/paUJ7Hl7tDR6JuhOJqW0pA8OCcLHOH2OT6ItnznkCZ66P4fCPmf/M
         kPyNXSO6yTEohjTVgFJFylAySVTZTMoctH/KhPqjND3K7yC9aY2ZSDMuewiXpHeGiskr
         CvWwWB8n1ttbE8Oc3L+mj7ylfyX6G4fqIDmDk803XuK40SlFDkq4HvGV4V2P6Ht1ZGF/
         HliMf6BWdwCeToH9wBoFau5dfLbgJwhWSb9WR+HGg0/hM3ASWHbkug1lTmf33ZCLlB5D
         8NXQwpedPORrv1rUl0UrI+g7Xom7Z9RXQRshuc4/8AbMwiG/Oh5Lvdpd6hzbmJtzFm5e
         YdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383418; x=1777988218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaLbgtCyLwXTc2vjiwqYx7+YT/HZgQXbQZLJbUSF57E=;
        b=Buy9iEA00uJUO+BBRHtnXg1bsHEdKrySXkON0untVuX1CX8EpfLHrF9oaP4WG43dJI
         P9ynFLOPnwn5S5nowX4ss0pvrBeTzPiWUhwfavNuGf0nmYqlVT6gNfbHJXbpY+7x6xco
         5wDOnJgxlyBoXP1nqvDZ5pQMITBCmn22ZiTT52MnXqU6xbkaQeELqr9ycwbAbTGgb0ls
         r5ufTd9ArdSmPmj+Z4xyktXilqqRAXS2tzOqECk5GAGovVTwQdg4FC4Jb1BsN+H+9I+d
         zsKYPh0DpV8mjzopzbOtsHNjGjZnBpeOvH0/MlNfnc/05Re9UziWAdQ7orEPEOwSBp/m
         3htw==
X-Forwarded-Encrypted: i=1; AFNElJ8/qdntOZj/+W9RKE5nQliUsvjUAFWkW07q+yYOnsOLVEq3X4Mdyf4cV4Vs8Hkr4eCS/0sm+IOLj6WM/yW375M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwouEjwHQvSqB1hPJJzVUvz4VRT2MfZbQHAZH6N/a2UTzNdElxK
	kL7WyZsERTMJA+YACl3iNgSoydrHQPYygWANkQ9zo4kIDnJ7pY+OyfQz
X-Gm-Gg: AeBDieuZjN878SDGFrjE4hjP/aGiah38s04ISYxV+ErCyXGUEBK9FTPXx4qn7O3QjyK
	nTxixhb9cmOlIJeSTXZCU5+DHiQV4s2gf64YEViEYlrZJjfgRLl7in034NFeozrt+T38Q205zzH
	UCmLDD33NGzWQzp1Kdljk+alr7fU/yrQhQrp6Tt+AAtj+Lf6di5ujfdgGfRTQFDCT4iOiep9IVo
	wky6OlxibTZQ+J6wOd9jim302SlxtrsQgH2v+yj9BTzV5/kcdLFS1QLpWgmuL+tHT9ds6zQFAi4
	47MevGMDe+xIfuVrkrHc5F6vaWlcKNjOAmOQpPQA3+IskfDcw6xvtZz4b+LECIUmG7a/tCDYuga
	NQf+xBBhY1n3cuQWx/KHynGjWS4Xk6byAl7PBMh/hM/Zl4yn7Jw21JWucac/OInnp4gLt729sAP
	xzN23q/DVCUMi2/psbZtMiIYUWeaoJVakIfLYi3cI0DA5b+pPSuBPWQawptcbnriS5kJj86opw2
	h7HpRVkaYJK8Ih3IPxxmaTc
X-Received: by 2002:a05:600c:8b4c:b0:48a:65ad:1881 with SMTP id 5b1f17b1804b1-48a77af28f1mr52177695e9.13.1777383417437;
        Tue, 28 Apr 2026 06:36:57 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463ff5a1acsm6284374f8f.33.2026.04.28.06.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:36:56 -0700 (PDT)
Message-ID: <0dd0c884-c846-4f17-986d-fb24b21a836f@gmail.com>
Date: Tue, 28 Apr 2026 14:36:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] sfc: fix error code in
 efx_devlink_info_running_versions()
To: Dan Carpenter <error27@gmail.com>,
 Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Martin Habets <habetsm.xilinx@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aeyEzO6C-v6J1VHH@stanley.mountain>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <aeyEzO6C-v6J1VHH@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2026 10:09, Dan Carpenter wrote:
> Return -EINVAL if efx_mcdi_rpc() doesn't return enough space.
> 
> Fixes: 14743ddd2495 ("sfc: add devlink info support for ef100")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/net/ethernet/sfc/efx_devlink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/sfc/efx_devlink.c b/drivers/net/ethernet/sfc/efx_devlink.c
> index d842c60dfc10..45f412bb9b5d 100644
> --- a/drivers/net/ethernet/sfc/efx_devlink.c
> +++ b/drivers/net/ethernet/sfc/efx_devlink.c
> @@ -531,7 +531,7 @@ static int efx_devlink_info_running_versions(struct efx_nic *efx,
>  	if (rc || outlength < MC_CMD_GET_VERSION_OUT_LEN) {
>  		netif_err(efx, drv, efx->net_dev,
>  			  "mcdi MC_CMD_GET_VERSION failed\n");
> -		return rc;
> +		return rc ?: -EINVAL;
>  	}
>  
>  	/* Handle previous output */

Usual practice in sfc is to use -EIO for 'MC response was too short'; it
 signifies misbehaviour from the hardware, not any invalid input argument
 as -EINVAL would suggest.
Other than that, looks fine.

-ed
