Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D5038422F
	for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575569; cv=none; b=HPwhtCnImnYMJ8EkEc2ex+d1HANH2XvPVtCe35dpCOio472DGTRP3AnBJIiRy0N/orL5bPVQ1PoiQDghBkefV0a2g5TDT/bpf3kV76KruDCDXCDrFU39gXbtQkQfEnqMAFtIfmD6240dltg6pL1PXfwSRqtRTryIwK8lj6suRGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575569; c=relaxed/simple;
	bh=0BYcoTbBbvUeqsG1OSWmo+wBO1aviitNPUMnElsLu/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmZAB+5qNeGDjUlzFC6NHO3X2rQS6vu3WZry3zuR7LiR6v31owrgJm1qniT+PdF2qfcGJlrTSycg1pq/juKJH7tAd2VDLOE21TmiXNAFl/rHkeYg3Td1kF11dbwzaqHK5y+a9u5xN73hjN0+f4Bbr8K6hem17lCesBASPpOV6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9oqQu2Q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9oqQu2Q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-444826c16ffso4558196f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 12 May 2026 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778575554; x=1779180354; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m76SURJojCaCrAuR3/dOaOFtwXJWhD++AXWf1ma4J44=;
        b=J9oqQu2QRUd0f+mcCljY7eGgE+cM8g3ICKxN2UBKt4EuYi+w4gIo8gxDtSFz7YRNSR
         XmQh1m7Ow7hwe9tK/8BqgXXA1GScIyC09kxhmTOn7sYfFQBh5aBNuFnRbuAb/duUW9zU
         jIZGwXMC456cwPdtY32N2f65zMIGnsIKV5UddFdrtVqsKA/zyllBvB96NMpKCTaOlnzZ
         shX1jQajUL6tDOHSn9g+EcC2qgcW7+YeOpazjzqdSpXujhDgFg0uZvxCLDPWEmks0FF5
         Sm+PyEESzNcUtfKfVxj7gcSda38QKwY9cGPH0HyDMw5BA5guoQmn/boeYUmVEk0Z0f40
         jVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575554; x=1779180354;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m76SURJojCaCrAuR3/dOaOFtwXJWhD++AXWf1ma4J44=;
        b=MDNecqJDxMI3KJvujPuFLcnn0nJrefTXwm2LVs4Xn5uqDTndcKaqBw7BRaju2KG+oc
         xgKGvQtPvf/iFWywm8ECHPc0OA6ALh44XamAXaUmH5A16zNSlrGYItMx0xpf8g0VmunP
         a47dAQLxH20BPHt2I4SPrKGzayjFPTfOfs+g27yWVbQ10xybO/YFPxd039CV9ZgDBmE0
         pPF1KupEpJO0adQF1z91+N1aXQrYyaFH1PLXsdIM8BZ5CDrldHKJacrNEauI1bS0zRCl
         9SufS7TfIDI8GjKVEzOnnAk25qrt+8N+nEgi2FpmcvfNWwyzonV64AMQZJyauXOwbZaz
         A/eA==
X-Gm-Message-State: AOJu0YxS45ZIn7D/Sip78F9VIN0My6N+nLxMv2jT90Ogj6ODYSkWmCDO
	oj9cK1K1ZoEXrIBJynV3UlybpbDk7yR5pqPSDyQOx3nA/75QGrFMnNtz
X-Gm-Gg: Acq92OEWxwU+MPcb225VZdxsO3H2rIowZVK9tjODU7SaZrTYkNYrhLBOxdfiFHFBxYM
	qZPfN9T+zeq7PWxAvGVxIema375ZJYY8viOuNivBiQ3b2VxjhDYxkHLfXt3EX8mwUonPjN7fKQ/
	Z8tjdtRRsv/6L0d49SOpQ5F5jv6wP+QfOsudTHrnU2Cu7kIQOwg60a4PxlBELUjcLUGTE50Jc2V
	86ve7I0726s1Jsz+GYPdm7AbyCi80588jhsqcyOYrVhCVDgQVCsk6I4kauLaZtKKAGDovPvI1LD
	KMDwqRUW39LIaHXg+odK67OaNPIkW0y9je2ki2E29ck7rXHwoeEQBZhszZKTZIJ2nNfqtDeZw+g
	fFmeH/PZlh2P1SF5HKwTGeQR1B6wLYkZybfCmmKFt2eyH+msPTxoBZE+i5gs1XxDon4Ep3p8lUE
	Fl9cOrPksIw37hmBRabwE=
X-Received: by 2002:a05:600c:8b77:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48e8fe59c3amr29963175e9.12.1778575554513;
        Tue, 12 May 2026 01:45:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f43c31dsm13058435e9.25.2026.05.12.01.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:45:53 -0700 (PDT)
Date: Tue, 12 May 2026 11:45:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] ovpn: implement packet processing
Message-ID: <agLovl_hlXHNhnLi@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Antonio Quartulli,

Commit 8534731dbf2d ("ovpn: implement packet processing") from Apr
15, 2025 (linux-next), leads to the following Smatch static checker
warning:

