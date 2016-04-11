From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Apr 2016 07:27:18 +0000
Subject: re: vxlan: implement GPE
Message-Id: <20160411072718.GA14676@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jiri Benc,

The patch e1e5314de08b: "vxlan: implement GPE" from Apr 5, 2016,
leads to the following static checker warning:

	drivers/net/vxlan.c:1206 vxlan_parse_gpe_hdr()
	error: wrong number of bits for 'htons' (32 vs 16) left= '*protocol' *protocol = (())

drivers/net/vxlan.c
  1183  static bool vxlan_parse_gpe_hdr(struct vxlanhdr *unparsed,
  1184                                  __be32 *protocol,
  1185                                  struct sk_buff *skb, u32 vxflags)
  1186  {
  1187          struct vxlanhdr_gpe *gpe = (struct vxlanhdr_gpe *)unparsed;
  1188  
  1189          /* Need to have Next Protocol set for interfaces in GPE mode. */
  1190          if (!gpe->np_applied)
  1191                  return false;
  1192          /* "The initial version is 0. If a receiver does not support the
  1193           * version indicated it MUST drop the packet.
  1194           */
  1195          if (gpe->version != 0)
  1196                  return false;
  1197          /* "When the O bit is set to 1, the packet is an OAM packet and OAM
  1198           * processing MUST occur." However, we don't implement OAM
  1199           * processing, thus drop the packet.
  1200           */
  1201          if (gpe->oam_flag)
  1202                  return false;
  1203  
  1204          switch (gpe->next_protocol) {
  1205          case VXLAN_GPE_NP_IPV4:
  1206                  *protocol = htons(ETH_P_IP);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Did you mean htonl()?

  1207                  break;
  1208          case VXLAN_GPE_NP_IPV6:
  1209                  *protocol = htons(ETH_P_IPV6);

Same.

  1210                  break;
  1211          case VXLAN_GPE_NP_ETHERNET:
  1212                  *protocol = htons(ETH_P_TEB);

Same.

  1213                  break;
  1214          default:
  1215                  return false;
  1216          }
  1217  
  1218          unparsed->vx_flags &= ~VXLAN_GPE_USED_BITS;
  1219          return true;
  1220  }


And also in vxlan_rcv().  I don't know why Smatch doesn't complain about
that one...

regards,
dan carpenter
