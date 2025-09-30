Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0225A326
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759255043; cv=none; b=kI5HHU0hE8VOI2vmU42jiNFIguyIaBSUi99GXAdR4GdW/v70f1Y6GfRFprRkXHnOkM7Lpn3IGa6OH+IMNnh78nxBTQbFDPCUNyWvluGEZOL0dxv+6fjTL55qg4rL1JnBJICjd1e6AfxMz35o5Qtzg84mF05hJZkn0v7fL3Vjo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759255043; c=relaxed/simple;
	bh=Max6oYjp5D3qbRhClZcpeQqxWWduSdPHmYSu58K+hus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IgOo4Ke4GD2thtvo0Q8og2UI0KvyGA9cMKzRY1vXa7/Vc5GCkh6hwxq+liciZyBRtsKGsqI3ZaU26GDPKs13zjgkq+bXXu5A7IFl7BmXR/9496K+FMHboQufVOkNWBmZlJqUgqs1NoI0pIq/+Dr21LVOHHz1oVh+QxoV2FZXRnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkD2B7BD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkD2B7BD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso47360135e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759255039; x=1759859839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5CCkw5Or1/60aBNkinJ1VyW5i1CU/eQk87PDDXRRxyo=;
        b=nkD2B7BDh/vlGQ1MrPvmOQ6JjZ6/e/sZwGoWbUrKMfvCqDeIo5UqEynHMSC3vig3v4
         yxYcQT/nPsgdAgkTLZVL0WABCdpdrP5Iqm49dgWti2MsZMoEzgDav+ZKu5j7if3E+JT1
         ddmc4p1Z5emXkAtO0n1pZt0Wmj13VMv7zjSqn6qiW1EtSaToEhUS+Zjcb0fKno6achbY
         Bsu/olyzcuXTY7hRt3FFr9bDeA3dVeFGPYtC4CkAgBS2vdMdYbzy3PS3Fh/AZwvkCfjv
         9tl9O9D2j4qe/Ydlbo0N4Ex+vIrzgPApj9t3jpNx/pYcRiFeMahJO64UP7/PnAZrIiYa
         +sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759255039; x=1759859839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5CCkw5Or1/60aBNkinJ1VyW5i1CU/eQk87PDDXRRxyo=;
        b=mJwuEwBDPjWkQWKUG/xx6LFumzFBFOEzIHpvxtnWmnubOX6rZAw+MjYqRE2AOrtKAM
         0iIjHlfKaTMvkYvLOhQZZPxJnAkvuMCsXJQtKoLSfOmYt8lMMZZRWLToVSdK8CikC7ZZ
         mDkcpsi6vKjV99d+kdtazNgJeSMqGdmQk6Gzh9xThCKKKcsECo5C7LshgKJuBuqkBMTr
         cg9rDvYS0x3DIR6CrkPTcrzfAJPSoeUYL+SzhivVe83ylMuS+W+kKxg/IWSZ7jpFj2VH
         aHgWp1JLDg021v6X8SlevRzsZ2j80Y0pkWy91lNZQXtKrIl0g6IncVxF7XlOhU6A1UlM
         Hv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUous+OdmeKsx37q2KOO1P69hYTUQNdmsvvR0BruRtYHp135CZdgbw+1oKDsYhv4CsUyQXMYXSWHkUIhAoZ7ck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr3NLEk3RHi1LURjiDaoE7TKYF5kDW31Da5SXSBi/CRzazoPca
	mTbngBoT0CkGNJmkCArNd6QI4n8uizFtgryuGofLine9mLEVdclyQmWB
X-Gm-Gg: ASbGncsqUFtvcvqI8EKPC8u3kIbC4kIY6WlSuHpDdWK/sIhXd0UTd0zHGP4PQ2mW3QK
	WGlskWM4OoPPxhSPj1CS6gVOljKXP+6+T7Yth4JjVMzR1WFoUFTn561PtA/LHAsEvjaCNmM7TUe
	/aQMzvKtIq6ne3ABYq489n8IPkKpe5+VW5GWtcpawfEDLYkmp7eZOANXZCbGAOr/68mcqzHGfw3
	1XsBYvEpvc9ExHtm0aDcFNswuCJBvaW6EWcr1HWVmIF1Aoe+NtaV5nwotdAd4nxXhM43zxua/y+
	pjy+LAz2u2Kb66b+G3uo5vkkpp9oXXhGEAsmCESKrwqBKbNeWQaCZXoG2940KkCIbCybQOKj88e
	TTWfKaGncOVqOx4TjPYTVua04C7zNz4vKGV0NrMz8JKPl/FsmBHASeh+qvwH8z0NyGDrCda/vOA
	aOZG2A
X-Google-Smtp-Source: AGHT+IGBw6qgNhEgcsqcE8zCMkDf2TtpGxLfDO0oRgvvd6iJf8l8nQoTud6qKNRaSJSlCEwWdeeWoA==
X-Received: by 2002:a05:600c:348a:b0:46e:3dc3:b645 with SMTP id 5b1f17b1804b1-46e61260525mr6798605e9.3.1759255039290;
        Tue, 30 Sep 2025 10:57:19 -0700 (PDT)
Received: from [10.221.203.31] ([165.85.126.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb89065b5sm23488437f8f.17.2025.09.30.10.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 10:57:18 -0700 (PDT)
Message-ID: <8b34f81e-86a3-4412-828f-39f0419b98c9@gmail.com>
Date: Tue, 30 Sep 2025 20:57:17 +0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/mlx4: prevent potential use after free in
 mlx4_en_do_uc_filter()
To: Dan Carpenter <dan.carpenter@linaro.org>, Yan Burman <yanb@mellanox.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Amir Vadai <amirv@mellanox.com>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aNvMHX4g8RksFFvV@stanley.mountain>
Content-Language: en-US
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <aNvMHX4g8RksFFvV@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/09/2025 15:25, Dan Carpenter wrote:
> Print "entry->mac" before freeing "entry".  The "entry" pointer is
> freed with kfree_rcu() so it's unlikely that we would trigger this
> in real life, but it's safer to re-order it.
> 
> Fixes: cc5387f7346a ("net/mlx4_en: Add unicast MAC filtering")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/net/ethernet/mellanox/mlx4/en_netdev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> index d2071aff7b8f..308b4458e0d4 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
> @@ -1180,9 +1180,9 @@ static void mlx4_en_do_uc_filter(struct mlx4_en_priv *priv,
>   				mlx4_unregister_mac(mdev->dev, priv->port, mac);
>   
>   				hlist_del_rcu(&entry->hlist);
> -				kfree_rcu(entry, rcu);
>   				en_dbg(DRV, priv, "Removed MAC %pM on port:%d\n",
>   				       entry->mac, priv->port);
> +				kfree_rcu(entry, rcu);
>   				++removed;
>   			}
>   		}

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks for your patch.
