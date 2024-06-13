Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652C135A69
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718302910; cv=none; b=PcMgOGc6TbHccJg69Iclii0XVW688lygJQxBrwks1FpbZYRqVmY+zhc14p6LGJ5dOPVOJ9KARQMlPLYYrk9Vz3WZmc5malSppWw40a2rkrPaQiQYvbJXMI6aCGGYWkKAVKiyDsIm0PEZz8+O1XEsh6g9o6oHAs1jIE/9w7XSSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718302910; c=relaxed/simple;
	bh=Eg3PsnHVSYuLn+uKCQz7YExSHrr2gIhjUaFUT+0OM7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmBuqBsFRZsuJupvStI1W/I7XEcE9MrRL5ebjq3KGmzqlOjiDhtCrBr+HNQM7aEyKjbGY5qHst7XWSV6R6Kv4+OU8JtJ6lTdBS/30MLfvhmdLQ0wuupv/2qr0NiZPFqskcGU2DLZhvZ1PG194gu9C4YdcGCQC8yhQlBPc+hereo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUK9ZmP+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUK9ZmP+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso15761905e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718302907; x=1718907707; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUxyMjU71ZE+fUPetZ6OJeVBxDmLzc8mtYCL3gsGt3s=;
        b=lUK9ZmP+mAfBhy+5w0FZ/fWbkMITJqtWW0NAaRfyZPeTfXL5jMAr7mYStE/wl5KrVU
         hy0a6wTwzMN+vD1BTuIx8U7aejrTiiqIFNDNkIEIugTpPXNmolkslgBoicXnEOtmI110
         uN0iBiNNX1tHzgPjJREin7VYCd2i0iEfM2BoPZKeoQb4RrtP1FW0vS88pKKzIrufyO46
         Coi6hOXVptR4SYI0eEDQ0AEJckgs57x7cYEDWe5YpQ+HpEnIOkgGzvv83XMHkh9iJvB5
         XU4AbAwdPBXHRFa526OTRiRga5uafHCkgJX4gsS90DWKDvA0Vrk01n1bUjEahNtDfVwv
         1YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718302907; x=1718907707;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUxyMjU71ZE+fUPetZ6OJeVBxDmLzc8mtYCL3gsGt3s=;
        b=rXW+iXP7xDrtCk4rZePb2OUlGD3ebQWERQmJ7pKt+CX6VWmZ6sFic5uSVMfyFlBojC
         mJmftpjK0boFp3g2az2HZNHepA95IK7HpJKPjSN/Sp/3VpH2kTSJ6lkTjIodg1QBh+wg
         Rfr0o70JU6/a3wvqK7UG/9ndCs6sMu7ufgilYfbPipigY6dZzHtoH6qkVi9Tx9k16VUw
         IsrBJ1aM1IqqzthkDaY5Kz07DiOdo4EkQwU0UGTnQq57cL9WXhP5DJpaeAfbHS0NanpJ
         XKO1vyYdDuA0d7mjZ1XlmGWy2peEOFNEtMY200oILv4bC6kj+eHb+j6m/4hZiFPJJt9a
         IV+g==
X-Forwarded-Encrypted: i=1; AJvYcCXm/55N9gB8grPA5tDC36SieixU/hSA0uCqw6DihtSF0xXop/oONWN3gPNyJs7+nMdWgTsNPOLN52tQjR7T0ike2mgU1r9ZcewfNW+vCnC5
X-Gm-Message-State: AOJu0YwBp5qYD0q/SBi4wvSaj+Txkv0vLWSJvgxUtSncn/UOdBvzKaVm
	E3aZqL0Fkpu8PmPRZ+0/i915+gygNy+5zTQ61vLOjmZwldbRbUsp+rd0a/jXyio=
X-Google-Smtp-Source: AGHT+IHE8xPRTkTbm1KPshLdZzNhvmcmIrYIfPgMiJtdCnz+qehS2fJwkgES/YPzH7zgsVHVrvOTGQ==
X-Received: by 2002:a05:600c:4506:b0:421:392b:7e13 with SMTP id 5b1f17b1804b1-422b6dc80c2mr39801835e9.4.1718302907122;
        Thu, 13 Jun 2024 11:21:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a5b4sm33163135e9.41.2024.06.13.11.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 11:21:46 -0700 (PDT)
Date: Thu, 13 Jun 2024 21:21:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Hyunwoo Kim <v4bel@theori.io>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] atm: clean up a put_user() calls
Message-ID: <04a018e8-7433-4f67-8ddd-9357a0114f87@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Unlike copy_from_user(), put_user() and get_user() return -EFAULT on
error.  Use the error code directly instead of setting it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/atm/ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/atm/ioctl.c b/net/atm/ioctl.c
index f81f8d56f5c0..0f7a39aeccc8 100644
--- a/net/atm/ioctl.c
+++ b/net/atm/ioctl.c
@@ -68,7 +68,7 @@ static int do_vcc_ioctl(struct socket *sock, unsigned int cmd,
 			goto done;
 		}
 		error = put_user(sk->sk_sndbuf - sk_wmem_alloc_get(sk),
-				 (int __user *)argp) ? -EFAULT : 0;
+				 (int __user *)argp);
 		goto done;
 	case SIOCINQ:
 	{
@@ -83,7 +83,7 @@ static int do_vcc_ioctl(struct socket *sock, unsigned int cmd,
 		skb = skb_peek(&sk->sk_receive_queue);
 		amount = skb ? skb->len : 0;
 		spin_unlock_irq(&sk->sk_receive_queue.lock);
-		error = put_user(amount, (int __user *)argp) ? -EFAULT : 0;
+		error = put_user(amount, (int __user *)argp);
 		goto done;
 	}
 	case ATM_SETSC:
-- 
2.43.0

