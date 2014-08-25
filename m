From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Aug 2014 17:07:45 +0000
Subject: re: bnx2x: Utilize FW 7.10.51
Message-Id: <20140825170745.GA22328@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dmitry Kravkov,

The patch e42780b66aab: "bnx2x: Utilize FW 7.10.51" from Aug 17,
2014, leads to the following static checker warning:

	drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:3653 bnx2x_update_pbds_gso_enc()
	warn: double left shift '1 << (1 << 0)'

The ETH_TUNNEL_DATA_IP_HDR_TYPE_OUTER is defined twice, once for big
endian and once for little endian.  It's defined the same way for both
endiannesses.

#define ETH_TUNNEL_DATA_IP_HDR_TYPE_OUTER (0x1<<0)

drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
  3644  
  3645                  outerip_len = iph->ihl << 1;
  3646  
  3647                  pbd2->fw_ip_csum_wo_len_flags_frag   3648                          bswab16(csum_fold((__force __wsum)csum));
  3649          } else {
  3650                  pbd2->fw_ip_hdr_to_payload_w   3651                          hlen_w - ((sizeof(struct ipv6hdr)) >> 1);
  3652                  pbd_e2->data.tunnel_data.flags |  3653                          1 /*IPv6*/ << ETH_TUNNEL_DATA_IP_HDR_TYPE_OUTER;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This code is a bit suspicious because we are shifting by a shift macro
and that's very rare.  Also how does this affect endiannes?  I don't
know the code very well but it's suspicious enough to send an email.

  3654          }

regards,
dan carpenter
