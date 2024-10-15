Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B504140E50
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990293; cv=none; b=I2TUouP0Ri2teL4gvBsiwDrzt36nsNTG7GhQ6M9p0jqE1XREO9qrLAVrcfW/UEj8UEmlqlDhYdp+zFpchiYERksQ7XaYdMVCm4C4Y5XPfyxQDnLnHxn8f4ZJC50DYCSg3XJNb8nW0DwcDqK2fR3lHtTLS0sMqn8TUTGjhBpx3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990293; c=relaxed/simple;
	bh=9U5bdDys3tg1CP0mSd84G+WVvwZMppDmWaRnqsDJtyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+xlUqWZHF1ee3JREsAjjFXuuRZMS8DW8b4P8pnobVFJjWLfQf4FSOFT2fUCRQbqnE5miYEXleYE3NjUq3aB45DtMvfyoUBPLJdwYHpDkcFcniexRpzc3lZO3xwfYZh0qcN66LgORfXpYQTE9u6r2UVboFkGKlOSjsL/y/Qnv1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLxwej56; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLxwej56"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so28599781fa.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 04:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728990290; x=1729595090; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4sjzNo3dq1SarzoHX+4jyrRuhoWt+Z5O4Pp5wIKaXs=;
        b=uLxwej56vumvtWGm2d+RqmRck0kBcuaucKa6GbZlT60sJN/R3L5FwO9I//0/E03Tng
         TY3NDZrK/vFYrozTzaUGKznIJFjTew9GsNGYCfxsDUrxGT1QzzDCBQAfmpM49BEN3R+2
         jiFWsig9xomhRhdssKw42dueE7eJDoannViWlWsm0q2AKEhGWtT8U9J7EdJudAehHW88
         vdgxdcsE5918bGTSmWhi/d/xyVObRptBpiF77MLjbySgdyjEUxS2gPqZaP5fH6Y75FEm
         TwHt7r354Y2Q/lcXfB8nVHdSnTO2qmisqHs/Aizb7M4rsi+iv4eY9Xind8szwXxOAKD8
         g/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728990290; x=1729595090;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4sjzNo3dq1SarzoHX+4jyrRuhoWt+Z5O4Pp5wIKaXs=;
        b=LlpEqDLd4AKnR7BJ71PJ2xhYDdT5aaa26anN2VXcnxJFZW3fe6y0CzydJvnBmwXA9F
         BN4uZxNa9etS+SmAR/IYCcixhO3QJ1OcyTvNKIm0fcGspicpR2YDHNq4Mo8DBoUpB8xq
         vx6LnCQHgvbfQdHKzre0IJuVtxshBoRYSZVKFK62Rxgij6HoPmqFcGGPf1QpVyF3h7CE
         rPxsE/ps+2JKJ9T3qA92AhynV6X3hSCJ3DKcvodJDALiFZ0W9IdHMVWaSmGToE3ehRpm
         QXITp2vw7FwkqxM/CwGPrLS8NFrywgBZ9GTl3Ht4Rh+Gl2Q1qjlcplvLQnJET0maCIMq
         hxFQ==
X-Gm-Message-State: AOJu0YyyE/CbMDEDpnfprnSwUUlRjCCbZsQqhM5jPGFoFxnLVAE3Xx4C
	z5+5394aEdSipUoKZI42eLIFfsmmhQDgNSQQ2jwyKgBftqGraEF87Pt4ifSQHjo=
X-Google-Smtp-Source: AGHT+IEW+7xSfuzszWdXiYziSnJCKx/0cOVwAZQodd3i1+n01NCTK68wcManz/dxFbungFSWw6nSbw==
X-Received: by 2002:a2e:750:0:b0:2fb:5014:c998 with SMTP id 38308e7fff4ca-2fb5014f604mr27318601fa.28.1728990290010;
        Tue, 15 Oct 2024 04:04:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d779975sm559860a12.67.2024.10.15.04.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 04:04:49 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:04:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: kernel-janitors@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [bug report] NFC: Initial LLCP support
Message-ID: <f32235a6-d884-451a-bec6-bf659c6f50b1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Samuel Ortiz,

Commit d646960f7986 ("NFC: Initial LLCP support") from Dec 14, 2011
(linux-next), leads to the following Smatch static checker warning:

	net/nfc/llcp_core.c:1147 nfc_llcp_recv_hdlc()
	warn: double unlock 'sk' (orig line 1088)

