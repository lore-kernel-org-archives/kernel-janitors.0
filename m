From: "Yuval Mintz" <yuvalmin@broadcom.com>
Date: Wed, 03 Oct 2012 07:20:35 +0000
Subject: Re: drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26: sparse: invalid assignment: |=
Message-Id: <506BE743.4020502@broadcom.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060703070806000501000400"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003011535.GB8750@localhost>
In-Reply-To: <20121003011535.GB8750@localhost>
To: kernel-janitors@vger.kernel.org


--------------060703070806000501000400
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit

>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3072:48: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3072:48:    expected unsigned short [usertype] *fw_hi
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3072:48:    got restricted __le16 *<noident>
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3073:48: sparse: incorrect type in argument 2 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3073:48:    expected unsigned short [usertype] *fw_mid
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3073:48:    got restricted __le16 *<noident>
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3074:48: sparse: incorrect type in argument 3 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3074:48:    expected unsigned short [usertype] *fw_lo
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3074:48:    got restricted __le16 *<noident>
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3076:48: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3076:48:    expected unsigned short [usertype] *fw_hi
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3076:48:    got restricted __le16 *<noident>
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3077:48: sparse: incorrect type in argument 2 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3077:48:    expected unsigned short [usertype] *fw_mid
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3077:48:    got restricted __le16 *<noident>
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3078:48: sparse: incorrect type in argument 3 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3078:48:    expected unsigned short [usertype] *fw_lo
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3078:48:    got restricted __le16 *<noident>
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2869:26: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2869:26:    expected restricted __le16 [usertype] global_data
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2869:26:    got int
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40:    expected unsigned short [unsigned] [usertype] val
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40:    got restricted __sum16 [usertype] check
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:40: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:38: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2888:38:    got int
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:50: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:50:    expected restricted __wsum [usertype] csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:50:    got unsigned short [unsigned] [usertype] csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2646:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:50: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:50:    expected restricted __wsum [usertype] csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:50:    got unsigned short [unsigned] [assigned] [usertype] csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2650:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2898:38: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2898:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2898:38:    got unsigned short
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29:    expected unsigned int [unsigned] [usertype] val
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29:    got restricted __be32 [usertype] seq
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:29: sparse: cast from restricted __be32
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:27: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:27:    expected restricted __le32 [usertype] tcp_send_seq
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2787:27:    got unsigned int
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: cast from restricted __be16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30:    expected unsigned short [unsigned] [usertype] val
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30:    got restricted __be16 [usertype] id
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: cast from restricted __be16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:30: sparse: cast from restricted __be16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:28: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:28:    expected restricted __le16 [usertype] ip_id
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2791:28:    got int
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25:    expected unsigned short [unsigned] [usertype] val
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25:    got fouled restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2793:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2792:38: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2792:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2792:38:    got int
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: incorrect type in argument 1 (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25:    expected unsigned short [unsigned] [usertype] val
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25:    got fouled restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2799:25: sparse: cast from restricted __sum16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2798:38: sparse: incorrect type in assignment (different base types)
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2798:38:    expected restricted __le16 [usertype] tcp_pseudo_csum
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2798:38:    got int
> + drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26: sparse: invalid assignment: |=
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26:    left side has type restricted __le16
>   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26:    right side has type int

As you can see, this new warning is not alone in the field - there are
multiple warnings which already appeared when you compiled bnx2x using sparse.

I'm currently working on a patch (attached) to solve all those compilation
warnings, yet even though it solves said issue it still lacks finesse.

It will be sent properly once net-next is re-opened and hopefully
solve this new warning as well as ~98% of the other sparse warnings.

Thanks,
Yuval




--------------060703070806000501000400
Content-Type: text/plain;
 charset=utf-8;
 name=0001-bnx2x-Fix-various-sparse-warnings.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-bnx2x-Fix-various-sparse-warnings.patch

From eb78cb1ab12a017a9336922b689281a36d949c21 Mon Sep 17 00:00:00 2001
From: Yuval Mintz <yuvalmin@broadcom.com>
Date: Wed, 3 Oct 2012 08:33:37 +0200
Subject: [PATCH net-next 1/1] bnx2x: Fix various `sparse' warnings

Solves almost all warnings that are currently received when 
compiling the driver with `C=2 CF=-D__CHECK_ENDIAN__'.

Signed-off-by: Yuval Mintz <yuvalmin@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h        |    4 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c    |   27 +++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h    |    4 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h    |   27 +++--
 .../net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h   |    2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c   |   22 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |  135 +++++++++++---------
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c     |   78 ++++++------
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.h     |   17 ++-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c  |   20 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h  |   11 +-
 11 files changed, 190 insertions(+), 157 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
index 72897c4..41425e5 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
@@ -142,8 +142,8 @@ do {						\
 #define bnx2x_mc_addr(ha)      ((ha)->addr)
 #define bnx2x_uc_addr(ha)      ((ha)->addr)
 
-#define U64_LO(x)			(u32)(((u64)(x)) & 0xffffffff)
-#define U64_HI(x)			(u32)(((u64)(x)) >> 32)
+#define U64_LO(x)			((u32)(((u64)(x)) & 0xffffffff))
+#define U64_HI(x)			((u32)(((u64)(x)) >> 32))
 #define HILO_U64(hi, lo)		((((u64)(hi)) << 32) + (lo))
 
 
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
index 30f04a3..be351e5 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
@@ -2640,17 +2640,20 @@ static noinline u16 bnx2x_tx_split(struct bnx2x *bp,
 	return bd_prod;
 }
 
-static inline u16 bnx2x_csum_fix(unsigned char *t_header, u16 csum, s8 fix)
+#define bswab32(b32) ((__force __le32) swab32((__force __u32) (b32)))
+#define bswab16(b16) ((__force __le16) swab16((__force __u16) (b16)))
+static inline __le16 bnx2x_csum_fix(unsigned char *t_header, u16 csum, s8 fix)
 {
+	__sum16 tsum = (__force __sum16) csum;
 	if (fix > 0)
-		csum = (u16) ~csum_fold(csum_sub(csum,
+		tsum = ~csum_fold(csum_sub((__force __wsum) csum,
 				csum_partial(t_header - fix, fix, 0)));
 
 	else if (fix < 0)
-		csum = (u16) ~csum_fold(csum_add(csum,
+		tsum = ~csum_fold(csum_add((__force __wsum) csum,
 				csum_partial(t_header, -fix, 0)));
 
-	return swab16(csum);
+	return bswab16(tsum);
 }
 
 static inline u32 bnx2x_xmit_type(struct bnx2x *bp, struct sk_buff *skb)
@@ -2784,23 +2787,24 @@ static inline void bnx2x_set_pbd_gso(struct sk_buff *skb,
 				     u32 xmit_type)
 {
 	pbd->lso_mss = cpu_to_le16(skb_shinfo(skb)->gso_size);
-	pbd->tcp_send_seq = swab32(tcp_hdr(skb)->seq);
+	pbd->tcp_send_seq = bswab32(tcp_hdr(skb)->seq);
 	pbd->tcp_flags = pbd_tcp_flags(skb);
 
 	if (xmit_type & XMIT_GSO_V4) {
-		pbd->ip_id = swab16(ip_hdr(skb)->id);
+		pbd->ip_id = bswab16(ip_hdr(skb)->id);
 		pbd->tcp_pseudo_csum =
-			swab16(~csum_tcpudp_magic(ip_hdr(skb)->saddr,
+			bswab16(~csum_tcpudp_magic(ip_hdr(skb)->saddr,
 						  ip_hdr(skb)->daddr,
 						  0, IPPROTO_TCP, 0));
 
 	} else
 		pbd->tcp_pseudo_csum =
-			swab16(~csum_ipv6_magic(&ipv6_hdr(skb)->saddr,
+			bswab16(~csum_ipv6_magic(&ipv6_hdr(skb)->saddr,
 						&ipv6_hdr(skb)->daddr,
 						0, IPPROTO_TCP, 0));
 
-	pbd->global_data |= ETH_TX_PARSE_BD_E1X_PSEUDO_CS_WITHOUT_LEN;
+	pbd->global_data |=
+		cpu_to_le16(ETH_TX_PARSE_BD_E1X_PSEUDO_CS_WITHOUT_LEN);
 }
 
 /**
@@ -2867,7 +2871,8 @@ static inline u8 bnx2x_set_pbd_csum(struct bnx2x *bp, struct sk_buff *skb,
 
 	/* for now NS flag is not used in Linux */
 	pbd->global_data =
-		(hlen | ((skb->protocol == cpu_to_be16(ETH_P_8021Q)) <<
+		cpu_to_le16(hlen |
+			    ((skb->protocol == cpu_to_be16(ETH_P_8021Q)) <<
 			 ETH_TX_PARSE_BD_E1X_LLC_SNAP_EN_SHIFT));
 
 	pbd->ip_hlen_w = (skb_transport_header(skb) -
@@ -2885,7 +2890,7 @@ static inline u8 bnx2x_set_pbd_csum(struct bnx2x *bp, struct sk_buff *skb,
 	hlen = hlen*2;
 
 	if (xmit_type & XMIT_CSUM_TCP) {
-		pbd->tcp_pseudo_csum = swab16(tcp_hdr(skb)->check);
+		pbd->tcp_pseudo_csum = bswab16(tcp_hdr(skb)->check);
 
 	} else {
 		s8 fix = SKB_CS_OFF(skb); /* signed! */
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h
index 9c5ea6c..82fccd7 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h
@@ -932,8 +932,8 @@ static inline int bnx2x_func_start(struct bnx2x *bp)
  * @fw_lo:	pointer to lower part
  * @mac:	pointer to MAC address
  */
-static inline void bnx2x_set_fw_mac_addr(u16 *fw_hi, u16 *fw_mid, u16 *fw_lo,
-					 u8 *mac)
+static inline void bnx2x_set_fw_mac_addr(__le16 *fw_hi, __le16 *fw_mid,
+					  __le16 *fw_lo, u8 *mac)
 {
 	((u8 *)fw_hi)[0]  = mac[1];
 	((u8 *)fw_hi)[1]  = mac[0];
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
index 1870492..81ffc55 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h
@@ -3348,6 +3348,11 @@ struct regpair {
 };
 
 
+struct regpair_native {
+	u32 lo;
+	u32 hi;
+};
+
 /*
  * Classify rule opcodes in E2/E3
  */
@@ -4373,13 +4378,13 @@ struct tstorm_eth_function_common_config {
  * MAC filtering configuration parameters per port in Tstorm
  */
 struct tstorm_eth_mac_filter_config {
-	__le32 ucast_drop_all;
-	__le32 ucast_accept_all;
-	__le32 mcast_drop_all;
-	__le32 mcast_accept_all;
-	__le32 bcast_accept_all;
-	__le32 vlan_filter[2];
-	__le32 unmatched_unicast;
+	u32 ucast_drop_all;
+	u32 ucast_accept_all;
+	u32 mcast_drop_all;
+	u32 mcast_accept_all;
+	u32 bcast_accept_all;
+	u32 vlan_filter[2];
+	u32 unmatched_unicast;
 };
 
 
@@ -4862,7 +4867,7 @@ union event_data {
  * per PF event ring data
  */
 struct event_ring_data {
-	struct regpair base_addr;
+	struct regpair_native base_addr;
 #if defined(__BIG_ENDIAN)
 	u8 index_id;
 	u8 sb_id;
@@ -5093,7 +5098,7 @@ struct pci_entity {
  * The fast-path status block meta-data, common to all chips
  */
 struct hc_sb_data {
-	struct regpair host_sb_addr;
+	struct regpair_native host_sb_addr;
 	struct hc_status_block_sm state_machine[HC_SB_MAX_SM];
 	struct pci_entity p_func;
 #if defined(__BIG_ENDIAN)
@@ -5107,7 +5112,7 @@ struct hc_sb_data {
 	u8 state;
 	u8 rsrv0;
 #endif
-	struct regpair rsrv1[2];
+	struct regpair_native rsrv1[2];
 };
 
 
@@ -5125,7 +5130,7 @@ enum hc_segment {
  * The fast-path status block meta-data
  */
 struct hc_sp_status_block_data {
-	struct regpair host_sb_addr;
+	struct regpair_native host_sb_addr;
 #if defined(__BIG_ENDIAN)
 	u8 rsrv1;
 	u8 state;
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
index fe66d90..ea453fc 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h
@@ -218,7 +218,7 @@ static void bnx2x_init_wr_zp(struct bnx2x *bp, u32 addr, u32 len,
 	/* gunzip_outlen is in dwords */
 	len = GUNZIP_OUTLEN(bp);
 	for (i = 0; i < len; i++)
-		((u32 *)GUNZIP_BUF(bp))[i] =
+		((u32 *)GUNZIP_BUF(bp))[i] = (__force u32)
 				cpu_to_le32(((u32 *)GUNZIP_BUF(bp))[i]);
 
 	bnx2x_write_big_buf_wb(bp, addr, len);
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
index e2e45ee..832c42d 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c
@@ -11866,8 +11866,8 @@ int bnx2x_phy_probe(struct link_params *params)
 	return 0;
 }
 
-void bnx2x_init_bmac_loopback(struct link_params *params,
-			      struct link_vars *vars)
+static void bnx2x_init_bmac_loopback(struct link_params *params,
+				     struct link_vars *vars)
 {
 	struct bnx2x *bp = params->bp;
 		vars->link_up = 1;
@@ -11886,8 +11886,8 @@ void bnx2x_init_bmac_loopback(struct link_params *params,
 		REG_WR(bp, NIG_REG_EGRESS_DRAIN0_MODE + params->port*4, 0);
 }
 
-void bnx2x_init_emac_loopback(struct link_params *params,
-			      struct link_vars *vars)
+static void bnx2x_init_emac_loopback(struct link_params *params,
+				     struct link_vars *vars)
 {
 	struct bnx2x *bp = params->bp;
 		vars->link_up = 1;
@@ -11905,8 +11905,8 @@ void bnx2x_init_emac_loopback(struct link_params *params,
 		REG_WR(bp, NIG_REG_EGRESS_DRAIN0_MODE + params->port*4, 0);
 }
 
-void bnx2x_init_xmac_loopback(struct link_params *params,
-			      struct link_vars *vars)
+static void bnx2x_init_xmac_loopback(struct link_params *params,
+				     struct link_vars *vars)
 {
 	struct bnx2x *bp = params->bp;
 	vars->link_up = 1;
@@ -11931,8 +11931,8 @@ void bnx2x_init_xmac_loopback(struct link_params *params,
 	REG_WR(bp, NIG_REG_EGRESS_DRAIN0_MODE + params->port*4, 0);
 }
 
-void bnx2x_init_umac_loopback(struct link_params *params,
-			      struct link_vars *vars)
+static void bnx2x_init_umac_loopback(struct link_params *params,
+				     struct link_vars *vars)
 {
 	struct bnx2x *bp = params->bp;
 	vars->link_up = 1;
@@ -11946,8 +11946,8 @@ void bnx2x_init_umac_loopback(struct link_params *params,
 	REG_WR(bp, NIG_REG_EGRESS_DRAIN0_MODE + params->port*4, 0);
 }
 
-void bnx2x_init_xgxs_loopback(struct link_params *params,
-			      struct link_vars *vars)
+static void bnx2x_init_xgxs_loopback(struct link_params *params,
+				     struct link_vars *vars)
 {
 	struct bnx2x *bp = params->bp;
 		vars->link_up = 1;
@@ -12747,7 +12747,7 @@ static int bnx2x_84833_pre_init_phy(struct bnx2x *bp,
 	return 0;
 }
 
-int bnx2x_pre_init_phy(struct bnx2x *bp,
+static int bnx2x_pre_init_phy(struct bnx2x *bp,
 				  u32 shmem_base,
 				  u32 shmem2_base,
 				  u32 chip_id)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index f7ed122..a85e99c 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -1129,8 +1129,7 @@ static void bnx2x_tx_hw_flushed(struct bnx2x *bp, u32 poll_count)
 static int bnx2x_send_final_clnup(struct bnx2x *bp, u8 clnup_func,
 					 u32 poll_cnt)
 {
-	struct sdm_op_gen op_gen = {0};
-
+	u32 op_gen_command = 0;
 	u32 comp_addr = BAR_CSTRORM_INTMEM +
 			CSTORM_FINAL_CLEANUP_COMPLETE_OFFSET(clnup_func);
 	int ret = 0;
@@ -1140,13 +1139,13 @@ static int bnx2x_send_final_clnup(struct bnx2x *bp, u8 clnup_func,
 		return 1;
 	}
 
-	op_gen.command |= OP_GEN_PARAM(XSTORM_AGG_INT_FINAL_CLEANUP_INDEX);
-	op_gen.command |= OP_GEN_TYPE(XSTORM_AGG_INT_FINAL_CLEANUP_COMP_TYPE);
-	op_gen.command |= OP_GEN_AGG_VECT(clnup_func);
-	op_gen.command |= 1 << SDM_OP_GEN_AGG_VECT_IDX_VALID_SHIFT;
+	op_gen_command |= OP_GEN_PARAM(XSTORM_AGG_INT_FINAL_CLEANUP_INDEX);
+	op_gen_command |= OP_GEN_TYPE(XSTORM_AGG_INT_FINAL_CLEANUP_COMP_TYPE);
+	op_gen_command |= OP_GEN_AGG_VECT(clnup_func);
+	op_gen_command |= 1 << SDM_OP_GEN_AGG_VECT_IDX_VALID_SHIFT;
 
 	DP(BNX2X_MSG_SP, "sending FW Final cleanup\n");
-	REG_WR(bp, XSDM_REG_OPERATION_GEN, op_gen.command);
+	REG_WR(bp, XSDM_REG_OPERATION_GEN, op_gen_command);
 
 	if (bnx2x_flr_clnup_reg_poll(bp, comp_addr, 1, poll_cnt) != 1) {
 		BNX2X_ERR("FW final cleanup did not succeed\n");
@@ -1483,7 +1482,7 @@ static void bnx2x_igu_int_disable(struct bnx2x *bp)
 		BNX2X_ERR("BUG! proper val not read from IGU!\n");
 }
 
-void bnx2x_int_disable(struct bnx2x *bp)
+static void bnx2x_int_disable(struct bnx2x *bp)
 {
 	if (bp->common.int_block == INT_BLOCK_HC)
 		bnx2x_hc_int_disable(bp);
@@ -2464,7 +2463,7 @@ void bnx2x__link_status_update(struct bnx2x *bp)
 static int bnx2x_afex_func_update(struct bnx2x *bp, u16 vifid,
 				  u16 vlan_val, u8 allowed_prio)
 {
-	struct bnx2x_func_state_params func_params = {0};
+	struct bnx2x_func_state_params func_params = {NULL};
 	struct bnx2x_func_afex_update_params *f_update_params =
 		&func_params.params.afex_update;
 
@@ -2489,7 +2488,7 @@ static int bnx2x_afex_func_update(struct bnx2x *bp, u16 vifid,
 static int bnx2x_afex_handle_vif_list_cmd(struct bnx2x *bp, u8 cmd_type,
 					  u16 vif_index, u8 func_bit_map)
 {
-	struct bnx2x_func_state_params func_params = {0};
+	struct bnx2x_func_state_params func_params = {NULL};
 	struct bnx2x_func_afex_viflists_params *update_params =
 		&func_params.params.afex_viflists;
 	int rc;
@@ -2505,7 +2504,7 @@ static int bnx2x_afex_handle_vif_list_cmd(struct bnx2x *bp, u8 cmd_type,
 
 	/* set parameters according to cmd_type */
 	update_params->afex_vif_list_command = cmd_type;
-	update_params->vif_list_index = cpu_to_le16(vif_index);
+	update_params->vif_list_index = vif_index;
 	update_params->func_bit_map =
 		(cmd_type == VIF_LIST_RULE_GET) ? 0 : func_bit_map;
 	update_params->func_to_clear = 0;
@@ -3100,65 +3099,75 @@ static void bnx2x_drv_info_fcoe_stat(struct bnx2x *bp)
 		struct fcoe_statistics_params *fw_fcoe_stat =
 			&bp->fw_stats_data->fcoe;
 
-		ADD_64(fcoe_stat->rx_bytes_hi, 0, fcoe_stat->rx_bytes_lo,
-		       fw_fcoe_stat->rx_stat0.fcoe_rx_byte_cnt);
+		ADD_64_LE(fcoe_stat->rx_bytes_hi, LE32_0,
+			  fcoe_stat->rx_bytes_lo,
+			  fw_fcoe_stat->rx_stat0.fcoe_rx_byte_cnt);
 
-		ADD_64(fcoe_stat->rx_bytes_hi,
-		       fcoe_q_tstorm_stats->rcv_ucast_bytes.hi,
-		       fcoe_stat->rx_bytes_lo,
-		       fcoe_q_tstorm_stats->rcv_ucast_bytes.lo);
+		ADD_64_LE(fcoe_stat->rx_bytes_hi,
+			  fcoe_q_tstorm_stats->rcv_ucast_bytes.hi,
+			  fcoe_stat->rx_bytes_lo,
+			  fcoe_q_tstorm_stats->rcv_ucast_bytes.lo);
 
-		ADD_64(fcoe_stat->rx_bytes_hi,
-		       fcoe_q_tstorm_stats->rcv_bcast_bytes.hi,
-		       fcoe_stat->rx_bytes_lo,
-		       fcoe_q_tstorm_stats->rcv_bcast_bytes.lo);
+		ADD_64_LE(fcoe_stat->rx_bytes_hi,
+			  fcoe_q_tstorm_stats->rcv_bcast_bytes.hi,
+			  fcoe_stat->rx_bytes_lo,
+			  fcoe_q_tstorm_stats->rcv_bcast_bytes.lo);
 
-		ADD_64(fcoe_stat->rx_bytes_hi,
-		       fcoe_q_tstorm_stats->rcv_mcast_bytes.hi,
-		       fcoe_stat->rx_bytes_lo,
-		       fcoe_q_tstorm_stats->rcv_mcast_bytes.lo);
+		ADD_64_LE(fcoe_stat->rx_bytes_hi,
+			  fcoe_q_tstorm_stats->rcv_mcast_bytes.hi,
+			  fcoe_stat->rx_bytes_lo,
+			  fcoe_q_tstorm_stats->rcv_mcast_bytes.lo);
 
-		ADD_64(fcoe_stat->rx_frames_hi, 0, fcoe_stat->rx_frames_lo,
-		       fw_fcoe_stat->rx_stat0.fcoe_rx_pkt_cnt);
+		ADD_64_LE(fcoe_stat->rx_frames_hi, LE32_0,
+			  fcoe_stat->rx_frames_lo,
+			  fw_fcoe_stat->rx_stat0.fcoe_rx_pkt_cnt);
 
-		ADD_64(fcoe_stat->rx_frames_hi, 0, fcoe_stat->rx_frames_lo,
-		       fcoe_q_tstorm_stats->rcv_ucast_pkts);
+		ADD_64_LE(fcoe_stat->rx_frames_hi, LE32_0,
+			  fcoe_stat->rx_frames_lo,
+			  fcoe_q_tstorm_stats->rcv_ucast_pkts);
 
-		ADD_64(fcoe_stat->rx_frames_hi, 0, fcoe_stat->rx_frames_lo,
-		       fcoe_q_tstorm_stats->rcv_bcast_pkts);
+		ADD_64_LE(fcoe_stat->rx_frames_hi, LE32_0,
+			  fcoe_stat->rx_frames_lo,
+			  fcoe_q_tstorm_stats->rcv_bcast_pkts);
 
-		ADD_64(fcoe_stat->rx_frames_hi, 0, fcoe_stat->rx_frames_lo,
-		       fcoe_q_tstorm_stats->rcv_mcast_pkts);
+		ADD_64_LE(fcoe_stat->rx_frames_hi, LE32_0,
+			  fcoe_stat->rx_frames_lo,
+			  fcoe_q_tstorm_stats->rcv_mcast_pkts);
 
-		ADD_64(fcoe_stat->tx_bytes_hi, 0, fcoe_stat->tx_bytes_lo,
-		       fw_fcoe_stat->tx_stat.fcoe_tx_byte_cnt);
+		ADD_64_LE(fcoe_stat->tx_bytes_hi, LE32_0,
+			  fcoe_stat->tx_bytes_lo,
+			  fw_fcoe_stat->tx_stat.fcoe_tx_byte_cnt);
 
-		ADD_64(fcoe_stat->tx_bytes_hi,
-		       fcoe_q_xstorm_stats->ucast_bytes_sent.hi,
-		       fcoe_stat->tx_bytes_lo,
-		       fcoe_q_xstorm_stats->ucast_bytes_sent.lo);
+		ADD_64_LE(fcoe_stat->tx_bytes_hi,
+			  fcoe_q_xstorm_stats->ucast_bytes_sent.hi,
+			  fcoe_stat->tx_bytes_lo,
+			  fcoe_q_xstorm_stats->ucast_bytes_sent.lo);
 
-		ADD_64(fcoe_stat->tx_bytes_hi,
-		       fcoe_q_xstorm_stats->bcast_bytes_sent.hi,
-		       fcoe_stat->tx_bytes_lo,
-		       fcoe_q_xstorm_stats->bcast_bytes_sent.lo);
+		ADD_64_LE(fcoe_stat->tx_bytes_hi,
+			  fcoe_q_xstorm_stats->bcast_bytes_sent.hi,
+			  fcoe_stat->tx_bytes_lo,
+			  fcoe_q_xstorm_stats->bcast_bytes_sent.lo);
 
-		ADD_64(fcoe_stat->tx_bytes_hi,
-		       fcoe_q_xstorm_stats->mcast_bytes_sent.hi,
-		       fcoe_stat->tx_bytes_lo,
-		       fcoe_q_xstorm_stats->mcast_bytes_sent.lo);
+		ADD_64_LE(fcoe_stat->tx_bytes_hi,
+			  fcoe_q_xstorm_stats->mcast_bytes_sent.hi,
+			  fcoe_stat->tx_bytes_lo,
+			  fcoe_q_xstorm_stats->mcast_bytes_sent.lo);
 
-		ADD_64(fcoe_stat->tx_frames_hi, 0, fcoe_stat->tx_frames_lo,
-		       fw_fcoe_stat->tx_stat.fcoe_tx_pkt_cnt);
+		ADD_64_LE(fcoe_stat->tx_frames_hi, LE32_0,
+			  fcoe_stat->tx_frames_lo,
+			  fw_fcoe_stat->tx_stat.fcoe_tx_pkt_cnt);
 
-		ADD_64(fcoe_stat->tx_frames_hi, 0, fcoe_stat->tx_frames_lo,
-		       fcoe_q_xstorm_stats->ucast_pkts_sent);
+		ADD_64_LE(fcoe_stat->tx_frames_hi, LE32_0,
+			  fcoe_stat->tx_frames_lo,
+			  fcoe_q_xstorm_stats->ucast_pkts_sent);
 
-		ADD_64(fcoe_stat->tx_frames_hi, 0, fcoe_stat->tx_frames_lo,
-		       fcoe_q_xstorm_stats->bcast_pkts_sent);
+		ADD_64_LE(fcoe_stat->tx_frames_hi, LE32_0,
+			  fcoe_stat->tx_frames_lo,
+			  fcoe_q_xstorm_stats->bcast_pkts_sent);
 
-		ADD_64(fcoe_stat->tx_frames_hi, 0, fcoe_stat->tx_frames_lo,
-		       fcoe_q_xstorm_stats->mcast_pkts_sent);
+		ADD_64_LE(fcoe_stat->tx_frames_hi, LE32_0,
+			  fcoe_stat->tx_frames_lo,
+			  fcoe_q_xstorm_stats->mcast_pkts_sent);
 	}
 
 	/* ask L5 driver to add data to the struct */
@@ -4827,7 +4836,9 @@ static void bnx2x_eq_int(struct bnx2x *bp)
 
 		elem = &bp->eq_ring[EQ_DESC(sw_cons)];
 
-		cid = SW_CID(elem->message.data.cfc_del_event.cid);
+		/* elem CID originates from FW; actually LE */
+		cid = SW_CID((__force __le32)
+			     elem->message.data.cfc_del_event.cid);
 		opcode = elem->message.opcode;
 
 
@@ -7823,7 +7834,7 @@ static void bnx2x_pf_q_prep_init(struct bnx2x *bp,
 	}
 }
 
-int bnx2x_setup_tx_only(struct bnx2x *bp, struct bnx2x_fastpath *fp,
+static int bnx2x_setup_tx_only(struct bnx2x *bp, struct bnx2x_fastpath *fp,
 			struct bnx2x_queue_state_params *q_params,
 			struct bnx2x_queue_setup_tx_only_params *tx_only_params,
 			int tx_index, bool leading)
@@ -8850,7 +8861,7 @@ static int bnx2x_process_kill(struct bnx2x *bp, bool global)
 	return 0;
 }
 
-int bnx2x_leader_reset(struct bnx2x *bp)
+static int bnx2x_leader_reset(struct bnx2x *bp)
 {
 	int rc = 0;
 	bool global = bnx2x_reset_is_global(bp);
@@ -10129,10 +10140,10 @@ static void __devinit bnx2x_link_settings_requested(struct bnx2x *bp)
 
 static void __devinit bnx2x_set_mac_buf(u8 *mac_buf, u32 mac_lo, u16 mac_hi)
 {
-	mac_hi = cpu_to_be16(mac_hi);
-	mac_lo = cpu_to_be32(mac_lo);
-	memcpy(mac_buf, &mac_hi, sizeof(mac_hi));
-	memcpy(mac_buf + sizeof(mac_hi), &mac_lo, sizeof(mac_lo));
+	__be16 mac_hi_be = cpu_to_be16(mac_hi);
+	__be32 mac_lo_be = cpu_to_be32(mac_lo);
+	memcpy(mac_buf, &mac_hi_be, sizeof(mac_hi_be));
+	memcpy(mac_buf + sizeof(mac_hi_be), &mac_lo_be, sizeof(mac_lo_be));
 }
 
 static void __devinit bnx2x_get_port_hwinfo(struct bnx2x *bp)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
index 71971a1..f16ed31 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.c
@@ -707,7 +707,8 @@ static inline void bnx2x_vlan_mac_set_cmd_hdr_e2(struct bnx2x *bp,
 static inline void bnx2x_vlan_mac_set_rdata_hdr_e2(u32 cid, int type,
 				struct eth_classify_header *hdr, int rule_cnt)
 {
-	hdr->echo = (cid & BNX2X_SWCID_MASK) | (type << BNX2X_SWCID_SHIFT);
+	hdr->echo = cpu_to_le32((cid & BNX2X_SWCID_MASK) |
+				(type << BNX2X_SWCID_SHIFT));
 	hdr->rule_cnt = (u8)rule_cnt;
 }
 
@@ -813,8 +814,9 @@ static inline void bnx2x_vlan_mac_set_rdata_hdr_e1x(struct bnx2x *bp,
 
 	hdr->length = 1;
 	hdr->offset = (u8)cam_offset;
-	hdr->client_id = 0xff;
-	hdr->echo = ((r->cid & BNX2X_SWCID_MASK) | (type << BNX2X_SWCID_SHIFT));
+	hdr->client_id = cpu_to_le16(0xff);
+	hdr->echo = cpu_to_le32((r->cid & BNX2X_SWCID_MASK) |
+				(type << BNX2X_SWCID_SHIFT));
 }
 
 static inline void bnx2x_vlan_mac_set_cfg_entry_e1x(struct bnx2x *bp,
@@ -953,7 +955,7 @@ static void bnx2x_set_one_vlan_mac_e2(struct bnx2x *bp,
 		(struct eth_classify_rules_ramrod_data *)(raw->rdata);
 	int rule_cnt = rule_idx + 1;
 	union eth_classify_rule_cmd *rule_entry = &data->rules[rule_idx];
-	int cmd = elem->cmd_data.vlan_mac.cmd;
+	enum bnx2x_vlan_mac_cmd cmd = elem->cmd_data.vlan_mac.cmd;
 	bool add = (cmd == BNX2X_VLAN_MAC_ADD) ? true : false;
 	u16 vlan = elem->cmd_data.vlan_mac.u.vlan_mac.vlan;
 	u8 *mac = elem->cmd_data.vlan_mac.u.vlan_mac.mac;
@@ -1532,7 +1534,7 @@ static inline int bnx2x_vlan_mac_get_registry_elem(
 	bool restore,
 	struct bnx2x_vlan_mac_registry_elem **re)
 {
-	int cmd = elem->cmd_data.vlan_mac.cmd;
+	enum bnx2x_vlan_mac_cmd cmd = elem->cmd_data.vlan_mac.cmd;
 	struct bnx2x_vlan_mac_registry_elem *reg_elem;
 
 	/* Allocate a new registry element if needed. */
@@ -1591,7 +1593,7 @@ static int bnx2x_execute_vlan_mac(struct bnx2x *bp,
 	bool restore = test_bit(RAMROD_RESTORE, ramrod_flags);
 	bool drv_only = test_bit(RAMROD_DRV_CLR_ONLY, ramrod_flags);
 	struct bnx2x_vlan_mac_registry_elem *reg_elem;
-	int cmd;
+	enum bnx2x_vlan_mac_cmd cmd;
 
 	/*
 	 * If DRIVER_ONLY execution is requested, cleanup a registry
@@ -2186,7 +2188,7 @@ static inline void bnx2x_rx_mode_set_rdata_hdr_e2(u32 cid,
 				struct eth_classify_header *hdr,
 				u8 rule_cnt)
 {
-	hdr->echo = cid;
+	hdr->echo = cpu_to_le32(cid);
 	hdr->rule_cnt = rule_cnt;
 }
 
@@ -2429,7 +2431,7 @@ static int bnx2x_mcast_wait(struct bnx2x *bp,
 static int bnx2x_mcast_enqueue_cmd(struct bnx2x *bp,
 				   struct bnx2x_mcast_obj *o,
 				   struct bnx2x_mcast_ramrod_params *p,
-				   int cmd)
+				   enum bnx2x_mcast_cmd cmd)
 {
 	int total_sz;
 	struct bnx2x_pending_mcast_cmd *new_cmd;
@@ -2561,7 +2563,7 @@ static inline u8 bnx2x_mcast_get_rx_tx_flag(struct bnx2x_mcast_obj *o)
 static void bnx2x_mcast_set_one_rule_e2(struct bnx2x *bp,
 					struct bnx2x_mcast_obj *o, int idx,
 					union bnx2x_mcast_config_data *cfg_data,
-					int cmd)
+					enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_raw_obj *r = &o->raw;
 	struct eth_multicast_rules_ramrod_data *data =
@@ -2625,7 +2627,7 @@ static inline int bnx2x_mcast_handle_restore_cmd_e2(
 	int *rdata_idx)
 {
 	int cur_bin, cnt = *rdata_idx;
-	union bnx2x_mcast_config_data cfg_data = {0};
+	union bnx2x_mcast_config_data cfg_data = {NULL};
 
 	/* go through the registry and configure the bins from it */
 	for (cur_bin = bnx2x_mcast_get_next_bin(o, start_bin); cur_bin >= 0;
@@ -2657,7 +2659,7 @@ static inline void bnx2x_mcast_hdl_pending_add_e2(struct bnx2x *bp,
 {
 	struct bnx2x_mcast_mac_elem *pmac_pos, *pmac_pos_n;
 	int cnt = *line_idx;
-	union bnx2x_mcast_config_data cfg_data = {0};
+	union bnx2x_mcast_config_data cfg_data = {NULL};
 
 	list_for_each_entry_safe(pmac_pos, pmac_pos_n, &cmd_pos->data.macs_head,
 				 link) {
@@ -2780,7 +2782,7 @@ static inline void bnx2x_mcast_hdl_add(struct bnx2x *bp,
 	int *line_idx)
 {
 	struct bnx2x_mcast_list_elem *mlist_pos;
-	union bnx2x_mcast_config_data cfg_data = {0};
+	union bnx2x_mcast_config_data cfg_data = {NULL};
 	int cnt = *line_idx;
 
 	list_for_each_entry(mlist_pos, &p->mcast_list, link) {
@@ -2827,7 +2829,8 @@ static inline void bnx2x_mcast_hdl_del(struct bnx2x *bp,
  * Returns number of lines filled in the ramrod data in total.
  */
 static inline int bnx2x_mcast_handle_current_cmd(struct bnx2x *bp,
-			struct bnx2x_mcast_ramrod_params *p, int cmd,
+			struct bnx2x_mcast_ramrod_params *p,
+			enum bnx2x_mcast_cmd cmd,
 			int start_cnt)
 {
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
@@ -2861,7 +2864,7 @@ static inline int bnx2x_mcast_handle_current_cmd(struct bnx2x *bp,
 
 static int bnx2x_mcast_validate_e2(struct bnx2x *bp,
 				   struct bnx2x_mcast_ramrod_params *p,
-				   int cmd)
+				   enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
 	int reg_sz = o->get_registry_size(o);
@@ -2930,8 +2933,9 @@ static inline void bnx2x_mcast_set_rdata_hdr_e2(struct bnx2x *bp,
 	struct eth_multicast_rules_ramrod_data *data =
 		(struct eth_multicast_rules_ramrod_data *)(r->rdata);
 
-	data->header.echo = ((r->cid & BNX2X_SWCID_MASK) |
-			  (BNX2X_FILTER_MCAST_PENDING << BNX2X_SWCID_SHIFT));
+	data->header.echo = cpu_to_le32((r->cid & BNX2X_SWCID_MASK) |
+					(BNX2X_FILTER_MCAST_PENDING <<
+					 BNX2X_SWCID_SHIFT));
 	data->header.rule_cnt = len;
 }
 
@@ -2965,7 +2969,7 @@ static inline int bnx2x_mcast_refresh_registry_e2(struct bnx2x *bp,
 
 static int bnx2x_mcast_setup_e2(struct bnx2x *bp,
 				struct bnx2x_mcast_ramrod_params *p,
-				int cmd)
+				enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_raw_obj *raw = &p->mcast_obj->raw;
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
@@ -3051,7 +3055,7 @@ static int bnx2x_mcast_setup_e2(struct bnx2x *bp,
 
 static int bnx2x_mcast_validate_e1h(struct bnx2x *bp,
 				    struct bnx2x_mcast_ramrod_params *p,
-				    int cmd)
+				    enum bnx2x_mcast_cmd cmd)
 {
 	/* Mark, that there is a work to do */
 	if ((cmd == BNX2X_MCAST_CMD_DEL) || (cmd == BNX2X_MCAST_CMD_RESTORE))
@@ -3113,7 +3117,7 @@ static inline void bnx2x_mcast_hdl_restore_e1h(struct bnx2x *bp,
  */
 static int bnx2x_mcast_setup_e1h(struct bnx2x *bp,
 				 struct bnx2x_mcast_ramrod_params *p,
-				 int cmd)
+				 enum bnx2x_mcast_cmd cmd)
 {
 	int i;
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
@@ -3167,7 +3171,7 @@ static int bnx2x_mcast_setup_e1h(struct bnx2x *bp,
 
 static int bnx2x_mcast_validate_e1(struct bnx2x *bp,
 				   struct bnx2x_mcast_ramrod_params *p,
-				   int cmd)
+				   enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
 	int reg_sz = o->get_registry_size(o);
@@ -3240,7 +3244,7 @@ static void bnx2x_mcast_revert_e1(struct bnx2x *bp,
 static void bnx2x_mcast_set_one_rule_e1(struct bnx2x *bp,
 					struct bnx2x_mcast_obj *o, int idx,
 					union bnx2x_mcast_config_data *cfg_data,
-					int cmd)
+					enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_raw_obj *r = &o->raw;
 	struct mac_configuration_cmd *data =
@@ -3284,9 +3288,10 @@ static inline void bnx2x_mcast_set_rdata_hdr_e1(struct bnx2x *bp,
 		     BNX2X_MAX_MULTICAST*(1 + r->func_id));
 
 	data->hdr.offset = offset;
-	data->hdr.client_id = 0xff;
-	data->hdr.echo = ((r->cid & BNX2X_SWCID_MASK) |
-			  (BNX2X_FILTER_MCAST_PENDING << BNX2X_SWCID_SHIFT));
+	data->hdr.client_id = cpu_to_le16(0xff);
+	data->hdr.echo = cpu_to_le32((r->cid & BNX2X_SWCID_MASK) |
+				     (BNX2X_FILTER_MCAST_PENDING <<
+				      BNX2X_SWCID_SHIFT));
 	data->hdr.length = len;
 }
 
@@ -3309,7 +3314,7 @@ static inline int bnx2x_mcast_handle_restore_cmd_e1(
 {
 	struct bnx2x_mcast_mac_elem *elem;
 	int i = 0;
-	union bnx2x_mcast_config_data cfg_data = {0};
+	union bnx2x_mcast_config_data cfg_data = {NULL};
 
 	/* go through the registry and configure the MACs from it. */
 	list_for_each_entry(elem, &o->registry.exact_match.macs, link) {
@@ -3334,7 +3339,7 @@ static inline int bnx2x_mcast_handle_pending_cmds_e1(
 	struct bnx2x_pending_mcast_cmd *cmd_pos;
 	struct bnx2x_mcast_mac_elem *pmac_pos;
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
-	union bnx2x_mcast_config_data cfg_data = {0};
+	union bnx2x_mcast_config_data cfg_data = {NULL};
 	int cnt = 0;
 
 
@@ -3458,7 +3463,7 @@ static inline int bnx2x_mcast_refresh_registry_e1(struct bnx2x *bp,
 
 static int bnx2x_mcast_setup_e1(struct bnx2x *bp,
 				struct bnx2x_mcast_ramrod_params *p,
-				int cmd)
+				enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
 	struct bnx2x_raw_obj *raw = &o->raw;
@@ -3562,7 +3567,7 @@ static void bnx2x_mcast_set_registry_size_aprox(struct bnx2x_mcast_obj *o,
 
 int bnx2x_config_mcast(struct bnx2x *bp,
 		       struct bnx2x_mcast_ramrod_params *p,
-		       int cmd)
+		       enum bnx2x_mcast_cmd cmd)
 {
 	struct bnx2x_mcast_obj *o = p->mcast_obj;
 	struct bnx2x_raw_obj *r = &o->raw;
@@ -4085,8 +4090,8 @@ static int bnx2x_setup_rss(struct bnx2x *bp,
 	DP(BNX2X_MSG_SP, "Configuring RSS\n");
 
 	/* Set an echo field */
-	data->echo = (r->cid & BNX2X_SWCID_MASK) |
-		     (r->state << BNX2X_SWCID_SHIFT);
+	data->echo = cpu_to_le32((r->cid & BNX2X_SWCID_MASK) |
+				 (r->state << BNX2X_SWCID_SHIFT));
 
 	/* RSS mode */
 	if (test_bit(BNX2X_RSS_MODE_DISABLED, &p->rss_flags))
@@ -5681,21 +5686,20 @@ inline int bnx2x_func_send_afex_viflists(struct bnx2x *bp,
 	struct bnx2x_func_sp_obj *o = params->f_obj;
 	struct afex_vif_list_ramrod_data *rdata =
 		(struct afex_vif_list_ramrod_data *)o->afex_rdata;
-	struct bnx2x_func_afex_viflists_params *afex_viflist_params =
+	struct bnx2x_func_afex_viflists_params *afex_vif_params =
 		&params->params.afex_viflists;
 	u64 *p_rdata = (u64 *)rdata;
 
 	memset(rdata, 0, sizeof(*rdata));
 
 	/* Fill the ramrod data with provided parameters */
-	rdata->vif_list_index = afex_viflist_params->vif_list_index;
-	rdata->func_bit_map = afex_viflist_params->func_bit_map;
-	rdata->afex_vif_list_command =
-		afex_viflist_params->afex_vif_list_command;
-	rdata->func_to_clear = afex_viflist_params->func_to_clear;
+	rdata->vif_list_index = cpu_to_le16(afex_vif_params->vif_list_index);
+	rdata->func_bit_map          = afex_vif_params->func_bit_map;
+	rdata->afex_vif_list_command = afex_vif_params->afex_vif_list_command;
+	rdata->func_to_clear         = afex_vif_params->func_to_clear;
 
 	/* send in echo type of sub command */
-	rdata->echo = afex_viflist_params->afex_vif_list_command;
+	rdata->echo = afex_vif_params->afex_vif_list_command;
 
 	/*  No need for an explicit memory barrier here as long we would
 	 *  need to ensure the ordering of writing to the SPQ element
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.h
index acf2fe4..f359cc2 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sp.h
@@ -518,7 +518,7 @@ struct bnx2x_mcast_ramrod_params {
 	int mcast_list_len;
 };
 
-enum {
+enum bnx2x_mcast_cmd {
 	BNX2X_MCAST_CMD_ADD,
 	BNX2X_MCAST_CMD_CONT,
 	BNX2X_MCAST_CMD_DEL,
@@ -567,7 +567,8 @@ struct bnx2x_mcast_obj {
 	 * @param cmd command to execute (BNX2X_MCAST_CMD_X, see above)
 	 */
 	int (*config_mcast)(struct bnx2x *bp,
-				struct bnx2x_mcast_ramrod_params *p, int cmd);
+				struct bnx2x_mcast_ramrod_params *p,
+				enum bnx2x_mcast_cmd cmd);
 
 	/**
 	 * Fills the ramrod data during the RESTORE flow.
@@ -584,11 +585,13 @@ struct bnx2x_mcast_obj {
 			   int start_bin, int *rdata_idx);
 
 	int (*enqueue_cmd)(struct bnx2x *bp, struct bnx2x_mcast_obj *o,
-			   struct bnx2x_mcast_ramrod_params *p, int cmd);
+			   struct bnx2x_mcast_ramrod_params *p,
+			   enum bnx2x_mcast_cmd cmd);
 
 	void (*set_one_rule)(struct bnx2x *bp,
 			     struct bnx2x_mcast_obj *o, int idx,
-			     union bnx2x_mcast_config_data *cfg_data, int cmd);
+			     union bnx2x_mcast_config_data *cfg_data,
+				 enum bnx2x_mcast_cmd cmd);
 
 	/** Checks if there are more mcast MACs to be set or a previous
 	 *  command is still pending.
@@ -611,7 +614,8 @@ struct bnx2x_mcast_obj {
 	 * feasible.
 	 */
 	int (*validate)(struct bnx2x *bp,
-			struct bnx2x_mcast_ramrod_params *p, int cmd);
+			struct bnx2x_mcast_ramrod_params *p,
+			enum bnx2x_mcast_cmd cmd);
 
 	/**
 	 * Restore the values of internal counters in case of a failure.
@@ -1326,7 +1330,8 @@ void bnx2x_init_mcast_obj(struct bnx2x *bp,
  *         completions.
  */
 int bnx2x_config_mcast(struct bnx2x *bp,
-		       struct bnx2x_mcast_ramrod_params *p, int cmd);
+		       struct bnx2x_mcast_ramrod_params *p,
+			   enum bnx2x_mcast_cmd cmd);
 
 /****************** CREDIT POOL ****************/
 void bnx2x_init_mac_credit_pool(struct bnx2x *bp,
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
index 348ed02..1d29570 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.c
@@ -953,8 +953,8 @@ static int bnx2x_storm_stats_update(struct bnx2x *bp)
 		UPDATE_EXTEND_TSTAT(rcv_bcast_pkts,
 					total_broadcast_packets_received);
 		UPDATE_EXTEND_E_TSTAT(pkts_too_big_discard,
-				      etherstatsoverrsizepkts);
-		UPDATE_EXTEND_E_TSTAT(no_buff_discard, no_buff_discard);
+				      etherstatsoverrsizepkts, 32);
+		UPDATE_EXTEND_E_TSTAT(no_buff_discard, no_buff_discard, 16);
 
 		SUB_EXTEND_USTAT(ucast_no_buff_pkts,
 					total_unicast_packets_received);
@@ -1033,15 +1033,15 @@ static int bnx2x_storm_stats_update(struct bnx2x *bp)
 	       estats->total_bytes_received_lo,
 	       estats->rx_stat_ifhcinbadoctets_lo);
 
-	ADD_64(estats->total_bytes_received_hi,
-	       le32_to_cpu(tfunc->rcv_error_bytes.hi),
-	       estats->total_bytes_received_lo,
-	       le32_to_cpu(tfunc->rcv_error_bytes.lo));
+	ADD_64_LE(estats->total_bytes_received_hi,
+		  tfunc->rcv_error_bytes.hi,
+		  estats->total_bytes_received_lo,
+		  tfunc->rcv_error_bytes.lo);
 
-	ADD_64(estats->error_bytes_received_hi,
-	       le32_to_cpu(tfunc->rcv_error_bytes.hi),
-	       estats->error_bytes_received_lo,
-	       le32_to_cpu(tfunc->rcv_error_bytes.lo));
+	ADD_64_LE(estats->error_bytes_received_hi,
+		  tfunc->rcv_error_bytes.hi,
+		  estats->error_bytes_received_lo,
+		  tfunc->rcv_error_bytes.lo);
 
 	UPDATE_ESTAT(etherstatsoverrsizepkts, rx_stat_dot3statsframestoolong);
 
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h
index 24b8e50..200265a 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_stats.h
@@ -418,16 +418,19 @@ struct bnx2x_fw_port_stats_old {
 			      new->s); \
 	} while (0)
 
-#define UPDATE_EXTEND_TSTAT(s, t) \
+#define UPDATE_EXTEND_TSTAT_X(s, t, size) \
 	do { \
-		diff = le32_to_cpu(tclient->s) - le32_to_cpu(old_tclient->s); \
+		diff = le##size##_to_cpu(tclient->s) - \
+		       le##size##_to_cpu(old_tclient->s); \
 		old_tclient->s = tclient->s; \
 		ADD_EXTEND_64(qstats->t##_hi, qstats->t##_lo, diff); \
 	} while (0)
 
-#define UPDATE_EXTEND_E_TSTAT(s, t) \
+#define UPDATE_EXTEND_TSTAT(s, t) UPDATE_EXTEND_TSTAT_X(s, t, 32)
+
+#define UPDATE_EXTEND_E_TSTAT(s, t, size) \
 	do { \
-		UPDATE_EXTEND_TSTAT(s, t); \
+		UPDATE_EXTEND_TSTAT_X(s, t, size); \
 		ADD_EXTEND_64(estats->t##_hi, estats->t##_lo, diff); \
 	} while (0)
 
-- 
1.7.9.rc2


--------------060703070806000501000400--

