From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2016 10:03:46 +0000
Subject: re: cxgb4: Update mps_tcam output to include T6 fields
Message-Id: <20160106100346.GF23185@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Hariprasad Shenai,

The patch 115b56af88b5: "cxgb4: Update mps_tcam output to include T6
fields" from Dec 23, 2015, leads to the following static checker
warning:

	drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:1735 mps_tcam_show()
	warn: we tested 'lookup_type' before and it was 'true'

drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
  1725                          if (lookup_type && (lookup_type != DATALKPTYPE_M)) {
                                    ^^^^^^^^^^^
Is non-zero.

  1726                                  seq_printf(seq,
  1727                                             "%3u %02x:%02x:%02x:%02x:%02x:%02x "
  1728                                             "%012llx %06x %06x    -    -   %3c"
  1729                                             "      %3c  %4x   "
  1730                                             "%3c   %#x%4u%4d", idx, addr[0],
  1731                                             addr[1], addr[2], addr[3],
  1732                                             addr[4], addr[5],
  1733                                             (unsigned long long)mask,
  1734                                             vniy, vnix, dip_hit ? 'Y' : 'N',
  1735                                             lookup_type ? 'I' : 'O', port_num,
                                                   ^^^^^^^^^^^^^^^^^^^^^^^
No need to check.

  1736                                             (cls_lo & T6_SRAM_VLD_F) ? 'Y' : 'N',
  1737                                             PORTMAP_G(cls_hi),
  1738                                             T6_PF_G(cls_lo),
  1739                                             (cls_lo & T6_VF_VALID_F) ?
  1740                                             T6_VF_G(cls_lo) : -1);
  1741                          } else {
  1742                                  seq_printf(seq,
  1743                                             "%3u %02x:%02x:%02x:%02x:%02x:%02x "
  1744                                             "%012llx    -       -   ",
  1745                                             idx, addr[0], addr[1], addr[2],
  1746                                             addr[3], addr[4], addr[5],
  1747                                             (unsigned long long)mask);
  1748  
  1749                                  if (vlan_vld)
  1750                                          seq_printf(seq, "%4u   Y     ", ivlan);
  1751                                  else
  1752                                          seq_puts(seq, "  -    N     ");
  1753  
  1754                                  seq_printf(seq,
  1755                                             "-      %3c  %4x   %3c   %#x%4u%4d",
  1756                                             lookup_type ? 'I' : 'O', port_num,
  1757                                             (cls_lo & T6_SRAM_VLD_F) ? 'Y' : 'N',
  1758                                             PORTMAP_G(cls_hi),
  1759                                             T6_PF_G(cls_lo),
  1760                                             (cls_lo & T6_VF_VALID_F) ?
  1761                                             T6_VF_G(cls_lo) : -1);
  1762                          }

regards,
dan carpenter