net/nfc/llcp_core.c
    1064 static void nfc_llcp_recv_hdlc(struct nfc_llcp_local *local,
    1065                                struct sk_buff *skb)
    1066 {
    1067         struct nfc_llcp_sock *llcp_sock;
    1068         struct sock *sk;
    1069         u8 dsap, ssap, ptype, ns, nr;
    1070 
    1071         ptype = nfc_llcp_ptype(skb);
    1072         dsap = nfc_llcp_dsap(skb);
    1073         ssap = nfc_llcp_ssap(skb);
    1074         ns = nfc_llcp_ns(skb);
    1075         nr = nfc_llcp_nr(skb);
    1076 
    1077         pr_debug("%d %d R %d S %d\n", dsap, ssap, nr, ns);
    1078 
    1079         llcp_sock = nfc_llcp_sock_get(local, dsap, ssap);
    1080         if (llcp_sock == NULL) {
    1081                 nfc_llcp_send_dm(local, dsap, ssap, LLCP_DM_NOCONN);
    1082                 return;
    1083         }
    1084 
    1085         sk = &llcp_sock->sk;
    1086         lock_sock(sk);
    1087         if (sk->sk_state == LLCP_CLOSED) {
    1088                 release_sock(sk);
    1089                 nfc_llcp_sock_put(llcp_sock);

Sorry, to bother you after 15 years, but hopefully this question is easy.  Was
there supposed to be a return; after the nfc_llcp_sock_put()?

    1090         }
    1091 
    1092         /* Pass the payload upstream */
    1093         if (ptype == LLCP_PDU_I) {
    1094                 pr_debug("I frame, queueing on %p\n", &llcp_sock->sk);
    1095 
    1096                 if (ns == llcp_sock->recv_n)
    1097                         llcp_sock->recv_n = (llcp_sock->recv_n + 1) % 16;
    1098                 else
    1099                         pr_err("Received out of sequence I PDU\n");
    1100 
    1101                 skb_pull(skb, LLCP_HEADER_SIZE + LLCP_SEQUENCE_SIZE);
    1102                 if (!sock_queue_rcv_skb(&llcp_sock->sk, skb)) {
    1103                         /*
    1104                          * I frames will be freed from the socket layer, so we
    1105                          * need to keep them alive until someone receives them.
    1106                          */
    1107                         skb_get(skb);
    1108                 } else {
    1109                         pr_err("Receive queue is full\n");
    1110                 }
    1111         }
    1112 
    1113         /* Remove skbs from the pending queue */
    1114         if (llcp_sock->send_ack_n != nr) {
    1115                 struct sk_buff *s, *tmp;
    1116                 u8 n;
    1117 
    1118                 llcp_sock->send_ack_n = nr;
    1119 
    1120                 /* Remove and free all skbs until ns == nr */
    1121                 skb_queue_walk_safe(&llcp_sock->tx_pending_queue, s, tmp) {
    1122                         n = nfc_llcp_ns(s);
    1123 
    1124                         skb_unlink(s, &llcp_sock->tx_pending_queue);
    1125                         kfree_skb(s);
    1126 
    1127                         if (n == nr)
    1128                                 break;
    1129                 }
    1130 
    1131                 /* Re-queue the remaining skbs for transmission */
    1132                 skb_queue_reverse_walk_safe(&llcp_sock->tx_pending_queue,
    1133                                             s, tmp) {
    1134                         skb_unlink(s, &llcp_sock->tx_pending_queue);
    1135                         skb_queue_head(&local->tx_queue, s);
    1136                 }
    1137         }
    1138 
    1139         if (ptype == LLCP_PDU_RR)
    1140                 llcp_sock->remote_ready = true;
    1141         else if (ptype == LLCP_PDU_RNR)
    1142                 llcp_sock->remote_ready = false;
    1143 
    1144         if (nfc_llcp_queue_i_frames(llcp_sock) == 0 && ptype == LLCP_PDU_I)
    1145                 nfc_llcp_send_rr(llcp_sock);
    1146 
--> 1147         release_sock(sk);
    1148         nfc_llcp_sock_put(llcp_sock);

We call release and put again here.

    1149 }

regards,
dan carpenter
