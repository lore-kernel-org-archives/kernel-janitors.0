From: Yoann Padioleau <padator@wanadoo.fr>
Date: Mon, 23 Jul 2007 15:38:39 +0000
Subject: Re: [PATCH] dev->priv to netdev_priv(dev), drivers/net/tokenring/
Message-Id: <87fy3fjfk0.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87r6mzmf6q.fsf@wanadoo.fr>
	<Pine.LNX.4.64.0707231712120.32367@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0707231712120.32367@fbirervta.pbzchgretzou.qr>
	(Jan Engelhardt's message of "Mon, 23 Jul 2007 17:13:07 +0200 (CEST)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Jan Engelhardt <jengelh@computergmbh.de> writes:

> On Jul 23 2007 15:18, Yoann Padioleau wrote:
>>
>>Here is an excerpt of the semantic patch that performs the transformation
>>
>>@@
>>
>>- (T*) dev->priv
>>+ netdev_priv(dev)
>
> Note that dev->priv is a void*, and hence does not need casting.
> So dev->priv may also appear without one.

Yes you are right. I have shown only an excerpt of the semantic patch.
Sorry. There is another rule:

@ rule3 depends on rule1 && !rule1bis @
struct net_device *dev;
@@

- dev->priv
+ netdev_priv(dev)


If you look at my patch there is one such case

-	struct tok_info *ti = dev->priv;
+	struct tok_info *ti = netdev_priv(dev);



