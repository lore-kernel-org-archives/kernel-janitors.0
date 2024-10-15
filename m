Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83D8146588
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728991983; cv=none; b=WDJ/vvjxx+FWpttS7lHRo9cVHVFT0i0cyFhlezmrCmFZJVzKdyiS+zQZEWKQ+0qyl5TrZ3ubpox4hqLmJQwsXCowHwWvXyC6P4HMTX2AqpOQ2Vjulp0mNgqpTag2QAyhQeblYl2ACv2sbDKvrYHLzVHFjabdy5A59yWyL9tvC8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728991983; c=relaxed/simple;
	bh=4LJhOFliEGCYJeXPJjq9rcUD45sfo6k8OvuueXwJPNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIAJwulPX+KC3+xzVlQ8ErFj9upjdtOSIiICMmn0vbO961u7NU8Di3+wtEaYs8owX9EooJrHl4OTvYbexcpBddJGNLHC75XP/XbPdwrrHqkxflQWH+n6N4oAfDjcNcU+ukGR5FpXbNwIOZRBPuAwyK50gpa9D95Bw6ELX0OrY4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aCXFZCqg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aCXFZCqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728991980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HGIkCUj4P3GarxgLwJxQhDbXDAu8fFAFismcPS1kbs=;
	b=aCXFZCqgc/97wXkszn6KCFesGptpNwFlxI3HLlv/BQGoLanD0HJTGYF5G0aYksGMSXvRu5
	4XZLh9p2NwOFmanED4KPd1mTldzXSDBSVasjyDZEQHH9OZEclhZosUl9W4S2aj5U7TFr3x
	CbC1wd6BywYMR5hXTNoFXh7Ybebi4WI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-7hs50sawM6-KB2yJnMx_4A-1; Tue, 15 Oct 2024 07:32:59 -0400
X-MC-Unique: 7hs50sawM6-KB2yJnMx_4A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d47fdbbd6so2456740f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 04:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728991978; x=1729596778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HGIkCUj4P3GarxgLwJxQhDbXDAu8fFAFismcPS1kbs=;
        b=gimrjl7LoILZxh3D3Er/Kwz3MFt7zmZaDTr9Zyx+GXsHAmpHxKKgub6cwBMvrgvuhw
         UjB/PW/8AtWDz6Z7DMz4fQ0WMoH6a9BGim5nOXZe8RHVhgY9L2qf9DAjz4uCj5TYwjfQ
         EGdjRwOLCsMyblvIuTKdaSNvqxWmqZ+3XqXOf8WaczW0DBjeipThoqZaS/IJS7ICfvYE
         g8czkmRM8W/NRLx7U1ts6o2idHD7bn7OSslXD/GRiKKA4++Zokf4K8BXntG+faswv61b
         xh/C/3XHIMBpJ1qIrmkAdQ7r68nUXpz6byjaN4lExdhjybs3++MK0bk3UNxx2BKtPDjc
         w9YA==
X-Gm-Message-State: AOJu0Yx0lK9G330mmwY6UOxppCm9H3F5DN5ZU/f88Wws5aCbDAM/fVSj
	EnXzCpd9hpg0Vxqk/Jj2ED5LPSSpFWZ13Yc9f2pXQpNmk6XDzwBMPuasVv2fHpzVNyXf7kzRD0A
	FdC8zNFP46zousCHeNuDG5FiUxpXgWG55rgmRt/RTj2Hrc8wKRBKCDa32+vteDX0gwg==
X-Received: by 2002:adf:e88b:0:b0:37d:4cd6:6f2b with SMTP id ffacd0b85a97d-37d551d2566mr8948108f8f.14.1728991978134;
        Tue, 15 Oct 2024 04:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0OIgcZteYdJmzz82U4QRQMqjjMjSGyiYZpdCbwV+aF+nP0JM4GQJ9u+1zyEL5Auz8eFwycg==
X-Received: by 2002:adf:e88b:0:b0:37d:4cd6:6f2b with SMTP id ffacd0b85a97d-37d551d2566mr8948093f8f.14.1728991977737;
        Tue, 15 Oct 2024 04:32:57 -0700 (PDT)
Received: from [192.168.88.248] (146-241-22-245.dyn.eolo.it. [146.241.22.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc411fbsm1332551f8f.107.2024.10.15.04.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 04:32:57 -0700 (PDT)
Message-ID: <d2cef2e4-d697-456f-8893-57f29ad17f3b@redhat.com>
Date: Tue, 15 Oct 2024 13:32:55 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next][V2] octeontx2-af: Fix potential integer overflows
 on integer shifts
To: Colin Ian King <colin.i.king@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
 hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Naveen Mamindlapalli <naveenm@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241010154519.768785-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241010154519.768785-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 17:45, Colin Ian King wrote:
> The left shift int 32 bit integer constants 1 is evaluated using 32 bit
> arithmetic and then assigned to a 64 bit unsigned integer. In the case
> where the shift is 32 or more this can lead to an overflow. Avoid this
> by shifting using the BIT_ULL macro instead.
> 
> Fixes: 019aba04f08c ("octeontx2-af: Modify SMQ flush sequence to drop packets")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> 
> V2: Fix both (1 << i) shifts, thanks to Dan Carpenter for spotting the
>      second shift that I overlooked in the first patch.

The blamed commit is in the 'net' tree already, I'm applying the patch 
there.

Cheers,

Paolo

