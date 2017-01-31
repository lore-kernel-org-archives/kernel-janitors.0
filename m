From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Jan 2017 11:12:56 +0000
Subject: [bug report] ipv6: fix ip6_tnl_parse_tlv_enc_lim()
Message-Id: <20170131111256.GA31319@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Eric Dumazet,

The patch fbfa743a9d2a: "ipv6: fix ip6_tnl_parse_tlv_enc_lim()" from
Jan 23, 2017, leads to the following static checker warning:

	net/ipv6/ip6_tunnel.c:444 ip6_tnl_parse_tlv_enc_lim()
	warn: potential pointer math issue ('skb->data' is a 24 bit pointer)

net/ipv6/ip6_tunnel.c
   437                          while (1) {
   438                                  struct ipv6_tlv_tnl_enc_lim *tel;
   439  
   440                                  /* No more room for encapsulation limit */
   441                                  if (i + sizeof(*tel) > optlen)
   442                                          break;
   443  
   444                                  tel = (struct ipv6_tlv_tnl_enc_lim *) skb->data + off + i;

This should be:
					tel = (struct ipv6_tlv_tnl_enc_lim *)(skb->data + off + i);


Someone probably already reported this?

   445                                  /* return index of option if found and valid */
   446                                  if (tel->type = IPV6_TLV_TNL_ENCAP_LIMIT &&
   447                                      tel->length = 1)
   448                                          return i + off - nhoff;
   449                                  /* else jump to next option */
   450                                  if (tel->type)
   451                                          i += tel->length + 2;
   452                                  else
   453                                          i++;
   454                          }

regards,
dan carpenter
