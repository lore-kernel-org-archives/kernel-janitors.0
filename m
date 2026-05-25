Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF83F20E4
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725894; cv=none; b=fymQZw6nWnU0hopPU+7sy8Y8IThG6IvpWgl/EmK20ekY/SiaxuFbH9sM+k7P0LThKDRtJ799lSxV1pkyHltKQCvbCH63sKnEImF+CMR0YNwdRo9yMrVxBbgZJgDjCAueygKqAnvQnoJNQGAjzzSB+V78GWAfqAmvNA5fH0UX4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725894; c=relaxed/simple;
	bh=6wzastg+LGn+AnLUSwWMIsSPm0Q/7W6xcAXZdYu344Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAwqjofZAd6zAItJFWB4lM+7SemuGyvJvh2iYbfCXl0m+VqzZj3LM1iJzkoQQqGAnd+5GY7uDxht+7xIucIUrug4ZN/eWl3A3j7p2w4XIBC8DYe8zM3vHn13ZflFbM8iMAIlh7t2vhPuVr1Xwau5vn+4LNFgECKDsyvAw/W8jCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so40433225e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 09:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779725891; x=1780330691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gd2dKhw8uPH+jWxMwt1nfkNcZ1vI2XMz+882+9WfcDc=;
        b=HfSpWAomIVd7ttpFEeqPv7+ujeLaJbPRyK43SZsEOAPYT5COdcZ73QJShZI1PGEa9B
         XzXz47P0yckygHDgZ2Hg/KGBQ2kcA6K7K9mUe7d4OP8T8H4rWEh+FStIUL2ARc2FczbQ
         i6hGdy15O50zADxcjuLgkB1aiNMg7Zw+Uulw48qTILoBGHqR1knpHiRJY4YiJ6H0lqQY
         2P0FApUuQvYSq1f6ABX+2QguR0ZxUw50n+UVPPI1/qdVfWMPtEveox1YogXTOoKPbo0q
         MDEdaRyvu0hr4PAFFEiHmPJ9Kufm0qP4XNv0SPUesJidEgwF9DzygQmkdsNRQWNJLmvK
         a7lw==
X-Forwarded-Encrypted: i=1; AFNElJ9tDCtbdzc8sySPNs1NRRSDOoAlK74E6PRzkOKhrg6xsfKcigvH+SIn1eiJ1fJ3MJfNP4fBSmzKyelnLeOyuVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtuX/flQqo6kEEDThRqIpBnXTPDew5qzBaV+5Gay4e60kDE13
	dvzHzV062iyL1FpiJErevIdPE1TCD5fkQrHHG8VMYFLN4nYXq43Y2djQ
X-Gm-Gg: Acq92OG3L+1uIR9HNbuJXAExCiPnsz2rNGs1F+HwdvAw3SmqRFlVgfG9W0xtajtj9sA
	mwPo5RyVa7pMug/sfDF3M271HxNY8PvATyDpoUkUsFGJmPkpl2B/qVWJne14ngoxbQxJ6w8IqN5
	Ne7mNkBncTuWrDZh0PLolxUllHWVsJR9qoxEJooxklWivg6nCBhU+Ztx5GOMsHxr0/h5nZdk/0/
	A8jM80vgyIvm5d4B2A7SDtfC6M2rlrgxTmuMY8FGDIsoHxIbNBozcSgrAdxHnDSgKZLe5sxv8KZ
	UY3aPJKnFLMKCn2iSgmP0Aqd5o+9zt32Rfbs8ZCsVxJwsY0GlkoJIZS99/xPZwpgTxTse1e187I
	fgnkUJJom4sh6j9MRz9B34kWc7z1piheN+PZH7bLisAV5DyvoqXZSIHbATRI39+GgxlpfW8J46g
	Tb0RnAp8S59muVa63SQrDiCFj0iw==
X-Received: by 2002:a05:600c:1f8b:b0:490:6869:9601 with SMTP id 5b1f17b1804b1-490686997b7mr55378795e9.6.1779725891357;
        Mon, 25 May 2026 09:18:11 -0700 (PDT)
Received: from gmail.com ([62.197.47.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm273760275e9.9.2026.05.25.09.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 09:18:10 -0700 (PDT)
Date: Mon, 25 May 2026 17:18:09 +0100
From: Breno Leitao <leitao@debian.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] netconsole: Constify struct
 configfs_item_operations and configfs_group_operations
Message-ID: <ahR2HxbR0ogYjkIb@gmail.com>
References: <7ff56bdb0cee826a56365f930dcdf457b44931df.1779711734.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ff56bdb0cee826a56365f930dcdf457b44931df.1779711734.git.christophe.jaillet@wanadoo.fr>

On Mon, May 25, 2026 at 02:23:00PM +0000, Christophe JAILLET wrote:
> 'struct configfs_item_operations' and 'configfs_group_operations' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   64259	  24272	    608	  89139	  15c33	drivers/net/netconsole.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   64579	  23952	    608	  89139	  15c33	drivers/net/netconsole.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Breno Leitao <leitao@debian.org>
