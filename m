Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20B371D06;
	Sun, 15 Mar 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595082; cv=none; b=ivrRrLtI/0VA6UAr+HR8bhoELvOCf0skvRE381ZtJI12o4Fz0O5Cj0oNd+LMVDqCGyMXejChtIw+RKoh2aKfyMOA1+PfwZgSMGP/leAT3hQusj8F2aW0EGq+SlGTtQ2GJ7f7oRWzWlGvVYLlXOV7E2S7nF6dEYxEIriis7MYrVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595082; c=relaxed/simple;
	bh=2Lz3iw8EaRPpLQ2q2c3Ru2o7h80jpBs85iSOLyq/ShM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGlTGaghGTD98IN1YPqxu0QyA1b5WBQXxt6hNkFCWkCQ5PuT/A3OvbsLXMzEvH9N/7rX3Rnd52wXPN/3OmB/DovottmbcbMTdHu0Df16i1p9Zh291Bg2ksGHFzXXfvQFwQMlDfS9Pep1hF/PsHGE72oArgogcxtceIYTpZS9UaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFBwA0+x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFBwA0+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FA0C4CEF7;
	Sun, 15 Mar 2026 17:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773595081;
	bh=2Lz3iw8EaRPpLQ2q2c3Ru2o7h80jpBs85iSOLyq/ShM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFBwA0+xCs+X957LKmdKbcjS0IQmz7mdB0FfFjqHKLIkM9GvWa3UTvMutt1K45S7d
	 B6cr/k43OpjDNNkBcL3voBbo+DsNGUCBwvsPC0pdD2gSgp9aQZB1Xgoaz5+hYy72KK
	 HR+iAcAuuK+zjLS8GE0eycn+9NNshLTd7C9snUnsGhIU1TemnWoMzyQQvGtBcizmtE
	 4JvQhvVKgqIeEkZBrBMgmfqOQesIjBIbDeIiHBCPB72EJYZLaK4atGeMDIy/xONCuy
	 T9+6tQm9jLj+ueOcrBBDMkfDW0ti0obZCm1hERMLs8MgczGQ/zmm877I+zNdyrZDiY
	 qsPAknoa2U5gw==
Date: Sun, 15 Mar 2026 18:17:57 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>, 
	Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Nicolas Palix <nicolas.palix@imag.fr>, 
	Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <abblv3nCut5aRk7q@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
 <aa7XD-rk_KWQvTQX@devuan>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opxaxau6jwzrl3oj"
Content-Disposition: inline
In-Reply-To: <aa7XD-rk_KWQvTQX@devuan>


--opxaxau6jwzrl3oj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>, 
	Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Nicolas Palix <nicolas.palix@imag.fr>, 
	Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <abblv3nCut5aRk7q@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
 <aa7XD-rk_KWQvTQX@devuan>
MIME-Version: 1.0
In-Reply-To: <aa7XD-rk_KWQvTQX@devuan>

Hi Markus, Julia,

