From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 04 Nov 2017 08:31:19 +0000
Subject: [bug report] ipv6: addrconf: add per netns perturbation in inet6_addr_hash()
Message-Id: <20171104083119.kpl47mryrx3h27pl@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Eric Dumazet,

The patch 3f27fb23219e: "ipv6: addrconf: add per netns perturbation
in inet6_addr_hash()" from Oct 23, 2017, leads to the following
static checker warning:

	net/core/pktgen.c:2169 pktgen_setup_inject()
	error: buffer overflow 'pkt_dev->cur_in6_saddr.in6_u.u6_addr8' 16 <= 255

net/core/pktgen.c
  2157          if (pkt_dev->flags & F_IPV6) {
  2158                  int i, set = 0, err = 1;
  2159                  struct inet6_dev *idev;
  2160  
  2161                  if (pkt_dev->min_pkt_size = 0) {
  2162                          pkt_dev->min_pkt_size = 14 + sizeof(struct ipv6hdr)
  2163                                                  + sizeof(struct udphdr)
  2164                                                  + sizeof(struct pktgen_hdr)
  2165                                                  + pkt_dev->pkt_overhead;
  2166                  }
  2167  
  2168                  for (i = 0; i < IN6_ADDR_HSIZE; i++)
                                        ^^^^^^^^^^^^^^
My guess is that this is the wrong test here, but I don't know for sure.

  2169                          if (pkt_dev->cur_in6_saddr.s6_addr[i]) {
                                                           ^^^^^^^^^^
This used to work but now that IN6_ADDR_HSIZE is 256 instead of 16 we're
reading beyond the end of the array.

  2170                                  set = 1;
  2171                                  break;
  2172                          }
  2173  
  2174                  if (!set) {
  2175  
  2176                          /*
  2177                           * Use linklevel address if unconfigured.
  2178                           *
  2179                           * use ipv6_get_lladdr if/when it's get exported
  2180                           */
  2181  

regards,
dan carpenter
