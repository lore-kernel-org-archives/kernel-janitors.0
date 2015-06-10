From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2015 15:53:42 +0000
Subject: re: mpls: Add MPLS entropy label in flow_keys
Message-Id: <20150610155342.GM10549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tom Herbert,

The patch b3baa0fbd02a: "mpls: Add MPLS entropy label in flow_keys"
from Jun 4, 2015, leads to the following static checker warning:

	net/core/flow_dissector.c:303 __skb_flow_dissect()
	warn: masked condition '(() & 4294963200) = 7' is always false.

net/core/flow_dissector.c
   299                  if (!hdr)
   300                          return false;
   301  
   302                  if ((ntohl(hdr[0].entry) & MPLS_LS_LABEL_MASK) =
   303                       MPLS_LABEL_ENTROPY) {


#define MPLS_LS_LABEL_MASK      0xFFFFF000
#define MPLS_LABEL_ENTROPY              7 /* RFC6790 */

This can never be true.  Not sure what was intended.

   304                          if (skb_flow_dissector_uses_key(flow_dissector,
   305                                                          FLOW_DISSECTOR_KEY_MPLS_ENTROPY)) {
   306                                  key_keyid = skb_flow_dissector_target(flow_dissector,
   307                                                                        FLOW_DISSECTOR_KEY_MPLS_ENTROPY,
   308                                                                        target_container);
   309                                  key_keyid->keyid = hdr[1].entry &
   310                                          htonl(MPLS_LS_LABEL_MASK);
   311                          }
   312  
   313                          key_basic->n_proto = proto;
   314                          key_basic->ip_proto = ip_proto;
   315                          key_control->thoff = (u16)nhoff;
   316  
   317                          return true;
   318                  }
   319  
   320                  return true;
   321          }

regards,
dan carpenter
