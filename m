From: Sabrina Dubroca <sd@queasysnail.net>
Date: Wed, 16 Mar 2016 10:22:44 +0000
Subject: Re: macsec: introduce IEEE 802.1AE driver
Message-Id: <20160316102244.GA20043@bistromath>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315211241.GA17317@mwanda>
In-Reply-To: <20160315211241.GA17317@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dan,

2016-03-16, 00:12:41 +0300, Dan Carpenter wrote:
> Hello Sabrina Dubroca,
> 
> The patch c09440f7dcb3: "macsec: introduce IEEE 802.1AE driver" from
> Mar 11, 2016, leads to the following Smatch warnings:
> 
>     drivers/net/macsec.c:714 macsec_encrypt()
>     warn: 'skb->dev' held on error path.
> 
> drivers/net/macsec.c
>    711          dev_hold(skb->dev);
>                 ^^^^^^^^^^^^^^^^^^
>    712          ret = crypto_aead_encrypt(req);
>    713          if (ret = -EINPROGRESS) {
>    714                  return ERR_PTR(ret);
> 
> Need to dev_put() before returning.

In this case, no.  We want to hold a reference on the netdevice, and
it is released by the crypto callback (macsec_encrypt_done(), or
macsec_decrypt_done() in the second case).

[snip second case]


>     drivers/net/macsec.c:1624 macsec_add_rxsa()
>     error: potential null dereference 'rx_sa'.  (kmalloc returns null)

Right, I'm missing a NULL check here.  I'll send a fix.


>   1616          }
>   1617  
>   1618          rx_sa = rtnl_dereference(rx_sc->sa[assoc_num]);
>   1619          if (rx_sa) {
>   1620                  rtnl_unlock();
>   1621                  return -EBUSY;
>   1622          }
>   1623  
>   1624          rx_sa = kmalloc(sizeof(*rx_sa), GFP_KERNEL);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   1625          if (init_rx_sa(rx_sa, nla_data(tb_sa[MACSEC_SA_ATTR_KEY]), secy->key_len,
>                                ^^^^^
> Dereferenced inside function.
> 
>   1626                         secy->icv_len)) {
>   1627                  rtnl_unlock();
>   1628                  return -ENOMEM;
>   1629          }
>   1630  


Thanks for the report!

-- 
Sabrina
