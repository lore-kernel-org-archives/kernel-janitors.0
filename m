From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Feb 2015 13:23:44 +0000
Subject: re: net-caif: add CAIF generic caif support functions
Message-Id: <20150224132344.GA828@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dmitry,

The patch 15c9ac0c80e3: "net-caif: add CAIF generic caif support
functions" from Mar 30, 2010, leads to the following static checker
warning:

	net/caif/cfpkt_skbuff.c:289 cfpkt_setlen()
	warn: bad indenting.

net/caif/cfpkt_skbuff.c
   275  int cfpkt_setlen(struct cfpkt *pkt, u16 len)
   276  {
   277          struct sk_buff *skb = pkt_to_skb(pkt);
   278  
   279  
   280          if (unlikely(is_erronous(pkt)))
   281                  return -EPROTO;
   282  
   283          if (likely(len <= skb->len)) {
   284                  if (unlikely(skb->data_len))
   285                          ___pskb_trim(skb, len);
   286                  else
   287                          skb_trim(skb, len);
   288  
   289                          return cfpkt_getlen(pkt);

I don't think curly braces were intended here around the else, but soon
the static checker will suggest them.  I wouldn't be surprised if some
already do.

   290          }
   291  
   292          /* Need to expand SKB */
   293          if (unlikely(!cfpkt_pad_trail(pkt, len - skb->len)))
   294                  PKT_ERROR(pkt, "skb_pad_trail failed\n");
   295  
   296          return cfpkt_getlen(pkt);
   297  }


regards,
dan carpenter
