From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Mar 2010 13:07:01 +0000
Subject: batman: potential null dereference
Message-Id: <20100308130700.GJ6469@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

drivers/staging/batman-adv/routing.c
    88          } else if ((orig_node->router = NULL) && (neigh_node != NULL)) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^^
    89  
    90                  bat_dbg(DBG_ROUTES,
    91                          "Adding route towards: %pM (via %pM)\n",
    92                          orig_node->orig, neigh_node->addr);
    93                  hna_global_add_orig(orig_node, hna_buff, hna_buff_len);
    94  
    95                  /* route changed */
    96          } else {
    97                  bat_dbg(DBG_ROUTES, "Changing route towards: %pM (now via %pM - was via %pM)\n", 
orig_node->orig, neigh_node->addr, orig_node->router->addr);
                                   ^^^^^^^^^^^^^^^^^^^^^^^									
    98          }

This could fail if debugging is enabled and neigh_node is null.

regards,
dan carpenter