drivers/net/ovpn/io.c:207 ovpn_decrypt_post() warn: variable dereferenced before check 'peer' (see line 148)
drivers/net/ovpn/io.c:305 ovpn_encrypt_post() warn: variable dereferenced before check 'peer' (see line 304)

drivers/net/ovpn/io.c
    108 void ovpn_decrypt_post(void *data, int ret)
    109 {
    110         struct ovpn_crypto_key_slot *ks;
    111         unsigned int payload_offset = 0;
    112         struct sk_buff *skb = data;
    113         struct ovpn_socket *sock;
    114         struct ovpn_peer *peer;
    115         __be16 proto;
    116         __be32 *pid;
    117 
    118         /* crypto is happening asynchronously. this function will be called
    119          * again later by the crypto callback with a proper return code
    120          */
    121         if (unlikely(ret == -EINPROGRESS))
    122                 return;
    123 
    124         payload_offset = ovpn_skb_cb(skb)->payload_offset;
    125         ks = ovpn_skb_cb(skb)->ks;
    126         peer = ovpn_skb_cb(skb)->peer;
    127 
    128         /* crypto is done, cleanup skb CB and its members */
    129         kfree(ovpn_skb_cb(skb)->crypto_tmp);
    130 
    131         if (unlikely(ret < 0))
    132                 goto drop;
    133 
    134         /* PID sits after the op */
    135         pid = (__force __be32 *)(skb->data + OVPN_OPCODE_SIZE);
    136         ret = ovpn_pktid_recv(&ks->pid_recv, ntohl(*pid), 0);
    137         if (unlikely(ret < 0)) {
    138                 net_err_ratelimited("%s: PKT ID RX error for peer %u: %d\n",
    139                                     netdev_name(peer->ovpn->dev), peer->id,
    140                                     ret);
    141                 goto drop;
    142         }
    143 
    144         /* keep track of last received authenticated packet for keepalive */
    145         WRITE_ONCE(peer->last_recv, ktime_get_real_seconds());
                           ^^^^^^^^^^^^^^^
Most of the function assumes peer can't be NULL

    146 
    147         rcu_read_lock();
    148         sock = rcu_dereference(peer->sock);
    149         if (sock && sock->sk->sk_protocol == IPPROTO_UDP)
    150                 /* check if this peer changed local or remote endpoint */
    151                 ovpn_peer_endpoints_update(peer, skb);
    152         rcu_read_unlock();
    153 
    154         /* point to encapsulated IP packet */
    155         __skb_pull(skb, payload_offset);
    156 
    157         /* check if this is a valid datapacket that has to be delivered to the
    158          * ovpn interface
    159          */
    160         skb_reset_network_header(skb);
    161         proto = ovpn_ip_check_protocol(skb);
    162         if (unlikely(!proto)) {
    163                 /* check if null packet */
    164                 if (unlikely(!pskb_may_pull(skb, 1))) {
    165                         net_info_ratelimited("%s: NULL packet received from peer %u\n",
    166                                              netdev_name(peer->ovpn->dev),
    167                                              peer->id);
    168                         goto drop;
    169                 }
    170 
    171                 if (ovpn_is_keepalive(skb)) {
    172                         net_dbg_ratelimited("%s: ping received from peer %u\n",
    173                                             netdev_name(peer->ovpn->dev),
    174                                             peer->id);
    175                         /* we drop the packet, but this is not a failure */
    176                         consume_skb(skb);
    177                         goto drop_nocount;
    178                 }
    179 
    180                 net_info_ratelimited("%s: unsupported protocol received from peer %u\n",
    181                                      netdev_name(peer->ovpn->dev), peer->id);
    182                 goto drop;
    183         }
    184         skb->protocol = proto;
    185 
    186         /* perform Reverse Path Filtering (RPF) */
    187         if (unlikely(!ovpn_peer_check_by_src(peer->ovpn, skb, peer))) {
    188                 if (skb->protocol == htons(ETH_P_IPV6))
    189                         net_dbg_ratelimited("%s: RPF dropped packet from peer %u, src: %pI6c\n",
    190                                             netdev_name(peer->ovpn->dev),
    191                                             peer->id, &ipv6_hdr(skb)->saddr);
    192                 else
    193                         net_dbg_ratelimited("%s: RPF dropped packet from peer %u, src: %pI4\n",
    194                                             netdev_name(peer->ovpn->dev),
    195                                             peer->id, &ip_hdr(skb)->saddr);
    196                 goto drop;
    197         }
    198 
    199         ovpn_netdev_write(peer, skb);
    200         /* skb is passed to upper layer - don't free it */
    201         skb = NULL;
    202 drop:
    203         if (unlikely(skb))
    204                 dev_dstats_rx_dropped(peer->ovpn->dev);
    205         kfree_skb(skb);
    206 drop_nocount:
--> 207         if (likely(peer))
                           ^^^^
So hopefully this NULL check could be removed as well?

    208                 ovpn_peer_put(peer);
    209         if (likely(ks))

Same for ks and also in the encrypt function.

    210                 ovpn_crypto_key_slot_put(ks);
    211 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
