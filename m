From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jul 2017 12:17:09 +0000
Subject: [bug report] qed: iWARP CM add passive side connect
Message-Id: <20170707121708.hwjpu5ph2kmuwixb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Kalderon, Michal,

The patch 456a584947d5: "qed: iWARP CM add passive side connect" from
Jul 2, 2017, leads to the following Smatch warnings:

	drivers/net/ethernet/qlogic/qed/qed_iwarp.c:585 qed_iwarp_print_tcp_ramrod()
	warn: '%pI6' can only be followed by c
	drivers/net/ethernet/qlogic/qed/qed_iwarp.c:1521 qed_iwarp_print_cm_info()
	warn: '%pI6' can only be followed by c


drivers/net/ethernet/qlogic/qed/qed_iwarp.c
   576          if (p_tcp_ramrod->tcp.ip_version = TCP_IPV4) {
   577                  DP_VERBOSE(p_hwfn, QED_MSG_RDMA,
   578                             "local_ip=%pI4h:%x, remote_ip=%pI4h%x, vlan=%x\n",
   579                             p_tcp_ramrod->tcp.local_ip,
   580                             p_tcp_ramrod->tcp.local_port,
   581                             p_tcp_ramrod->tcp.remote_ip,
   582                             p_tcp_ramrod->tcp.remote_port,
   583                             p_tcp_ramrod->tcp.vlan_id);
   584          } else {
   585                  DP_VERBOSE(p_hwfn, QED_MSG_RDMA,
   586                             "local_ip=%pI6h:%x, remote_ip=%pI6h:%x, vlan=%x\n",
                                                 ^                   ^
These seem like copy and paste errors.  With IPv6 everything that's not
'c' is treated the same.  There is no 'h' options.  (I'm not really
familiar with the what formats people prefer).

   587                             p_tcp_ramrod->tcp.local_ip,
   588                             p_tcp_ramrod->tcp.local_port,
   589                             p_tcp_ramrod->tcp.remote_ip,
   590                             p_tcp_ramrod->tcp.remote_port,
   591                             p_tcp_ramrod->tcp.vlan_id);
   592          }

	[ snip ]

  1508  qed_iwarp_print_cm_info(struct qed_hwfn *p_hwfn,
  1509                          struct qed_iwarp_cm_info *cm_info)
  1510  {
  1511          DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "ip_version = %d\n",
  1512                     cm_info->ip_version);
  1513  
  1514          if (cm_info->ip_version = QED_TCP_IPV4)
  1515                  DP_VERBOSE(p_hwfn, QED_MSG_RDMA,
  1516                             "remote_ip %pI4h:%x, local_ip %pI4h:%x vlan=%x\n",
  1517                             cm_info->remote_ip, cm_info->remote_port,
  1518                             cm_info->local_ip, cm_info->local_port,
  1519                             cm_info->vlan);
  1520          else
  1521                  DP_VERBOSE(p_hwfn, QED_MSG_RDMA,
  1522                             "remote_ip %pI6h:%x, local_ip %pI6h:%x vlan=%x\n",
                                                  ^                  ^
Same.

  1523                             cm_info->remote_ip, cm_info->remote_port,
  1524                             cm_info->local_ip, cm_info->local_port,
  1525                             cm_info->vlan);
  1526  

regards,
dan carpenter
