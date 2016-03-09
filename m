From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Mar 2016 09:19:10 +0000
Subject: re: irda: Remove BKL instances from af_irda.c
Message-Id: <20160309091910.GA6821@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Samuel Ortiz,

This is a semi-automatic email about new static checker warnings.

The patch 5b40964eadea: "irda: Remove BKL instances from af_irda.c"
from Oct 11, 2010, leads to the following Smatch complaint:

net/irda/af_irda.c:930 irda_accept()
	 error: we previously assumed 'sk' could be null (see line 848)

net/irda/af_irda.c
   847	
   848		if ((sk = sock->sk) = NULL)
   849			goto out;

sk is NULL here.  Oh how I love goto out.

   850	
   851		err = -EOPNOTSUPP;
   852		if ((sk->sk_type != SOCK_STREAM) && (sk->sk_type != SOCK_SEQPACKET) &&
   853		    (sk->sk_type != SOCK_DGRAM))
   854			goto out;
   855	
   856		err = -EINVAL;
   857		if (sk->sk_state != TCP_LISTEN)
   858			goto out;
   859	
   860		/*
   861		 *	The read queue this time is holding sockets ready to use
   862		 *	hooked into the SABM we saved
   863		 */
   864	
   865		/*
   866		 * We can perform the accept only if there is incoming data
   867		 * on the listening socket.
   868		 * So, we will block the caller until we receive any data.
   869		 * If the caller was waiting on select() or poll() before
   870		 * calling us, the data is waiting for us ;-)
   871		 * Jean II
   872		 */
   873		while (1) {
   874			skb = skb_dequeue(&sk->sk_receive_queue);
   875			if (skb)
   876				break;
   877	
   878			/* Non blocking operation */
   879			err = -EWOULDBLOCK;
   880			if (flags & O_NONBLOCK)
   881				goto out;
   882	
   883			err = wait_event_interruptible(*(sk_sleep(sk)),
   884						skb_peek(&sk->sk_receive_queue));
   885			if (err)
   886				goto out;
   887		}
   888	
   889		newsk = newsock->sk;
   890		err = -EIO;
   891		if (newsk = NULL)
   892			goto out;
   893	
   894		newsk->sk_state = TCP_ESTABLISHED;
   895	
   896		new = irda_sk(newsk);
   897	
   898		/* Now attach up the new socket */
   899		new->tsap = irttp_dup(self->tsap, new);
   900		err = -EPERM; /* value does not seem to make sense. -arnd */
   901		if (!new->tsap) {
   902			pr_debug("%s(), dup failed!\n", __func__);
   903			kfree_skb(skb);
   904			goto out;
   905		}
   906	
   907		new->stsap_sel = new->tsap->stsap_sel;
   908		new->dtsap_sel = new->tsap->dtsap_sel;
   909		new->saddr = irttp_get_saddr(new->tsap);
   910		new->daddr = irttp_get_daddr(new->tsap);
   911	
   912		new->max_sdu_size_tx = self->max_sdu_size_tx;
   913		new->max_sdu_size_rx = self->max_sdu_size_rx;
   914		new->max_data_size   = self->max_data_size;
   915		new->max_header_size = self->max_header_size;
   916	
   917		memcpy(&new->qos_tx, &self->qos_tx, sizeof(struct qos_info));
   918	
   919		/* Clean up the original one to keep it in listen state */
   920		irttp_listen(self->tsap);
   921	
   922		kfree_skb(skb);
   923		sk->sk_ack_backlog--;
   924	
   925		newsock->state = SS_CONNECTED;
   926	
   927		irda_connect_response(new);
   928		err = 0;
   929	out:
   930		release_sock(sk);
                             ^^
Dereferenced inside the function.

   931		return err;
   932	}

regards,
dan carpenter
