From: Christian Lamparter <chunkeey@googlemail.com>
Date: Sun, 02 Dec 2012 13:49:20 +0000
Subject: Re: [patch] carl9170: remove unneeded NULL check
Message-Id: <201212021449.21267.chunkeey@googlemail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121202104238.GB16078@elgon.mountain>
In-Reply-To: <20121202104238.GB16078@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sunday 02 December 2012 11:42:38 Dan Carpenter wrote:
> The "sta" variable is not checked for NULL consistently and it makes the
> static checkers complain.  I asked Christian Lamparter about this and
> it turns out the check is not needed.  "In fact, in order to set up a
> ampdu session, the stack would call the driver's op_ampdu_action
> callback which always needs a station."

that would be from the thread:
<http://www.spinics.net/lists/linux-wireless/msg94526.html>
 
> I have removed the check.
I think this will bug for multicast and injected frames.
 
It is not possible for the sta(tion) pointer to be NULL if
the frame has the IEEE80211_TX_CTL_AMPDU flag set. So the
sta = NULL check can be avoided when calling 
carl9170_tx_ampdu_queue. This is because mac80211 tracks
all aggregation sessions within the station struct.
Of course, this is something that the checker tool can't
possibly deduce, but it has a point and we can add a check
like this [see attached draft patch]:

What do you think [or more to the point: what does the
checker say?]

Regards,
	Chr
---
diff --git a/drivers/net/wireless/ath/carl9170/tx.c b/drivers/net/wireless/ath/carl9170/tx.c
index 84377cf..e09d293 100644
--- a/drivers/net/wireless/ath/carl9170/tx.c
+++ b/drivers/net/wireless/ath/carl9170/tx.c
@@ -1470,6 +1470,9 @@ void carl9170_op_tx(struct ieee80211_hw *hw,
 
 	info = IEEE80211_SKB_CB(skb);
 
+	if ((info->flags & IEEE80211_TX_CTL_AMPDU) && WARN_ON_ONCE(!sta))
+		goto err_free;
+
 	if (unlikely(carl9170_tx_prepare(ar, sta, skb)))
 		goto err_free;
 

