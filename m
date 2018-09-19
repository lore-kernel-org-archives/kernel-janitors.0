From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Sep 2018 11:24:39 +0000
Subject: [bug report] flow_dissector: implements flow dissector BPF hook
Message-Id: <20180919112438.GA27320@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Petar Penkov,

This is a semi-automatic email about new static checker warnings.

The patch d58e468b1112: "flow_dissector: implements flow dissector 
BPF hook" from Sep 14, 2018, leads to the following Smatch complaint:

    net/core/flow_dissector.c:797 __skb_flow_dissect()
    error: we previously assumed 'skb' could be null (see line 758)

net/core/flow_dissector.c
   757		rcu_read_lock();
   758		attached = skb ? rcu_dereference(dev_net(skb->dev)->flow_dissector_prog)
                           ^^^
The patch adds a new check here.

   759			       : NULL;
   760		if (attached) {
   761			/* Note that even though the const qualifier is discarded
   762			 * throughout the execution of the BPF program, all changes(the
   763			 * control block) are reverted after the BPF program returns.
   764			 * Therefore, __skb_flow_dissect does not alter the skb.
   765			 */
   766			struct bpf_flow_keys flow_keys = {};
   767			struct bpf_skb_data_end cb_saved;
   768			struct bpf_skb_data_end *cb;
   769			u32 result;
   770	
   771			cb = (struct bpf_skb_data_end *)skb->cb;
   772	
   773			/* Save Control Block */
   774			memcpy(&cb_saved, cb, sizeof(cb_saved));
   775			memset(cb, 0, sizeof(cb_saved));
   776	
   777			/* Pass parameters to the BPF program */
   778			cb->qdisc_cb.flow_keys = &flow_keys;
   779			flow_keys.nhoff = nhoff;
   780	
   781			bpf_compute_data_pointers((struct sk_buff *)skb);
   782			result = BPF_PROG_RUN(attached, skb);
   783	
   784			/* Restore state */
   785			memcpy(cb, &cb_saved, sizeof(cb_saved));
   786	
   787			__skb_flow_bpf_to_target(&flow_keys, flow_dissector,
   788						 target_container);
   789			key_control->thoff = min_t(u16, key_control->thoff, skb->len);
   790			rcu_read_unlock();
   791			return result = BPF_OK;
   792		}
   793		rcu_read_unlock();
   794	
   795		if (dissector_uses_key(flow_dissector,
   796				       FLOW_DISSECTOR_KEY_ETH_ADDRS)) {
   797			struct ethhdr *eth = eth_hdr(skb);
                                                     ^^^
This old dereference isn't checked.

   798			struct flow_dissector_key_eth_addrs *key_eth_addrs;
   799	

regards,
dan carpenter
