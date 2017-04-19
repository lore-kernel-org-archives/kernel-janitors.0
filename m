From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 14:25:36 +0000
Subject: [bug report] net/hsr: Added support for HSR v1
Message-Id: <20170419142535.2lxzzqabh2amfyh6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Peter Heise,

The patch ee1c27977284: "net/hsr: Added support for HSR v1" from Apr
13, 2016, leads to the following static checker warning:

	net/hsr/hsr_device.c:319 send_hsr_supervision_frame()
	warn: passing freed memory 'skb'

net/hsr/hsr_device.c
   308  
   309          hsr_stag->HSR_TLV_Type = type;
   310          /* TODO: Why 12 in HSRv0? */
   311          hsr_stag->HSR_TLV_Length = hsrVer ? sizeof(struct hsr_sup_payload) : 12;
   312  
   313          /* Payload: MacAddressA */
   314          hsr_sp = (typeof(hsr_sp)) skb_put(skb, sizeof(struct hsr_sup_payload));
   315          ether_addr_copy(hsr_sp->MacAddressA, master->dev->dev_addr);
   316  
   317          skb_put_padto(skb, ETH_ZLEN + HSR_HLEN);
                              ^^^
The skb_put_padto() function frees skb() on error.  Maybe that's not
possible?

   318  
   319          hsr_forward_skb(skb, master);
   320          return;
   321  
   322  out:
   323          WARN_ONCE(1, "HSR: Could not send supervision frame\n");
   324          kfree_skb(skb);
   325  }

regards,
dan carpenter
