From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Jan 2014 16:10:59 +0000
Subject: re: net: Add GRO support for UDP encapsulating protocols
Message-Id: <20140123161059.GA29227@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Or Gerlitz,

The patch b582ef0990d4: "net: Add GRO support for UDP encapsulating
protocols" from Jan 20, 2014, leads to the following static checker
warning:

	net/ipv4/udp_offload.c:104 udp_add_offload()
	error: scheduling with locks held: 'spin_lock:sock_lock'"

net/ipv4/udp_offload.c
   101  int udp_add_offload(struct udp_offload *uo)
   102  {
   103          struct udp_offload_priv **head = &udp_offload_base;
   104          struct udp_offload_priv *new_offload = kzalloc(sizeof(*new_offload), GFP_KERNEL);
                                                                                     ^^^^^^^^^^
Should be GFP_ATOMIC?

   105  
   106          if (!new_offload)
   107                  return -ENOMEM;
   108  
   109          new_offload->offload = uo;
   110  
   111          spin_lock(&udp_offload_lock);
   112          rcu_assign_pointer(new_offload->next, rcu_dereference(*head));
   113          rcu_assign_pointer(*head, rcu_dereference(new_offload));
   114          spin_unlock(&udp_offload_lock);
   115  
   116          return 0;
   117  }

The call tree looks like:

  vxlan_socket_create() <-- holds the spinlock
  -> vxlan_notify_add_rx_port()
     -> udp_add_offload()  <-- shedules

regards,
dan carpenter

