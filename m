Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573C2EE611
	for <kernel-janitors@vger.kernel.org>; Sat,  7 Feb 2026 18:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770488774; cv=none; b=MxniaW2BikiGXEMOCX019ledj3ef/s6LSGEe7O3EUCaSaT4bJ4T4Icsu38ulT2MGbdvNhYrUkBScY5wrCweDmGhjOkBJLtPq1K0uFOVWhT56R7RkzOB2ZZrXgO8k2fJy+9uywcI0ZtkkuUkxXwt2Vps/sJEtlraJM0GPRQRzVSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770488774; c=relaxed/simple;
	bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=O7+99s3WCXLuBHgpuxnDBEDnEkyhPH+AKOUv4VOocZdCjLcI6H9O5wcAfmtOXkaaKAcAqko4H7AUYO0nh1s32vZJrdzsk9u4gcMTGjaEiGp1cIcMfH/hd76FgvKDd9YOeEQBCtNfs4sltv+8HQa+Wc9xnDjbm2b3Gt+W4k38ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnOPcUjb; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnOPcUjb"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45f126d47b8so1212779b6e.2
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Feb 2026 10:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770488773; x=1771093573; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
        b=ZnOPcUjbWeq5Tnzms7pisG4S1y81DLl4kfPMyUHyAvUyFC/KHKCpOMZjKFbnXYezzc
         WpNY3sXC45oi2IuE0vwc/bqwMoz346XWbtPppC28ZwKEijx4nolwi8WmMGMABogU/qkz
         rmAsavwq+EiNrwlSzdCymbcYLkN+vOqaKWIYr/i/ePnMd7yIabZsEnPwb1Be5E/jlOvS
         nImr5hwpZqia8VIVdS8WKzp16GdLi7p0M5vWs+bgjd3PoJylLdeYepz3QpAkVt7zU4G/
         nqEiqA6OuTJlPdGdrXFAxsOMidhHOhv+AhWAM1k3z/8/ksZIQauNMfeXM39wB7J1pM1Z
         ukcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770488773; x=1771093573;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of7iMV2Z/iJ6pav2CA9CXWCYZ/s76Fa09HPTT1Ok5rw=;
        b=qCmVhnqghcLQ2F/nkURyA3sh6PeDQQg9HaYHM7dxN70zSOaPdX5hs1kk24LpYCkWht
         RWeMA6oGp/AKhdyzAyhF3wQ8QO8JyMjkwDXkmMEKBUX8NtyRREJtewFeq7sIOcKg4JiZ
         F58Th184RQdWrRnkb2wE82dkzHY/5DojxJhbAP5rBbf3mlUidxieVh5C2tpCBNVWPOIl
         VjOHvO6x1t0wmous1y0DtgrvbpMRShsVDSWGgktxXkd8bOE1crtKrcNLoCtc1WPhRr3s
         qcmigE3daALepr9e10WJi63npfWZlHki1VFLIkrbSK4vozMacChbO6w8mYO94Au7NP5q
         jXKA==
X-Forwarded-Encrypted: i=1; AJvYcCUQIKAPsaf8T+3vJXoSrmRefbezDJg8rvILV/Ms73CQT+hR425Sl6saVbtgQHUSa86InZ6cZGvf1dK4rx1IQIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HatqAlvtC8egnZnCMyJvu7J779YvxlXVyEGKuhnEiRBaaeW4
	jbWVLBCf1bI/KcSAmHo+43ylA6ycDItyQod96q2cY7NF8wpUDsRLwchN
X-Gm-Gg: AZuq6aJblOGhH+0jgFM2yyvkHUXJqwH7dSjntcjY6dG7ygk+9LhhzFt6wyI7wkNUJxG
	G+9RI4xlKG6Klecbshl+2YOIXW0/FfD/8DahhOO0Egx58T6PC5m9erFmFISEDbOkdTebxp74xUy
	xqKqSbo+KkzqF/Jb69XZj5EQDGhxeY+SUusOryPUrp9RO6jVG2bxzEtqOu58YfucRVu5IwRQsus
	MqyChgaIZTrZs6bkLQzGO/gHofYlyMmoOXeObFu5XcrYtqZvL/LlcCwsxKXaqmhF9Q4mh6mP3q2
	soK9SaPXgWCZ4jQ6i+UaSjj9MENCiSliPpqotZ4wa8TSN57Qg2ShFzo83CyFcouDJ8v6KqG74KO
	CigNRywmnGcBKq127S77Xvi5CFnNNdSU+d1tZn5fEYLM6ovG9sSur7Yz3nQfF3Vq6RP+QKEX3lL
	/4uLSqJxW7L1ppWWMagbpT9C1NSI8RSQbmFJctrh2wCAjwLFc0ZkRyqOjCCztjNUTDYitxaS0iL
	rE++7YmzY0cGkqboOTj5uP2yBGkGkGi9qd6OgUB9H4SgyxA5KHweOkI
X-Received: by 2002:a05:6820:3088:b0:663:859:c41e with SMTP id 006d021491bc7-66d0cc377bbmr3117593eaf.71.1770488772635;
        Sat, 07 Feb 2026 10:26:12 -0800 (PST)
Received: from localhost ([2600:100d:b16d:c41f:106d:f0c:a2a5:1623])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-66d3b2a5aefsm2974879eaf.13.2026.02.07.10.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 10:26:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 12:26:11 -0600
Message-Id: <DG8XW0Z05J2W.2PG3PVJ56TIM3@gmail.com>
To: "Sajja Easwar Sai" <eshwarsajja20@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <iryuken@duck.com>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: remove hardcoded dead debug code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260207180934.73593-1-eshwarsajja20@gmail.com>
In-Reply-To: <20260207180934.73593-1-eshwarsajja20@gmail.com>

On Sat Feb 7, 2026 at 12:09 PM CST, Sajja Easwar Sai wrote:
> The debug code is guarded by a constant false condition and is never
> executed. Remove it to simplify the code. This also removes the now
> unused variable 'pattrib'.
>
> Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
