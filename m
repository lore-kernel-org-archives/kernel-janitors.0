From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 14:19:24 +0000
Subject: [bug report] r8169: fix offloaded tx checksum for small packets.
Message-Id: <20170419141924.i4p4bpa6qzswncxt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello fran=E7ois romieu,

The patch b423e9ae49d7: "r8169: fix offloaded tx checksum for small
packets." from May 18, 2013, leads to the following static checker
warning:

	drivers/net/ethernet/realtek/r8169.c:7165 rtl8169_start_xmit()
	warn: passing freed memory 'skb'

drivers/net/ethernet/realtek/r8169.c
  7095          } else if (skb->ip_summed =3D CHECKSUM_PARTIAL) {
  7096                  u8 ip_protocol;
  7097 =20
  7098                  if (unlikely(rtl_test_hw_pad_bug(tp, skb)))
  7099                          return !(skb_checksum_help(skb) || eth_skb_=
pad(skb));
                                                                   ^^^^^^^^=
^^^^^^^^
If eth_skb_pad() doesn't have enough memory then it frees skb.

  7100 =20
  7101                  if (transport_offset > TCPHO_MAX) {
  7102                          netif_warn(tp, tx_err, tp->dev,
  7103                                     "Invalid transport offset 0x%x\n=
",
  7104                                     transport_offset);
  7105                          return false;
  7106                  }
  7107 =20
  7108                  switch (get_protocol(skb)) {
  7109                  case htons(ETH_P_IP):
  7110                          opts[1] |=3D TD1_IPv4_CS;
  7111                          ip_protocol =3D ip_hdr(skb)->protocol;
  7112                          break;
  7113 =20
  7114                  case htons(ETH_P_IPV6):
  7115                          opts[1] |=3D TD1_IPv6_CS;
  7116                          ip_protocol =3D ipv6_hdr(skb)->nexthdr;
  7117                          break;
  7118 =20
  7119                  default:
  7120                          ip_protocol =3D IPPROTO_RAW;
  7121                          break;
  7122                  }
  7123 =20
  7124                  if (ip_protocol =3D IPPROTO_TCP)
  7125                          opts[1] |=3D TD1_TCP_CS;
  7126                  else if (ip_protocol =3D IPPROTO_UDP)
  7127                          opts[1] |=3D TD1_UDP_CS;
  7128                  else
  7129                          WARN_ON_ONCE(1);
  7130 =20
  7131                  opts[1] |=3D transport_offset << TCPHO_SHIFT;
  7132          } else {
  7133                  if (unlikely(rtl_test_hw_pad_bug(tp, skb)))
  7134                          return !eth_skb_pad(skb);
                                       ^^^^^^^^^^^^^^^^^
Same here as well.

  7135          }

[ snip ]

  7161          opts[1] =3D cpu_to_le32(rtl8169_tx_vlan_tag(skb));
  7162          opts[0] =3D DescOwn;
  7163 =20
  7164          if (!tp->tso_csum(tp, skb, opts)) {
  7165                  r8169_csum_workaround(tp, skb);
                                                  ^^^
But the caller is not expecting it to be freed.

  7166                  return NETDEV_TX_OK;
  7167          }
  7168 =20

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
