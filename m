From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 06:54:18 +0000
Subject: [bug report] qed: Add supported link and advertise link to display in ethtool.
Message-Id: <20181018065418.2wwa26qdx5zrcqwn@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Rahul Verma,

The patch c56a8be7e7aa: "qed: Add supported link and advertise link
to display in ethtool." from Oct 16, 2018, leads to the following
static checker warning:

drivers/net/ethernet/qlogic/qed/qed_main.c:1510 qed_fill_link_capability() error: uninitialized symbol 'tcvr_state'.
drivers/net/ethernet/qlogic/qed/qed_mcp.c:1951 qed_mcp_trans_speed_mask() error: uninitialized symbol 'transceiver_state'.
drivers/net/ethernet/qlogic/qed/qed_mcp.c:1951 qed_mcp_trans_speed_mask() error: uninitialized symbol 'transceiver_type'.

drivers/net/ethernet/qlogic/qed/qed_main.c
  1491  static void qed_fill_link_capability(struct qed_hwfn *hwfn,
  1492                                       struct qed_ptt *ptt, u32 capability,
  1493                                       u32 *if_capability)
  1494  {
  1495          u32 media_type, tcvr_state, tcvr_type;
                                ^^^^^^^^^^
  1496          u32 speed_mask, board_cfg;
  1497  
  1498          if (qed_mcp_get_media_type(hwfn, ptt, &media_type))
  1499                  media_type = MEDIA_UNSPECIFIED;
  1500  
  1501          if (qed_mcp_get_transceiver_data(hwfn, ptt, &tcvr_state, &tcvr_type))
                                                             ^^^^^^^^^^
Not initialized on error.

  1502                  tcvr_type = ETH_TRANSCEIVER_STATE_UNPLUGGED;
  1503  
  1504          if (qed_mcp_trans_speed_mask(hwfn, ptt, &speed_mask))
  1505                  speed_mask = 0xFFFFFFFF;
  1506  
  1507          if (qed_mcp_get_board_config(hwfn, ptt, &board_cfg))
  1508                  board_cfg = NVM_CFG1_PORT_PORT_TYPE_UNDEFINED;
  1509  
  1510          DP_VERBOSE(hwfn->cdev, NETIF_MSG_DRV,
  1511                     "Media_type = 0x%x tcvr_state = 0x%x tcvr_type = 0x%x speed_mask = 0x%x board_cfg = 0x%x\n",
  1512                     media_type, tcvr_state, tcvr_type, speed_mask, board_cfg);
                                       ^^^^^^^^^^
Debug output.

  1513  

regards,
dan carpenter
