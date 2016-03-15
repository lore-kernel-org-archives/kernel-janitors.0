From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Mar 2016 21:12:41 +0000
Subject: re: macsec: introduce IEEE 802.1AE driver
Message-Id: <20160315211241.GA17317@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sabrina Dubroca,

The patch c09440f7dcb3: "macsec: introduce IEEE 802.1AE driver" from
Mar 11, 2016, leads to the following Smatch warnings:

    drivers/net/macsec.c:714 macsec_encrypt()
    warn: 'skb->dev' held on error path.

drivers/net/macsec.c
   711          dev_hold(skb->dev);
                ^^^^^^^^^^^^^^^^^^
   712          ret = crypto_aead_encrypt(req);
   713          if (ret = -EINPROGRESS) {
   714                  return ERR_PTR(ret);

Need to dev_put() before returning.

   715          } else if (ret != 0) {
   716                  dev_put(skb->dev);
   717                  kfree_skb(skb);
   718                  aead_request_free(req);
   719                  macsec_txsa_put(tx_sa);
   720                  return ERR_PTR(-EINVAL);
   721          }
   722  
   723          dev_put(skb->dev);
   724          aead_request_free(req);
   725          macsec_txsa_put(tx_sa);
   726  
   727          return skb;
   728  }

    drivers/net/macsec.c:923 macsec_decrypt()
    warn: 'dev' held on error path.

   921          dev_hold(dev);
                ^^^^^^^^^^^^^
   922          ret = crypto_aead_decrypt(req);
   923          if (ret = -EINPROGRESS) {
   924                  return NULL;

Same.

   925          } else if (ret != 0) {
   926                  /* decryption/authentication failed
   927                   * 10.6 if validateFrames is disabled, deliver anyway
   928                   */
   929                  if (ret != -EBADMSG) {
   930                          kfree_skb(skb);
   931                          skb = NULL;
   932                  }
   933          } else {
   934                  macsec_skb_cb(skb)->valid = true;
   935          }
   936          dev_put(dev);
   937  

    drivers/net/macsec.c:1624 macsec_add_rxsa()
    error: potential null dereference 'rx_sa'.  (kmalloc returns null)

  1616          }
  1617  
  1618          rx_sa = rtnl_dereference(rx_sc->sa[assoc_num]);
  1619          if (rx_sa) {
  1620                  rtnl_unlock();
  1621                  return -EBUSY;
  1622          }
  1623  
  1624          rx_sa = kmalloc(sizeof(*rx_sa), GFP_KERNEL);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  1625          if (init_rx_sa(rx_sa, nla_data(tb_sa[MACSEC_SA_ATTR_KEY]), secy->key_len,
                               ^^^^^
Dereferenced inside function.

  1626                         secy->icv_len)) {
  1627                  rtnl_unlock();
  1628                  return -ENOMEM;
  1629          }
  1630  

regards,
dan carpenter
