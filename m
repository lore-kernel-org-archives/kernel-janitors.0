From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2018 11:54:26 +0000
Subject: [bug report] bpf: Add helper to retrieve socket in BPF
Message-Id: <20181011115426.GA21551@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Joe Stringer,

This is a semi-automatic email about new static checker warnings.

The patch 6acc9b432e67: "bpf: Add helper to retrieve socket in BPF" 
from Oct 2, 2018, leads to the following Smatch complaint:

    net/core/filter.c:4893 bpf_sk_lookup()
    error: we previously assumed 'skb->dev' could be null (see line 4885)

net/core/filter.c
  4884	
  4885		if (skb->dev)
                    ^^^^^^^^
The patch adds a check

  4886			caller_net = dev_net(skb->dev);
  4887		else
  4888			caller_net = sock_net(skb->sk);
  4889		if (netns_id) {
  4890			net = get_net_ns_by_id(caller_net, netns_id);
  4891			if (unlikely(!net))
  4892				goto out;
  4893			sk = sk_lookup(net, tuple, skb, family, proto);
                                                   ^^^
  4894			put_net(net);
  4895		} else {
  4896                  net = caller_net;
  4897                  sk = sk_lookup(net, tuple, skb, family, proto);
                                                   ^^^
We dereference skb->dev inside the sk_lookup() function.

  4898          }
  4899  
  4900          if (sk)
  4901                  sk = sk_to_full_sk(sk);
  4902  out:
  4903          return (unsigned long) sk;
  4904  }

regards,
dan carpenter
