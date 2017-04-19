From: Richard Cochran <richardcochran@gmail.com>
Date: Wed, 19 Apr 2017 10:31:35 +0000
Subject: Re: [PATCH] dp83640: don't recieve time stamps twice
Message-Id: <20170419103135.GA1670@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418191426.GA17838@mwanda>
 <1492593414.3108.1.camel@spectralink.com>
In-Reply-To: <1492593414.3108.1.camel@spectralink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?B?U/hyZW5zZW4s?= Stefan <Stefan.Sorensen@spectralink.com>
Cc: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Apr 19, 2017 at 09:16:56AM +0000, S=F8rensen, Stefan wrote:
> You are correct that these lines was added accidentally.

Can we please fix this in another way?  There is no need to hold the
spin lock during the callback into the networking stack.  Instead, how
about the following diff, which also fixes the other call site...

Thanks,
Richard

---
diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
index e2460a5..593e533 100644
--- a/drivers/net/phy/dp83640.c
+++ b/drivers/net/phy/dp83640.c
@@ -874,14 +874,15 @@ static void decode_rxts(struct dp83640_private *dp836=
40,
 			shhwtstamps =3D skb_hwtstamps(skb);
 			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
 			shhwtstamps->hwtstamp =3D ns_to_ktime(rxts->ns);
-			netif_rx_ni(skb);
 			list_add(&rxts->list, &dp83640->rxpool);
 			break;
 		}
 	}
 	spin_unlock(&dp83640->rx_queue.lock);
=20
-	if (!shhwtstamps)
+	if (shhwtstamps)
+		netif_rx_ni(skb);
+	else
 		list_add_tail(&rxts->list, &dp83640->rxts);
 out:
 	spin_unlock_irqrestore(&dp83640->rx_lock, flags);
@@ -1425,7 +1426,6 @@ static bool dp83640_rxtstamp(struct phy_device *phyde=
v,
 			shhwtstamps =3D skb_hwtstamps(skb);
 			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
 			shhwtstamps->hwtstamp =3D ns_to_ktime(rxts->ns);
-			netif_rx_ni(skb);
 			list_del_init(&rxts->list);
 			list_add(&rxts->list, &dp83640->rxpool);
 			break;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