On 2026-03-09T15:32:24+0100, Alejandro Colomar wrote:
> > =E2=80=A6
> > > +// Comments: No known false positives, but has a few false negatives
> >=20
> > Would such information motivate for any further software refinements?
>=20
> Yes, if anyone here knows how to handle the false negatives and wants to
> work with me on improving those, I'm very interested.
>=20
> Here's one case which isn't caught, for example (which I expect will be
> difficult to handle, if not impossible):
>=20
> 	@@ -2876,7 +2876,7 @@ static struct dentry *proc_##LSM##_attr_dir_lookup=
(struct=20
> 	inode *dir, \
> 	 { \
> 		return proc_pident_lookup(dir, dentry, \
> 					  LSM##_attr_dir_stuff, \
> 	-                                 LSM##_attr_dir_stuff + ARRAY_SIZE(LSM#=
#_attr_dir_stuff)); \
> 	+                                 ARRAY_END(LSM##_attr_dir_stuff)); \
> 	 } \
> 	 \
> 	 static const struct inode_operations proc_##LSM##_attr_dir_inode_ops =
=3D { \
>=20
> I could research and find other false negatives.

Here are more false negatives that I found manually.  The semantic patch
didn't find them.  Does anyone know how we could improve it or why it
didn't find them?

	diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
	index 8d81c1e7..d883e1bd 100644
	--- a/arch/powerpc/kernel/rtas.c
	+++ b/arch/powerpc/kernel/rtas.c
	@@ -555,10 +555,8 @@ static struct rtas_function rtas_function_table[] __r=
o_after_init =3D {
		},
	 };
	=20
	-#define for_each_rtas_function(funcp)                                    =
   \
	-       for (funcp =3D &rtas_function_table[0];                           =
    \
	-            funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_table)]=
; \
	-            ++funcp)
	+#define for_each_rtas_function(f)                                     \
	+       for (f =3D rtas_function_table; f < ARRAY_END(rtas_function_table)=
; ++f)
	=20
	 /*
	  * Nearly all RTAS calls need to be serialized. All uses of the
	diff --git a/arch/s390/purgatory/purgatory.c b/arch/s390/purgatory/purgato=
ry.c
	index ecb38102..3e45056b 100644
	--- a/arch/s390/purgatory/purgatory.c
	+++ b/arch/s390/purgatory/purgatory.c
	@@ -19,7 +19,7 @@ int verify_sha256_digest(void)
		struct sha256_ctx sctx;
	=20
		sha256_init(&sctx);
	-       end =3D purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
	+       end =3D ARRAY_END(purgatory_sha_regions);
	=20
		for (ptr =3D purgatory_sha_regions; ptr < end; ptr++)
			sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
	diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
	index f61ab1ba..988b0773 100644
	--- a/drivers/md/bcache/util.h
	+++ b/drivers/md/bcache/util.h
	@@ -273,9 +273,7 @@ do {                                                  =
                      \
		BUILD_BUG_ON(sizeof((array)->data[0]) < sizeof(void *));        \
		(array)->freelist =3D NULL;                                       \
										\
	-       for (_i =3D (array)->data;                                        \
	-            _i < (array)->data + ARRAY_SIZE((array)->data);            \
	-            _i++)                                                      \
	+       for (_i =3D (array)->data; _i < ARRAY_END((array)->data); _i++)   \
			array_free(array, _i);                                  \
	 } while (0)
	=20
	diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless=
/ath/ath9k/ath9k.h
	index 6e38aa73..c0cd2d1e 100644
	--- a/drivers/net/wireless/ath/ath9k/ath9k.h
	+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
	@@ -444,9 +444,7 @@ ath_node_to_tid(struct ath_node *an, u8 tidno)
	 #define case_rtn_string(val) case val: return #val
	=20
	 #define ath_for_each_chanctx(_sc, _ctx)                             \
	-       for (ctx =3D &sc->chanctx[0];                                 \
	-            ctx <=3D &sc->chanctx[ARRAY_SIZE(sc->chanctx) - 1];      \
	-            ctx++)
	+       for (ctx =3D &sc->chanctx[0]; ctx <=3D ARRAY_END(sc->chanctx) - 1;=
 ctx++)
	=20
	 void ath_chanctx_init(struct ath_softc *sc);
	 void ath_chanctx_set_channel(struct ath_softc *sc, struct ath_chanctx *ct=
x,
	diff --git a/drivers/net/wireless/intel/iwlwifi/mei/net.c b/drivers/net/wi=
reless/intel/iwlwifi/mei/net.c
	index eac46d1a..b0d2905d 100644
	--- a/drivers/net/wireless/intel/iwlwifi/mei/net.c
	+++ b/drivers/net/wireless/intel/iwlwifi/mei/net.c
	@@ -43,7 +43,7 @@ static bool iwl_mei_rx_filter_eth(const struct ethhdr *e=
thhdr,
			return false;
	=20
		for (filt =3D &filters->eth_filters[0];
	-            filt < &filters->eth_filters[0] + ARRAY_SIZE(filters->eth_fil=
ters);
	+            filt < ARRAY_END(filters->eth_filters);
		     filt++) {
			/* Assume there are no enabled filter after a disabled one */
			if (!(filt->flags & SAP_ETH_FILTER_ENABLED))
	@@ -142,7 +142,7 @@ iwl_mei_rx_filter_tcp_udp(struct sk_buff *skb, bool  i=
p_match,
		const struct iwl_sap_flex_filter *filt;
	=20
		for (filt =3D &filters->flex_filters[0];
	-            filt < &filters->flex_filters[0] + ARRAY_SIZE(filters->flex_f=
ilters);
	+            filt < ARRAY_END(filters->flex_filters);
		     filt++) {
			if (!(filt->flags & SAP_FLEX_FILTER_ENABLED))
				break;
	diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
	index f6ce6e26..a7aa3ce4 100644
	--- a/drivers/usb/core/devio.c
	+++ b/drivers/usb/core/devio.c
	@@ -1490,7 +1490,7 @@ static int proc_conninfo_ex(struct usb_dev_state *ps,
	=20
		if (ci.num_ports < ARRAY_SIZE(ci.ports))
			memmove(&ci.ports[0],
	-                       &ci.ports[ARRAY_SIZE(ci.ports) - ci.num_ports],
	+                       ARRAY_END(ci.ports) - ci.num_ports,
				ci.num_ports);
	=20
		if (copy_to_user(arg, &ci, min(sizeof(ci), size)))
	diff --git a/fs/smb/client/dfs.h b/fs/smb/client/dfs.h
	index e60f0a24..4977f649 100644
	--- a/fs/smb/client/dfs.h
	+++ b/fs/smb/client/dfs.h
	@@ -32,7 +32,7 @@ struct dfs_ref_walk {
	 };
	=20
	 #define ref_walk_start(w)      ((w)->refs)
	-#define ref_walk_end(w)        (&(w)->refs[ARRAY_SIZE((w)->refs) - 1])
	+#define ref_walk_end(w)        (ARRAY_END((w)->refs) - 1)
	 #define ref_walk_cur(w)        ((w)->ref)
	 #define ref_walk_descend(w)    (--ref_walk_cur(w) >=3D ref_walk_start(w))
	=20
	diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
	index 1b9b18e5..0ff49f24 100644
	--- a/kernel/bpf/core.c
	+++ b/kernel/bpf/core.c
	@@ -2298,7 +2298,7 @@ static unsigned int PROG_NAME(stack_size)(const void=
 *ctx, const struct bpf_insn
		u64 regs[MAX_BPF_EXT_REG] =3D {}; \
	 \
		kmsan_unpoison_memory(stack, sizeof(stack)); \
	-       FP =3D (u64) (unsigned long) &stack[ARRAY_SIZE(stack)]; \
	+       FP =3D (u64) (unsigned long) ARRAY_END(stack); \
		ARG1 =3D (u64) (unsigned long) ctx; \
		return ___bpf_prog_run(regs, insn); \
	 }
	@@ -2312,7 +2312,7 @@ static u64 PROG_NAME_ARGS(stack_size)(u64 r1, u64 r2=
, u64 r3, u64 r4, u64 r5, \
		u64 regs[MAX_BPF_EXT_REG]; \
	 \
		kmsan_unpoison_memory(stack, sizeof(stack)); \
	-       FP =3D (u64) (unsigned long) &stack[ARRAY_SIZE(stack)]; \
	+       FP =3D (u64) (unsigned long) ARRAY_END(stack); \
		BPF_R1 =3D r1; \
		BPF_R2 =3D r2; \
		BPF_R3 =3D r3; \
	diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
	index 198f8a0d..d98e42a3 100644
	--- a/net/ipv4/tcp_input.c
	+++ b/net/ipv4/tcp_input.c
	@@ -2009,7 +2009,7 @@ static struct sk_buff *tcp_maybe_skipping_dsack(stru=
ct sk_buff *skb,
	=20
	 static int tcp_sack_cache_ok(const struct tcp_sock *tp, const struct tcp_=
sack_block *cache)
	 {
	-       return cache < tp->recv_sack_cache + ARRAY_SIZE(tp->recv_sack_cach=
e);
	+       return cache < ARRAY_END(tp->recv_sack_cache);
	 }
	=20
	 static int
	@@ -2109,7 +2109,7 @@ tcp_sacktag_write_queue(struct sock *sk, const struc=
t sk_buff *ack_skb,
	=20
		if (!tp->sacked_out) {
			/* It's already past, so skip checking against it */
	-               cache =3D tp->recv_sack_cache + ARRAY_SIZE(tp->recv_sack_c=
ache);
	+               cache =3D ARRAY_END(tp->recv_sack_cache);
		} else {
			cache =3D tp->recv_sack_cache;
			/* Skip empty blocks in at head of the cache */


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--opxaxau6jwzrl3oj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmm26b8ACgkQ64mZXMKQ
wql5PBAAkykb7HqRWjEK8ldPEC6BUK0vqJdoGQjVyl6eyr9+jo1EsS2nkohZdYdn
h5kgD8XM/YmrnODA0tALE40J2COginmkNCjRaKSk/+nqOvow+Ztb0ziW7ia8yN9C
7djLetk613JM8rjGOVU3D7WcpiGpo4UWq00eqcgJlaCqLQP57vyBhtXfYS9MIUrG
b3X6sTw5sqYGYrw0o0zsRyu4KuctvGs8jkyAxcE+UK62qZNe4v87IWe8q2vbIq2f
+25sCZwrnvsb4zXNbR86oIFtaIObkT1f3yB84hJv2QLHR7L6XkaL/gvcaBmgdhfz
cVlfORcvHwpyDoXBDMbeFPmUiMA4p7XNxRaWxeB7KDb6iP4614H1lnWKAgPbHv+7
NrRPRLBjLbCUM3lXlyQw/FY+6XssjHE8mZ5ivFPy/iH7ZTpPZ/eMpp7t6XJNvzXb
yWbkMrLJumdtwIknCPeU5OANMzmuMxPh5NacULzTuBfzhKeVp+pQXyfjrqGaRILt
cF9I8nqH8FtAd0EiKZ/iCqzcgFt331ZthXrzy0e7HAMkLUNB8Orel8aU0F0w2J9o
3bFrN7tNR+AWf0HFpR3I5u8CGkAkIb/8PhUSVT5dDrMa2Q6FJUoW2cO8JfIzdJhk
yGBDeaHZzSaDSb6oKXLp3943XNwQdicd1Y91ak99LeXBBrGUwoY=
=C+Zu
-----END PGP SIGNATURE-----

--opxaxau6jwzrl3oj--
