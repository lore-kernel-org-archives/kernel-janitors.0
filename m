Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848841E520A;
	Sun, 15 Mar 2026 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773597284; cv=none; b=OSOQu6Ub/lnR0jaqSrOfCaCFWe9WLC4XqOqlJerrUwfQsm1/thTZtyN1FZ9TY9Ls/HZIUXyzzjInWn2Q4BW4MIX8ru9jxA0DB7smRyrKsYwVZFPuB4RsIBAKzPpjQWRsasogK4GNAnc3GQ4Fsny/jI9MIUmw26+KEGHJ8l2u5p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773597284; c=relaxed/simple;
	bh=URNqiggPMKiZ8uXdRneM1SyQE7bzJ3lN9MPA8wPIXpY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Kn2prB3O1wbvRumUIKBECtEFjixy8g9AZBchtJY0FU4Y/V+IucOLOKtZDZqfD8g+ujN+RKB2o0mTyAqIgAYUz5z83vxsgw2PVhj2fDwwecY5Tvym+a1CFnqr0uk8E0awqGVV1NEDsLV+srp3yT8e/zNeuXspJhgIUS91Ig149HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=UNbqoaWt; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UNbqoaWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=E5yurC0foRWn9NQ8xKqG1VtWQ5Fc27KStRkqbmtydRE=;
  b=UNbqoaWtEG4ji65BZbDHg4kgqDZT4e/NMY3VQFQywqkzpkBQTpkvZvNW
   ejqPJ1xE/0c9X9sEyd8T8V9ca1cj/n6ucvsc5Fmh22e3LRLaVJEzt7xnE
   jb94W3+VnEosEpetYfI0WOaP0sK97hkAvTMw2rTTkcw3OPWhV20axa9JG
   c=;
X-CSE-ConnectionGUID: 8v8Ocm9ORBOJs1RSKbwPPQ==
X-CSE-MsgGUID: 7MO1aAsgQC6YP2ccr6pc2w==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,122,1770591600"; 
   d="scan'208";a="267845245"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 18:54:33 +0100
Date: Sun, 15 Mar 2026 18:54:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Alejandro Colomar <alx@kernel.org>
cc: Julia Lawall <Julia.Lawall@inria.fr>, 
    Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
    Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using
 ARRAY_END()
In-Reply-To: <abblv3nCut5aRk7q@devuan>
Message-ID: <105cf750-4bab-2a39-e62e-debceca68466@inria.fr>
References: <cover.1772752564.git.alx@kernel.org> <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org> <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de> <aa7XD-rk_KWQvTQX@devuan> <abblv3nCut5aRk7q@devuan>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1350559270-1773597273=:4005"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1350559270-1773597273=:4005
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 15 Mar 2026, Alejandro Colomar wrote:

