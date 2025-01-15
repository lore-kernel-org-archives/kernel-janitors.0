Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003219343B
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736969701; cv=none; b=Zhgb55nTmhzUkc7GBe0W+E5F/UflD9lx5kqZ0Sp4bdHZIT3o3li6jzphrQNlLVl/kdtgxbIMqbfGBueAVHxmkPVTOaZP/sKWAkSWWm6bC6A2LTaOVfYLSqf0SDzD5dJqh/9kQRGHQp1b2YQZxKQ9esNHr5zpWYi6VKJMDw5FFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736969701; c=relaxed/simple;
	bh=8I+04AwhM0Y1+1Fh5biVpdLR6Blu36k00nrrspUY13s=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Content-Type; b=qWbBXXb5oc8xeAy1jni5BH2WYPiY7u+I4eWZ5Fchz1fxs8e1GURtunx5hGJIOYxKzNsLFhY/MJ13H57bFp1JMGuuErlpQOkC5lIeB6XuU/cQyzqjVyDzV/R4rv0LW7sXFBMH7/OCjX5eucRVtssPpCGdbyygUvN8W83c6jpMDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIIaEufE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIIaEufE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so241861a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 11:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736969697; x=1737574497; darn=vger.kernel.org;
        h=content-transfer-encoding:organization:content-language:to:subject
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8I+04AwhM0Y1+1Fh5biVpdLR6Blu36k00nrrspUY13s=;
        b=EIIaEufEQatLceB1Od4nIsQy2MQQENsNwIVKANI6hpMTs58nLOYPy4oLH0X4MOgMJ5
         8flaar7rxEQ7is+UFobXAqCPdkkxxB/atJFLnVSok6DJCF/J6wnoBekprOoAw9NqO6H+
         kWNYrmsk2mdV56P/oQA26+4z0GoWggW8hZ8XWAuVreBsyn7xRRDCGzCtP87198WmOfyu
         BPOql7ue2OWlWA+WogjQH0xecYC6v4v3VachbF99U0aqbH9XStGGxqYN5jwj06023Sjb
         E3AdFvwpLgcWstl3Kd2FqpyZsrNx1z6sCxj7nz0Ejo+g2OfubZ0TOVwqT1fo4ZqttYKP
         PgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736969697; x=1737574497;
        h=content-transfer-encoding:organization:content-language:to:subject
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8I+04AwhM0Y1+1Fh5biVpdLR6Blu36k00nrrspUY13s=;
        b=CDyeaFpRdQvD3vaWkz+zNP+xorle0M2KQrH9Vj9cDibrwbtdVR1+p+GnQ1SVxvV+1g
         QtoXzkkl7OPDqFW2ArWIKz0MPUrxNptmHEUQnU9CxDpZHbwoMTQKAG0YbFnB64kXX8NB
         FESSTvRPODuJkzPrH8Qm62lM4nTi861l2oRikiSVLFe82TUvKuieg36cETbY9blMJgzv
         jsyxJ5UP4P1RXzEDdUhtbMIVuXm8lf1HfIAMFgpfvi7bA+2IYL5JFBjolG2mfNVsqLv/
         cgsy8j9AcGOfHuinErhdfXAKONv4NolannCKbjOW+LH+Du252r9UdQ+VcFk91I8oGjoY
         EJ3w==
X-Gm-Message-State: AOJu0Yyv524aLCay56B8tyGeTf/P9FjIZdhfeP8Ev10qqgtBdNPA2BMJ
	vEm+TZsRTpVqZvPtyAeFbVFZbZYG994JAM2uAiRYt29AK1IF2stMPmyxww==
X-Gm-Gg: ASbGncuEZ5MteHtL2f0uvUUPb3RQri4ZQ+OvJYZy0O6MdGhHjC3LSD+HVSwL0helPlW
	sdXEGbI2OELb1LtA7iFg/da6ucN551Nbo7tfCreKKj0jJgLyiPotH00VvLm0lztAjwZw31aDzEU
	Lt8V2EhS72Ip3ksoVoPiiMDLZD+N4DNTxnG/BnFvpZruby/385GFkv53N37XU9fFLkMPdStcBLW
	zQa43W8yVp7eGiM3OMAHjHwlc+QRBQP1mlR4fLFpqg6kSh4PRVEuEHvHiDZQXG8Ny9t
X-Google-Smtp-Source: AGHT+IHGiYTUWMGrDHzYdQ6fkl6zAwfd1c+GN/N/CPvG0LV+HQFc88vDnmo9a/tzv+xI83opOExCBQ==
X-Received: by 2002:a17:907:3e8c:b0:aae:83c7:6ce3 with SMTP id a640c23a62f3a-ab2abca7867mr3189609666b.43.1736969697066;
        Wed, 15 Jan 2025 11:34:57 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95647absm792486566b.118.2025.01.15.11.34.56
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 11:34:56 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <51e7e935-1e0b-490f-a947-c3e71fd10439@orange.com>
Date: Wed, 15 Jan 2025 20:34:55 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Generic sk_buff contract documentation ?
To: kernel-janitors@vger.kernel.org
X-Mozilla-News-Host: news://news://127.0.0.1:1119
Content-Language: fr, en-US
Organization: Orange
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Recently digging into a driver-specific issue with sk_buff->protocol, I
discovered (with surprise) that the computation of this field (which is *always*
necessary for protocol handlers to kick in) was somehow "delegated" to
individual network interface drivers. This can be seen by looking for callers of
eth_type_trans(), e.g:

- tg3: called from tg3_poll_work
- ixgbe: called from ixgbe_clean_rx_irq
- veth: called from veth_xmit (though indirectly via __dev_forward_skb)

This is a surprise as one would naively expect this ubiquitous behavior to be
triggered from generic code, depending only on the L2 header structure (but not
on the specific NIC hardware at hand). Another surprise was *not* to find any
mention of this "contract" in Documentation/*.

So, is it an unspoken tradition for NIC driver developers, to
"just know" that prior to emitting an skb from the rx path, they must fill
skb->protocol (along with who knows how many other metadata items) ?

Or, is there *somewhere* some reference documentation listing (exhaustively) the
required metadata computations that fall within a NIC driver's responsibility ?

Thanks in advance,

-Alex
