From: Joe Perches <joe@perches.com>
Date: Sat, 17 Jun 2017 06:23:15 +0000
Subject: Re: endian bitshift defects [ was: staging: fusb302: don't bitshift __le16 type ]
Message-Id: <1497680595.10546.34.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616174556.2358-1-fransklaver@gmail.com>
         <1497653077.10546.23.camel@perches.com>
         <alpine.DEB.2.20.1706170722550.2045@hadrien>
         <1497678601.10546.32.camel@perches.com>
         <alpine.DEB.2.20.1706170753570.2045@hadrien>
In-Reply-To: <alpine.DEB.2.20.1706170753570.2045@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Frans Klaver <fransklaver@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sat, 2017-06-17 at 08:00 +0200, Julia Lawall wrote:
> On Fri, 16 Jun 2017, Joe Perches wrote:
> > On Sat, 2017-06-17 at 07:23 +0200, Julia Lawall wrote:
> > > On Fri, 16 Jun 2017, Joe Perches wrote:
> > > > On Fri, 2017-06-16 at 19:45 +0200, Frans Klaver wrote:
> > > > > The header field in struct pd_message is declared as an __le16 ty=
pe. The
> > > > > data in the message is supposed to be little endian. This means w=
e don't
> > > > > have to go and shift the individual bytes into position when we're
> > > > > filling the buffer, we can just copy the contents right away. As =
an
> > > > > added benefit we don't get fishy results on big endian systems an=
ymore.
> > > >=20
> > > > Thanks for pointing this out.
> > > >=20
> > > > There are several instances of this class of error.
> > > >=20
> > > > Here's a cocci script to find them.
> > > >=20
> > > > This is best used with cocci's --all-includes option like:
> > > >=20
> > > > $ spatch --all-includes --very-quiet --sp-file lebe_bitshifts.cocci=
 .
> > > > [ many defects...]
> >=20
> > Probably would have been better as [ many possible defects... ]
>=20
> OK
>=20
> > > > $ cat lebe_bitshifts.cocci
> > > > @@
> > > > typedef __le16, __le32, __le64,=A0=A0__be16, __be32, __be64;
> > > > { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> > > > expression b;
> > > > @@
> > > >=20
> > > > *	a << b
> >=20
> > [etc...]
> >=20
> > > Is this always a problem?
> >=20
> > No, not always.
> >=20
> > If the CPU is the equivalent endian, the bitshift is fine.
> > It can't be known if the code is only compiled on a
> > single cpu type.  It is rather odd though to use endian
> > notation if the code is compiled for a single cpu type.
>=20
> Is there some way to know from the code if it is compiled for a single cou
> type?

No easy way as far as I can tell.
I believe it'd require parsing Kconfig.

> > > Would it be useful to add this to the scripts
> > > in the kernel?
> >=20
> > Maybe.
>=20
> If there are a lot of false positives, it could be a nuisance...

I believe the most likely false positives would be in arch/ code

> > btw: is there a way for the operators to be surrounded by
> > some \( \| \) or some other bracket style so it could
> > be written with a single test?
> >=20
> > Something like:
> >=20
> > @@
> > typedef __le16, __le32, __le64,=A0=A0__be16, __be32, __be64;
> > { __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
> > expression b;
> > @@
> >=20
> > *	a [<<|<<=3D|>>|>>=3D] b
>=20
> Partly.  You can define
>=20
> binary operator bop =3D {<<,>>};

thanks.

btw:  After a couple hours with this script, I got a segmentation fault

Here's the output I got running

$ spatch --all-includes --very-quiet --sp-file lebe_bitshifts.cocci .
diff -u -p ./net/dsa/tag_qca.c /tmp/nothing/net/dsa/tag_qca.c
--- ./net/dsa/tag_qca.c
+++ /tmp/nothing/net/dsa/tag_qca.c
@@ -84,7 +84,6 @@ static struct sk_buff *qca_tag_rcv(struc
 	hdr =3D ntohs(*phdr);
=20
 	/* Make sure the version is correct */
-	ver =3D (hdr & QCA_HDR_RECV_VERSION_MASK) >> QCA_HDR_RECV_VERSION_S;
 	if (unlikely(ver !=3D QCA_HDR_VERSION))
 		return NULL;
=20
diff -u -p ./arch/mips/pci/pci-lantiq.c /tmp/nothing/arch/mips/pci/pci-lant=
iq.c
--- ./arch/mips/pci/pci-lantiq.c
+++ /tmp/nothing/arch/mips/pci/pci-lantiq.c
@@ -151,7 +151,6 @@ static int ltq_pci_startup(struct platfo
 	/* setup the request mask */
 	req_mask =3D of_get_property(node, "req-mask", NULL);
 	if (req_mask)
-		temp_buffer &=3D ~((*req_mask & 0xf) << 16);
 	else
 		temp_buffer &=3D ~0xf0000;
 	/* enable internal arbiter */
diff -u -p ./arch/powerpc/platforms/powernv/opal-lpc.c /tmp/nothing/arch/po=
werpc/platforms/powernv/opal-lpc.c
--- ./arch/powerpc/platforms/powernv/opal-lpc.c
+++ /tmp/nothing/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -44,7 +44,6 @@ static __le16 __opal_lpc_inw(unsigned lo
 	if (opal_lpc_chip_id < 0 || port > 0xfffe)
 		return 0xffff;
 	if (port & 1)
-		return (__le16)opal_lpc_inb(port) << 8 | opal_lpc_inb(port + 1);
 	rc =3D opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, &data, 2);
 	return rc ? 0xffff : be32_to_cpu(data);
 }
@@ -61,9 +60,6 @@ static __le32 __opal_lpc_inl(unsigned lo
 	if (opal_lpc_chip_id < 0 || port > 0xfffc)
 		return 0xffffffff;
 	if (port & 3)
-		return (__le32)opal_lpc_inb(port    ) << 24 |
-		       (__le32)opal_lpc_inb(port + 1) << 16 |
-		       (__le32)opal_lpc_inb(port + 2) <<  8 |
 			       opal_lpc_inb(port + 3);
 	rc =3D opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, &data, 4);
 	return rc ? 0xffffffff : be32_to_cpu(data);
@@ -86,7 +82,6 @@ static void __opal_lpc_outw(__le16 val,
 	if (opal_lpc_chip_id < 0 || port > 0xfffe)
 		return;
 	if (port & 1) {
-		opal_lpc_outb(val >> 8, port);
 		opal_lpc_outb(val     , port + 1);
 		return;
 	}
@@ -103,9 +98,6 @@ static void __opal_lpc_outl(__le32 val,
 	if (opal_lpc_chip_id < 0 || port > 0xfffc)
 		return;
 	if (port & 3) {
-		opal_lpc_outb(val >> 24, port);
-		opal_lpc_outb(val >> 16, port + 1);
-		opal_lpc_outb(val >>  8, port + 2);
 		opal_lpc_outb(val      , port + 3);
 		return;
 	}
diff -u -p ./drivers/net/geneve.c /tmp/nothing/drivers/net/geneve.c
--- ./drivers/net/geneve.c
+++ /tmp/nothing/drivers/net/geneve.c
@@ -93,8 +93,6 @@ static __be64 vni_to_tunnel_id(const __u
 static void tunnel_id_to_vni(__be64 tun_id, __u8 *vni)
 {
 #ifdef __BIG_ENDIAN
-	vni[0] =3D (__force __u8)(tun_id >> 16);
-	vni[1] =3D (__force __u8)(tun_id >> 8);
 	vni[2] =3D (__force __u8)tun_id;
 #else
 	vni[0] =3D (__force __u8)((__force u64)tun_id >> 40);
diff -u -p ./drivers/net/ethernet/atheros/atl1c/atl1c_main.c /tmp/nothing/d=
rivers/net/ethernet/atheros/atl1c/atl1c_main.c
--- ./drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+++ /tmp/nothing/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
@@ -1785,7 +1785,6 @@ static void atl1c_clean_rfd(struct atl1c
 	u16 rfd_index;
 	struct atl1c_buffer *buffer_info =3D rfd_ring->buffer_info;
=20
-	rfd_index =3D (rrs->word0 >> RRS_RX_RFD_INDEX_SHIFT) &
 			RRS_RX_RFD_INDEX_MASK;
 	for (i =3D 0; i < num; i++) {
 		buffer_info[rfd_index].skb =3D NULL;
@@ -1816,7 +1815,6 @@ static void atl1c_clean_rx_irq(struct at
 			break;
 		rrs =3D ATL1C_RRD_DESC(rrd_ring, rrd_ring->next_to_clean);
 		if (likely(RRS_RXD_IS_VALID(rrs->word3))) {
-			rfd_num =3D (rrs->word0 >> RRS_RX_RFD_CNT_SHIFT) &
 				RRS_RX_RFD_CNT_MASK;
 			if (unlikely(rfd_num !=3D 1))
 				/* TODO support mul rfd*/
@@ -1838,11 +1836,9 @@ rrs_checked:
 			continue;
 		}
=20
-		length =3D le16_to_cpu((rrs->word3 >> RRS_PKT_SIZE_SHIFT) &
 				RRS_PKT_SIZE_MASK);
 		/* Good Receive */
 		if (likely(rfd_num =3D 1)) {
-			rfd_index =3D (rrs->word0 >> RRS_RX_RFD_INDEX_SHIFT) &
 					RRS_RX_RFD_INDEX_MASK;
 			buffer_info =3D &rfd_ring->buffer_info[rfd_index];
 			pci_unmap_single(pdev, buffer_info->dma,
diff -u -p ./drivers/net/ethernet/atheros/atl1e/atl1e_main.c /tmp/nothing/d=
rivers/net/ethernet/atheros/atl1e/atl1e_main.c
--- ./drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ /tmp/nothing/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -1449,7 +1449,6 @@ static void atl1e_clean_rx_irq(struct at
 				}
 			}
=20
-			packet_size =3D ((prrs->word1 >> RRS_PKT_SIZE_SHIFT) &
 					RRS_PKT_SIZE_MASK);
 			if (likely(!(netdev->features & NETIF_F_RXFCS)))
 				packet_size -=3D 4; /* CRC */
@@ -1477,7 +1476,6 @@ static void atl1e_clean_rx_irq(struct at
 skip_pkt:
 	/* skip current packet whether it's ok or not. */
 			rx_page->read_offset +-				(((u32)((prrs->word1 >> RRS_PKT_SIZE_SHIFT) &
 				RRS_PKT_SIZE_MASK) +
 				sizeof(struct atl1e_recv_ret_status) + 31) &
 						0xFFFFFFE0);
@@ -1716,7 +1714,6 @@ static int atl1e_tx_map(struct atl1e_ada
 	int ring_end;
=20
 	nr_frags =3D skb_shinfo(skb)->nr_frags;
-	segment =3D (tpd->word3 >> TPD_SEGMENT_EN_SHIFT) & TPD_SEGMENT_EN_MASK;
 	if (segment) {
 		/* TSO */
 		map_len =3D hdr_len =3D skb_transport_offset(skb) + tcp_hdrlen(skb);
@@ -1831,7 +1828,6 @@ static int atl1e_tx_map(struct atl1e_ada
 		}
 	}
=20
-	if ((tpd->word3 >> TPD_SEGMENT_EN_SHIFT) & TPD_SEGMENT_EN_MASK)
 		/* note this one is a tcp header */
 		tpd->word3 |=3D 1 << TPD_HDRFLAG_SHIFT;
 	/* The last tpd */
diff -u -p ./drivers/net/ethernet/atheros/atlx/atl1.c /tmp/nothing/drivers/=
net/ethernet/atheros/atlx/atl1.c
--- ./drivers/net/ethernet/atheros/atlx/atl1.c
+++ /tmp/nothing/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -2224,7 +2224,6 @@ static void atl1_tx_map(struct atl1_adap
 	/* put skb in last TPD */
 	buffer_info->skb =3D NULL;
=20
-	retval =3D (ptpd->word3 >> TPD_SEGMENT_EN_SHIFT) & TPD_SEGMENT_EN_MASK;
 	if (retval) {
 		/* TSO */
 		hdr_len =3D skb_transport_offset(skb) + tcp_hdrlen(skb);
@@ -2328,7 +2327,6 @@ static void atl1_tx_queue(struct atl1_ad
 		 * if this is the first packet in a TSO chain, set
 		 * TPD_HDRFLAG, otherwise, clear it.
 		 */
-		val =3D (tpd->word3 >> TPD_SEGMENT_EN_SHIFT) &
 			TPD_SEGMENT_EN_MASK;
 		if (val) {
 			if (!j)
diff -u -p ./drivers/net/ethernet/3com/3c509.c /tmp/nothing/drivers/net/eth=
ernet/3com/3c509.c
--- ./drivers/net/ethernet/3com/3c509.c
+++ /tmp/nothing/drivers/net/ethernet/3com/3c509.c
@@ -255,9 +255,6 @@ static int el3_isa_id_sequence(__be16 *p
 			    ether_addr_equal((u8 *)phys_addr, el3_devs[i]->dev_addr)) {
 				if (el3_debug > 3)
 					pr_debug("3c509 with address %02x %02x %02x %02x %02x %02x was found =
by ISAPnP\n",
-						phys_addr[0] & 0xff, phys_addr[0] >> 8,
-						phys_addr[1] & 0xff, phys_addr[1] >> 8,
-						phys_addr[2] & 0xff, phys_addr[2] >> 8);
 				/* Set the adaptor tag so that the next card can be found. */
 				outb(0xd0 + ++current_tag, id_port);
 				return 2;
diff -u -p ./drivers/net/ethernet/qualcomm/qca_7k_common.c /tmp/nothing/dri=
vers/net/ethernet/qualcomm/qca_7k_common.c
--- ./drivers/net/ethernet/qualcomm/qca_7k_common.c
+++ /tmp/nothing/drivers/net/ethernet/qualcomm/qca_7k_common.c
@@ -42,7 +42,6 @@ qcafrm_create_header(u8 *buf, u16 length
 	buf[2] =3D 0xAA;
 	buf[3] =3D 0xAA;
 	buf[4] =3D len & 0xff;
-	buf[5] =3D (len >> 8) & 0xff;
 	buf[6] =3D 0;
 	buf[7] =3D 0;
=20
diff -u -p ./drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c /tmp/noth=
ing/drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c
--- ./drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c
+++ /tmp/nothing/drivers/net/ethernet/qlogic/netxen/netxen_nic_init.c
@@ -862,7 +862,6 @@ nx_get_fw_version(struct netxen_adapter
 		if (ret !=3D 3)
 			return 0;
=20
-		return major + (minor << 8) + (sub << 16);
=20
 	} else
 		return cpu_to_le32(*(u32 *)&fw->data[NX_FW_VERSION_OFFSET]);
@@ -877,8 +876,6 @@ nx_get_bios_version(struct netxen_adapte
 	if (adapter->fw_type =3D NX_UNIFIED_ROMIMAGE) {
 		bios_ver =3D cpu_to_le32(*((u32 *) (&fw->data[prd_off])
 						+ NX_UNI_BIOS_VERSION_OFF));
-		return (bios_ver << 16) + ((bios_ver >> 8) & 0xff00) +
-							(bios_ver >> 24);
 	} else
 		return cpu_to_le32(*(u32 *)&fw->data[NX_BIOS_VERSION_OFFSET]);
=20
diff -u -p ./drivers/net/ethernet/intel/e100.c /tmp/nothing/drivers/net/eth=
ernet/intel/e100.c
--- ./drivers/net/ethernet/intel/e100.c
+++ /tmp/nothing/drivers/net/ethernet/intel/e100.c
@@ -1423,7 +1423,6 @@ static int e100_phy_check_without_mii(st
 	u8 phy_type;
 	int without_mii;
=20
-	phy_type =3D (nic->eeprom[eeprom_phy_iface] >> 8) & 0x0f;
=20
 	switch (phy_type) {
 	case NoSuchPhy: /* Non-MII PHY; UNTESTED! */
diff -u -p ./drivers/crypto/sunxi-ss/sun4i-ss-hash.c /tmp/nothing/drivers/c=
rypto/sunxi-ss/sun4i-ss-hash.c
--- ./drivers/crypto/sunxi-ss/sun4i-ss-hash.c
+++ /tmp/nothing/drivers/crypto/sunxi-ss/sun4i-ss-hash.c
@@ -434,7 +434,6 @@ hash_final:
 	if (op->mode =3D SS_OP_SHA1) {
 		bits =3D cpu_to_be64(op->byte_count << 3);
 		bf[j++] =3D bits & 0xffffffff;
-		bf[j++] =3D (bits >> 32) & 0xffffffff;
 	} else {
 		bf[j++] =3D (op->byte_count << 3) & 0xffffffff;
 		bf[j++] =3D (op->byte_count >> 29) & 0xffffffff;
diff -u -p ./drivers/staging/rtl8723bs/core/rtw_wlan_util.c /tmp/nothing/dr=
ivers/staging/rtl8723bs/core/rtw_wlan_util.c
--- ./drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ /tmp/nothing/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -2258,9 +2258,6 @@ void rtw_get_current_ip_address(struct a
 			struct in_ifaddr *my_ifa_list =3D my_ip_ptr->ifa_list;
 			if (my_ifa_list !=3D NULL) {
 				ipaddress[0] =3D my_ifa_list->ifa_address & 0xFF;
-				ipaddress[1] =3D (my_ifa_list->ifa_address >> 8) & 0xFF;
-				ipaddress[2] =3D (my_ifa_list->ifa_address >> 16) & 0xFF;
-				ipaddress[3] =3D my_ifa_list->ifa_address >> 24;
 				DBG_871X("%s: %d.%d.%d.%d =3D=3D=3D=3D=3D\n", __func__,
 						ipaddress[0], ipaddress[1], ipaddress[2], ipaddress[3]);
 				memcpy(pcurrentip, ipaddress, 4);
diff -u -p ./drivers/staging/typec/fusb302/fusb302.c /tmp/nothing/drivers/s=
taging/typec/fusb302/fusb302.c
--- ./drivers/staging/typec/fusb302/fusb302.c
+++ /tmp/nothing/drivers/staging/typec/fusb302/fusb302.c
@@ -1040,7 +1040,6 @@ static int fusb302_pd_send_message(struc
 	/* packsym tells the FUSB302 chip that the next X bytes are payload */
 	buf[pos++] =3D FUSB302_TKN_PACKSYM | (len & 0x1F);
 	buf[pos++] =3D msg->header & 0xFF;
-	buf[pos++] =3D (msg->header >> 8) & 0xFF;
=20
 	len -=3D 2;
 	memcpy(&buf[pos], msg->payload, len);
Segmentation fault (core dumped)

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
