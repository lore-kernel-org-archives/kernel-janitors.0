From: nilay vaish <nilayvaish@yahoo.com>
Date: Thu, 15 Jun 2006 12:13:56 +0000
Subject: [KJ] [PATCH 2.6.16.20 001/001l] netfilter: frees skb using
Message-Id: <20060615121356.43791.qmail@web8714.mail.in.yahoo.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1206821707=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============1206821707==
Content-Type: multipart/alternative;
    boundary="----------=_1150373695-15324-222"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1150373695-15324-222
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline


From: Nilay Vaish <nilayvaish@yahoo.com>

This removes the use of kfree in freeing skbs. 
kfree has been replaced with kfree_skb.

Signed-off-by: <nilayvaish@yahoo.com>
---
--- a/net/ipv4/netfilter/ipt_recent.c   2006-03-20 11:23:29.000000000 +0530
+++ b/net/ipv4/netfilter/ipt_recent.c   2006-06-15 10:52:59.000000000 +0530
@@ -322,7 +322,7 @@ static int ip_recent_ctrl(struct file *f

 kfree(skb->nh.iph);
 out_free_skb:
- kfree(skb);
+ kfree_skb(skb);
 out_free_info:
 kfree(info);




 Send instant messages to your online friends http://in.messenger.yahoo.com 

 Stay connected with your friends even when away from PC.  Link: http://in.mobile.yahoo.com/new/messenger/  
 Send instant messages to your online friends http://in.messenger.yahoo.com 

 Stay connected with your friends even when away from PC.  Link: http://in.mobile.yahoo.com/new/messenger/  
------------=_1150373695-15324-222
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

<pre>From: Nilay Vaish &lt;nilayvaish@yahoo.com&gt;<br><br>This removes the use of kfree in freeing skbs. <br>kfree has been replaced with kfree_skb.<br><br>Signed-off-by: &lt;nilayvaish@yahoo.com&gt;<br>---<br>--- a/net/ipv4/netfilter/ipt_recent.c   2006-03-20 11:23:29.000000000 +0530<br>+++ b/net/ipv4/netfilter/ipt_recent.c   2006-06-15 10:52:59.000000000 +0530<br>@@ -322,7 +322,7 @@ static int ip_recent_ctrl(struct file *f<br><br> kfree(skb-&gt;nh.iph);<br> out_free_skb:<br>- kfree(skb);<br>+ kfree_skb(skb);<br> out_free_info:<br> kfree(info);<br><br><br></pre><p> Send instant messages to your online friends http://in.messenger.yahoo.com <br><br> Stay connected with your friends even when away from PC.  Link: http://in.mobile.yahoo.com/new/messenger/  <p>&#32;Send instant messages to your online friends http://in.messenger.yahoo.com <br><br> Stay connected with your friends even when away from PC.  Link: http://in.mobile.yahoo.com/new/messenger/  
------------=_1150373695-15324-222--

--===============1206821707==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1206821707==--