> Hi Markus, Julia,
>
> On 2026-03-09T15:32:24+0100, Alejandro Colomar wrote:
> > > …
> > > > +// Comments: No known false positives, but has a few false negatives
> > >
> > > Would such information motivate for any further software refinements?
> >
> > Yes, if anyone here knows how to handle the false negatives and wants to
> > work with me on improving those, I'm very interested.
> >
> > Here's one case which isn't caught, for example (which I expect will be
> > difficult to handle, if not impossible):
> >
> > 	@@ -2876,7 +2876,7 @@ static struct dentry *proc_##LSM##_attr_dir_lookup(struct
> > 	inode *dir, \
> > 	 { \
> > 		return proc_pident_lookup(dir, dentry, \
> > 					  LSM##_attr_dir_stuff, \
> > 	-                                 LSM##_attr_dir_stuff + ARRAY_SIZE(LSM##_attr_dir_stuff)); \
> > 	+                                 ARRAY_END(LSM##_attr_dir_stuff)); \
> > 	 } \
> > 	 \
> > 	 static const struct inode_operations proc_##LSM##_attr_dir_inode_ops = { \
> >
> > I could research and find other false negatives.
>
> Here are more false negatives that I found manually.  The semantic patch
> didn't find them.  Does anyone know how we could improve it or why it
> didn't find them?

Typically, some things are not found when Coccinelle is not able to parse
the relevnt code.  You can see this with the --verbose-parsing option.
BUG indicates the line where the parsing problem was detected and bug
indicates the other lines that were ignored due to the parse error.

julia


>
> 	diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> 	index 8d81c1e7..d883e1bd 100644
> 	--- a/arch/powerpc/kernel/rtas.c
> 	+++ b/arch/powerpc/kernel/rtas.c
> 	@@ -555,10 +555,8 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
> 		},
> 	 };
>
> 	-#define for_each_rtas_function(funcp)                                       \
> 	-       for (funcp = &rtas_function_table[0];                               \
> 	-            funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_table)]; \
> 	-            ++funcp)
> 	+#define for_each_rtas_function(f)                                     \
> 	+       for (f = rtas_function_table; f < ARRAY_END(rtas_function_table); ++f)
>
> 	 /*
> 	  * Nearly all RTAS calls need to be serialized. All uses of the
> 	diff --git a/arch/s390/purgatory/purgatory.c b/arch/s390/purgatory/purgatory.c
> 	index ecb38102..3e45056b 100644
> 	--- a/arch/s390/purgatory/purgatory.c
> 	+++ b/arch/s390/purgatory/purgatory.c
> 	@@ -19,7 +19,7 @@ int verify_sha256_digest(void)
> 		struct sha256_ctx sctx;
>
> 		sha256_init(&sctx);
> 	-       end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
> 	+       end = ARRAY_END(purgatory_sha_regions);
>
> 		for (ptr = purgatory_sha_regions; ptr < end; ptr++)
> 			sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
> 	diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
> 	index f61ab1ba..988b0773 100644
> 	--- a/drivers/md/bcache/util.h
> 	+++ b/drivers/md/bcache/util.h
> 	@@ -273,9 +273,7 @@ do {                                                                        \
> 		BUILD_BUG_ON(sizeof((array)->data[0]) < sizeof(void *));        \
> 		(array)->freelist = NULL;                                       \
> 										\
> 	-       for (_i = (array)->data;                                        \
> 	-            _i < (array)->data + ARRAY_SIZE((array)->data);            \
> 	-            _i++)                                                      \
> 	+       for (_i = (array)->data; _i < ARRAY_END((array)->data); _i++)   \
> 			array_free(array, _i);                                  \
> 	 } while (0)
>
> 	diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
> 	index 6e38aa73..c0cd2d1e 100644
> 	--- a/drivers/net/wireless/ath/ath9k/ath9k.h
> 	+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
> 	@@ -444,9 +444,7 @@ ath_node_to_tid(struct ath_node *an, u8 tidno)
> 	 #define case_rtn_string(val) case val: return #val
>
> 	 #define ath_for_each_chanctx(_sc, _ctx)                             \
> 	-       for (ctx = &sc->chanctx[0];                                 \
> 	-            ctx <= &sc->chanctx[ARRAY_SIZE(sc->chanctx) - 1];      \
> 	-            ctx++)
> 	+       for (ctx = &sc->chanctx[0]; ctx <= ARRAY_END(sc->chanctx) - 1; ctx++)
>
> 	 void ath_chanctx_init(struct ath_softc *sc);
> 	 void ath_chanctx_set_channel(struct ath_softc *sc, struct ath_chanctx *ctx,
> 	diff --git a/drivers/net/wireless/intel/iwlwifi/mei/net.c b/drivers/net/wireless/intel/iwlwifi/mei/net.c
> 	index eac46d1a..b0d2905d 100644
> 	--- a/drivers/net/wireless/intel/iwlwifi/mei/net.c
> 	+++ b/drivers/net/wireless/intel/iwlwifi/mei/net.c
> 	@@ -43,7 +43,7 @@ static bool iwl_mei_rx_filter_eth(const struct ethhdr *ethhdr,
> 			return false;
>
> 		for (filt = &filters->eth_filters[0];
> 	-            filt < &filters->eth_filters[0] + ARRAY_SIZE(filters->eth_filters);
> 	+            filt < ARRAY_END(filters->eth_filters);
> 		     filt++) {
> 			/* Assume there are no enabled filter after a disabled one */
> 			if (!(filt->flags & SAP_ETH_FILTER_ENABLED))
> 	@@ -142,7 +142,7 @@ iwl_mei_rx_filter_tcp_udp(struct sk_buff *skb, bool  ip_match,
> 		const struct iwl_sap_flex_filter *filt;
>
> 		for (filt = &filters->flex_filters[0];
> 	-            filt < &filters->flex_filters[0] + ARRAY_SIZE(filters->flex_filters);
> 	+            filt < ARRAY_END(filters->flex_filters);
> 		     filt++) {
> 			if (!(filt->flags & SAP_FLEX_FILTER_ENABLED))
> 				break;
> 	diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> 	index f6ce6e26..a7aa3ce4 100644
> 	--- a/drivers/usb/core/devio.c
> 	+++ b/drivers/usb/core/devio.c
> 	@@ -1490,7 +1490,7 @@ static int proc_conninfo_ex(struct usb_dev_state *ps,
>
> 		if (ci.num_ports < ARRAY_SIZE(ci.ports))
> 			memmove(&ci.ports[0],
> 	-                       &ci.ports[ARRAY_SIZE(ci.ports) - ci.num_ports],
> 	+                       ARRAY_END(ci.ports) - ci.num_ports,
> 				ci.num_ports);
>
> 		if (copy_to_user(arg, &ci, min(sizeof(ci), size)))
> 	diff --git a/fs/smb/client/dfs.h b/fs/smb/client/dfs.h
> 	index e60f0a24..4977f649 100644
> 	--- a/fs/smb/client/dfs.h
> 	+++ b/fs/smb/client/dfs.h
> 	@@ -32,7 +32,7 @@ struct dfs_ref_walk {
> 	 };
>
> 	 #define ref_walk_start(w)      ((w)->refs)
> 	-#define ref_walk_end(w)        (&(w)->refs[ARRAY_SIZE((w)->refs) - 1])
> 	+#define ref_walk_end(w)        (ARRAY_END((w)->refs) - 1)
> 	 #define ref_walk_cur(w)        ((w)->ref)
> 	 #define ref_walk_descend(w)    (--ref_walk_cur(w) >= ref_walk_start(w))
>
> 	diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> 	index 1b9b18e5..0ff49f24 100644
> 	--- a/kernel/bpf/core.c
> 	+++ b/kernel/bpf/core.c
> 	@@ -2298,7 +2298,7 @@ static unsigned int PROG_NAME(stack_size)(const void *ctx, const struct bpf_insn
> 		u64 regs[MAX_BPF_EXT_REG] = {}; \
> 	 \
> 		kmsan_unpoison_memory(stack, sizeof(stack)); \
> 	-       FP = (u64) (unsigned long) &stack[ARRAY_SIZE(stack)]; \
> 	+       FP = (u64) (unsigned long) ARRAY_END(stack); \
> 		ARG1 = (u64) (unsigned long) ctx; \
> 		return ___bpf_prog_run(regs, insn); \
> 	 }
> 	@@ -2312,7 +2312,7 @@ static u64 PROG_NAME_ARGS(stack_size)(u64 r1, u64 r2, u64 r3, u64 r4, u64 r5, \
> 		u64 regs[MAX_BPF_EXT_REG]; \
> 	 \
> 		kmsan_unpoison_memory(stack, sizeof(stack)); \
> 	-       FP = (u64) (unsigned long) &stack[ARRAY_SIZE(stack)]; \
> 	+       FP = (u64) (unsigned long) ARRAY_END(stack); \
> 		BPF_R1 = r1; \
> 		BPF_R2 = r2; \
> 		BPF_R3 = r3; \
> 	diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> 	index 198f8a0d..d98e42a3 100644
> 	--- a/net/ipv4/tcp_input.c
> 	+++ b/net/ipv4/tcp_input.c
> 	@@ -2009,7 +2009,7 @@ static struct sk_buff *tcp_maybe_skipping_dsack(struct sk_buff *skb,
>
> 	 static int tcp_sack_cache_ok(const struct tcp_sock *tp, const struct tcp_sack_block *cache)
> 	 {
> 	-       return cache < tp->recv_sack_cache + ARRAY_SIZE(tp->recv_sack_cache);
> 	+       return cache < ARRAY_END(tp->recv_sack_cache);
> 	 }
>
> 	 static int
> 	@@ -2109,7 +2109,7 @@ tcp_sacktag_write_queue(struct sock *sk, const struct sk_buff *ack_skb,
>
> 		if (!tp->sacked_out) {
> 			/* It's already past, so skip checking against it */
> 	-               cache = tp->recv_sack_cache + ARRAY_SIZE(tp->recv_sack_cache);
> 	+               cache = ARRAY_END(tp->recv_sack_cache);
> 		} else {
> 			cache = tp->recv_sack_cache;
> 			/* Skip empty blocks in at head of the cache */
>
>
> Have a lovely day!
> Alex
>
> --
> <https://www.alejandro-colomar.es>
>
--8323329-1350559270-1773597273=:4005--
