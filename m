From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 May 2015 09:54:31 +0000
Subject: re: flow_dissect: use programable dissector in skb_flow_dissect and friends
Message-Id: <20150515095431.GA24328@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jiri Pirko,

The patch 06635a35d13d: "flow_dissect: use programable dissector in
skb_flow_dissect and friends" from May 12, 2015, leads to the
following static checker warning:

	net/core/flow_dissector.c:283 __skb_flow_dissect()
	info: ignoring unreachable code.

net/core/flow_dissector.c
   279  
   280                  if (skb_flow_dissector_uses_key(flow_dissector,
   281                                                  FLOW_DISSECTOR_KEY_IPV6_HASH_ADDRS)) {
   282                          return true;
                                ^^^^^^^^^^^^
   283                          key_addrs = skb_flow_dissector_target(flow_dissector,
   284                                                                FLOW_DISSECTOR_KEY_IPV6_HASH_ADDRS,
   285                                                                target_container);
   286                          key_addrs->src = hdr->srcnode;
   287                          key_addrs->dst = 0;
   288                  }
   289                  return true;

regards,
dan carpenter
