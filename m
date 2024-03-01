Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473B7002C
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Mar 2024 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709308531; cv=none; b=UcUR9FgOTu5itgj00Wlc76cvfVp/iSvP87jroqLbtua1DNY0bKX+hR8ToEEthNgwUT4rC8d2stEx6ncdOuypOnlHz602WHi/a5EGEilZ6ixLavIPCoWMk3QqbUn+6D36uTjq0BItegiwrdBWAum/CLnORRJm4jSd/LLBt4KZDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709308531; c=relaxed/simple;
	bh=zi0bk5Cs+q7geBC6wE4n/dJCyCKURk4w3ELa9Zvu7s4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UJjeY4leXsdHGptoY3Nit8F/03zw0j724by6QMu/XKWfubt3qKx92JIcWs820RZZ1oyyXJYjN4zDx923DlOar1IJHD90hJx++Tq5KGuCvpFyUD5dTq25NUF46SNaAYBbzflet+ijQ7efRFb8LPe+ChLheD9zcDYxOe2azuDHDkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MlwjITw6; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MlwjITw6"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7bf3283c18dso37153639f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Mar 2024 07:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1709308529; x=1709913329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAWTzafg6SPo4FfnmrTdAIG/dU4gxVOaqWTDkLn0alM=;
        b=MlwjITw6m0JYmG/7UsEEleTLmVz5r1MVBbluh6b2EUW/JaYrDFf5m7IgWVOE2xSOhq
         kNJFJEf5dZbEeJP9UhYGbmgb0zGTm98GauDHjX8igG3rQFBguS1dWH21a0IkflgzTyqL
         YpUO/EpplNDGtjGlHBtEorWZ7Crng+VCi9QsGWlrzsNUEF1oWn65RpOr4j/5B4kRtKxl
         t/puuCmY1NEwWodu8yvWjmVYRm5TVstQTeMdeYI76073ie63wYuDCPTwhpcaoGpNwfFr
         RU8NjohrS1Fc7BvqNianNACPtMXGQOUcTWjpUBq6jxdOOm/7ezQ7TQeALRHpHtSe+00t
         r3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709308529; x=1709913329;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAWTzafg6SPo4FfnmrTdAIG/dU4gxVOaqWTDkLn0alM=;
        b=NgHudRzAJ8PHviDcbazQthSIkXhdYE2xoIx7VgT0j6xQ4PXlAO10u6TwuUFl76d1qR
         9eGgXDsrj8Jir51eICN5e0OiGFC5lKug0ZxnR0KhQ3N0zIh/pLUmNImSPZDanWwOX0m6
         laiFLdLr9DUtptfD8N0BywDNrbgwyG6CsDXfrndmi8rlIKo5aA3NUJqBIkw6cRafLDTY
         gStwAQC1bjlEhEbqD3QKCX4G0s0wZSPnY3q+PXJaZYJF6UIMoxP6YfdKZ+23KU/0saqH
         VQtid3WlzTiHUJw5AdPKmrboL+/CitfK8ueyMNVAs8GvBlaSnsnBqynmMWb3By4D8sYZ
         1ONg==
X-Forwarded-Encrypted: i=1; AJvYcCVMZmja5K5iEhL4Mzgr3CD470H/CTDmmDlcDy4nicM0l+R8oesOUZBtlvGsuyHrE85sZ2wjuWtF618hyPfi4SpWzrQe7hIuUKcyWchaRL2g
X-Gm-Message-State: AOJu0YzpgWv6c7RrklPfaaKJaoNmlQKa9JMb+4Y3EgRVFMF8hzGA+z8k
	vs4fye/dOg5bhAlYgVV0z/kgl5TA8lc2bBkYMPAT3XQxst5hj9YidZ6qJ1JXmvg=
X-Google-Smtp-Source: AGHT+IH2AOVQ8MRVaLOMNYPUdikaYE3C9/yoGEwzLVtlfctn/SxJ+c3fl6voRhYHWRtZLwheJYI/Ag==
X-Received: by 2002:a6b:670a:0:b0:7c7:7f73:d1a with SMTP id b10-20020a6b670a000000b007c77f730d1amr1900238ioc.1.1709308528831;
        Fri, 01 Mar 2024 07:55:28 -0800 (PST)
Received: from [127.0.0.1] ([99.196.129.26])
        by smtp.gmail.com with ESMTPSA id b4-20020a02c984000000b004745e754b73sm894609jap.176.2024.03.01.07.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:55:27 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org, 
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240301144349.2807544-1-usama.anjum@collabora.com>
References: <20240301144349.2807544-1-usama.anjum@collabora.com>
Subject: Re: [PATCH io_uring/net: correct the type of variable
Message-Id: <170930852175.1084422.15074919053163753559.b4-ty@kernel.dk>
Date: Fri, 01 Mar 2024 08:55:21 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Fri, 01 Mar 2024 19:43:48 +0500, Muhammad Usama Anjum wrote:
> The namelen is of type int. It shouldn't be made size_t which is
> unsigned. The signed number is needed for error checking before use.
> 
> 

Applied, thanks!

[1/1] [PATCH io_uring/net: correct the type of variable
      commit: e86b4a164fc86d224bd177e02a9c070b9f1c3db4

Best regards,
-- 
Jens Axboe



