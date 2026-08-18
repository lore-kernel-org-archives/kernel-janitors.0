Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43074B048C
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Aug 2026 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787034105; cv=none; b=K3s71Waf8VyLlT2yys9Fl7qpqTTVFmob8+F5IryscrkgHY660FHGelu51xL6YcBAQH4EGO9ZScxSxf7CIgqkFEFz/Wm0dV9TpkbBC/oKSeMIdjem3e6BuzeNR4jlVCeyl4RAb4uOTfgCMddHZT0ALBjdkdA07yn0febNfIJ5F4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787034105; c=relaxed/simple;
	bh=de5t7izor8kRFwQYsOGL0q6swA5nwWxLfgCAJ7exkv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THKO78xYvgsboMEg2eQJ2wtmqUt8kiCOCvf98Gh07pZMdO1OVyyPYx6NQfrqxHlZj4GR4nBaoQdh5RuMxLdGw/ROrcyLZHk4txm4mK4U59GjbcKI8EK4nvgwomYVx8goHPnU5vG5Sef8M6bEs3THmmJhPS+grv4mNRJFP8q3X4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlrqySPM; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlrqySPM"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca88130e09aso2586817a12.3
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 23:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034103; x=1787638903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLs/RlrXlKm3gliodn6KiIGRLWy/mBk6EHfck2hwzM0=;
        b=QlrqySPM248+wU2idl3YTftgTkYyKHHIeja36MQwtyA/rMtIUx7mAXInxnJC38ncv+
         FBy81ELZQQ0S9TyzJ1+FcswdsRvB6F2A3oLASFhRtdtex2DQZ7vryRdt4P3ngTlBG0tZ
         mZrXoQ4wMc3LS7hvIKICIDvzN2ic9992cwa8gech6bULLraHacbDW9AwvnlFWm2etO1S
         elrPTzWZ0EXkg8CQhODCZl0m0lXNIstr35J0YxBJiJtyTAW0Jj0Qip1CndndhvRakTb9
         yO14o8kbf/Kd2N14sFEqUFALuK6RYbDNLS4w9gjFQzqTiRMf5OmkV9vIFjJqcK0dSGmj
         LRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034103; x=1787638903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLs/RlrXlKm3gliodn6KiIGRLWy/mBk6EHfck2hwzM0=;
        b=egadsHsRdKBYtbCE33CTWJH6xN7WdBv2wY9CBKbXnwnjIJzK516hYBpbyBZGDMiOxD
         1BEn53xfFH9K2u4v4/kvWTjt4JxEcvvxjaqprUZ+ogr8dp3LpJmsI01PwsLqxBjvtylf
         zCP5qvJXCfsEvovU+kR6ONuwVohIkARaoNHgR0YrhFr/KQGIHPl914mREWKflr/AINeR
         psM55PAYt/4AqClruFLkoi8dwbRVp8gS1aLj/6swIUE/NtBdyQIPd4IhdtkBoZ4IwGyx
         1tP4twoFil0Gxr5VwYhqdTk+vIiG88h+upSUtS79ARl7LJmFjaEW0hp2FOXGJBmQnTtX
         5UsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLKTbgwownOybCF2F4zUT4HumLLXEKFujPmsjeUrSR4LyjZyKYTEl1J+yywtTtD+TTzVLFPXvNGz2edMakIq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyT+3mS1jLdHAxabOnS+XHFWow8lMow6NmhtmaqhPhXIX/BVmw
	eQ2LjyLbesyKvgz0qTYsjapeEaVp+jAlTBScD2T3V98DTi49pjFPKZM=
X-Gm-Gg: AR+sD1258cZATfCxXxkiAfixwLsB1Mjx7u0jPxxbWEav5GrtS7xXmieLCAoG2ocU24J
	yyosq07XQmjwvQpS1DlDTNWbvpULEgNHAxYQrPmdmlwZEWjR2ly3YfZHv4UFvsMXohgQU81m4Fg
	ca4Us9vFqUx/u+453wILpN3C4/C1nJjroKD+wfPz6p+3cxDRDixgd+Gx4cfThME4qwv1MvP5z9Z
	J/sNTordTq/9jA/op2a28W2hmsKNSC2I9VM+O+boUtP4JMyc3dbKI8najOd4YFIyc9m2ldiWDBu
	pfLvVa4D0KckRwafWRK0ziJNsZPY5P+fBjAnuahqnI/i0UE+kFKl8/XV6O8YuWxGoabPcN844ek
	56gqdeDTGF6SDybEY9KyHDdPJxAtg3p+W3Flprqq2x907kGIfMqXuJn/p+MbJwQro4bHEyy7ogX
	sMr2f0FK4iFPdo2ufirnrIECxSdrZylDqHLYV5cgkaU7l/Oqf3a8unKV1n0mClULDQInOg7aiHb
	+0Ws4ErCA8l
X-Received: by 2002:a17:90b:3b84:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3955a3dae07mr4907995a91.4.1787034098391;
        Mon, 17 Aug 2026 23:21:38 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d2b85b1sm4859020a91.2.2026.08.17.23.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:21:38 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: markus.elfring@web.de
Cc: dri-devel@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	royalnet026@gmail.com,
	tomeu@tomeuvizoso.net,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] drm/rocket: Check allocations before use
Date: Tue, 18 Aug 2026 13:21:34 +0700
Message-ID: <20260818062134.1634572-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <67dc50c5-19ab-4612-857b-59d6a850f76b@web.de>
References: <67dc50c5-19ab-4612-857b-59d6a850f76b@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > There are programming interfaces supported to some degree
> for the application of scope-based resource management.
> https://elixir.bootlin.com/linux/v7.2-rc7/source/include/linux/cleanup.h#L10
> 
> Would you like to take any adjustment possibilities better into account accordingly?

Thanks for explaining. I am happy to continue working on this, but I think
this would be more of a refactoring to use the new API than a bug fix.
Furthermore, I don't have much experience with the new cleanup API yet, so
I think it would be better to consider this as a separate change in the
future, after these patches have been reviewed and I have gained more
experience with the new API.

Anyway, thanks for suggesting this. I'll take a look at it and keep it in
mind for future changes.

Regards,
Triet
