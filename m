From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 21:16:24 +0000
Subject: re: kcm: Splice support
Message-Id: <20160315211624.GA17646@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ Someone probably already fixed this, but I'm not on netdev. -dan ]

Hello Tom Herbert,

The patch 91687355b927: "kcm: Splice support" from Mar 7, 2016, leads
to the following static checker warning:

	net/kcm/kcmsock.c:1508 kcm_splice_read()
	warn: unsigned 'copied' is never less than zero.

net/kcm/kcmsock.c
  1477  static ssize_t kcm_splice_read(struct socket *sock, loff_t *ppos,
  1478                                 struct pipe_inode_info *pipe, size_t len,
  1479                                 unsigned int flags)
  1480  {
  1481          struct sock *sk = sock->sk;
  1482          struct kcm_sock *kcm = kcm_sk(sk);
  1483          long timeo;
  1484          struct kcm_rx_msg *rxm;
  1485          int err = 0;
  1486          size_t copied;
                ^^^^^^^^^^^^^

  1487          struct sk_buff *skb;
  1488  
  1489          /* Only support splice for SOCKSEQPACKET */
  1490  
  1491          timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
  1492  
  1493          lock_sock(sk);
  1494  
  1495          skb = kcm_wait_data(sk, flags, timeo, &err);
  1496          if (!skb)
  1497                  goto err_out;
  1498  
  1499          /* Okay, have a message on the receive queue */
  1500  
  1501          rxm = kcm_rx_msg(skb);
  1502  
  1503          if (len > rxm->full_len)
  1504                  len = rxm->full_len;
  1505  
  1506          copied = skb_splice_bits(skb, sk, rxm->offset, pipe, len, flags,
  1507                                   kcm_sock_splice);
  1508          if (copied < 0) {
                    ^^^^^^^^^
Never true.

I feel like skb_splice_bits() should return ssize_t instead of int just
so that everything is consistent.

  1509                  err = copied;
  1510                  goto err_out;
  1511          }

regards,
dan carpenter
