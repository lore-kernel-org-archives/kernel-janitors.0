From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:44:12 +0000
Subject: [bug report] net: mvpp2: cls: Add Classification offload support
Message-Id: <20190503124412.GE29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Maxime Chevallier,

The patch 90b509b39ac9: "net: mvpp2: cls: Add Classification offload
support" from Apr 30, 2019, leads to the following static checker
warning:

	drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1036 mvpp2_port_c2_tcam_rule_add()
	warn: unsigned 'c2.index' is never less than zero.

drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c
  1026  static int mvpp2_port_c2_tcam_rule_add(struct mvpp2_port *port,
  1027                                         struct mvpp2_rfs_rule *rule)
  1028  {
  1029          struct flow_action_entry *act;
  1030          struct mvpp2_cls_c2_entry c2;
  1031          u8 qh, ql, pmap;
  1032  
  1033          memset(&c2, 0, sizeof(c2));
  1034  
  1035          c2.index = mvpp2_cls_c2_port_flow_index(port, rule->loc);
  1036          if (c2.index < 0)
                    ^^^^^^^^^^^^
This is unsigned and also mvpp2_cls_c2_port_flow_index() doesn't return
negative error codes.

  1037                  return -EINVAL;
  1038  
  1039          act = &rule->flow->action.entries[0];
  1040  
  1041          rule->c2_index = c2.index;
  1042  


regards,
dan carpenter
