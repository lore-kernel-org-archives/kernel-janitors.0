From: Paolo Abeni <paolo.abeni@email.it>
Date: Thu, 28 Apr 2005 08:06:29 +0000
Subject: [KJ][PATCH] removal of useless call to 'keepalive_time_when'
Message-Id: <1114675589.27606.16.camel@hpi11340x.cselt.it>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-BsJOVsIwLtwjcU00f6fx"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-BsJOVsIwLtwjcU00f6fx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have found a call to keepalive_time_when in net/ipv4/tcp_timer.c that
looks like useless. The returned value is overwritten few lines of code
below, without beeing used.

cheers,

Paolo



 
 
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
 
 Sponsor:
 Scopri il benessere che solo l���aloe vera regala al tuo corpo: cura la tua pelle
* Con la vasta gamma di prodotti che ti offre Erboristeria.com
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2380&d=28-4
--=-BsJOVsIwLtwjcU00f6fx
Content-Disposition: attachment; filename=removed_unused_keepalive_time.patch
Content-Type: text/x-patch; name=removed_unused_keepalive_time.patch;
	charset=UTF-8
Content-Transfer-Encoding: 7bit

--- linux-2.6.12-rc3/net/ipv4/tcp_timer.c.orig	2005-04-28 09:50:15.352625672 +0200
+++ linux-2.6.12-rc3/net/ipv4/tcp_timer.c	2005-04-28 09:52:01.481491632 +0200
@@ -606,8 +606,6 @@ static void tcp_keepalive_timer (unsigne
 	if (!sock_flag(sk, SOCK_KEEPOPEN) || sk->sk_state == TCP_CLOSE)
 		goto out;
 
-	elapsed = keepalive_time_when(tp);
-
 	/* It is alive without keepalive 8) */
 	if (tp->packets_out || sk->sk_send_head)
 		goto resched;

--=-BsJOVsIwLtwjcU00f6fx
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-BsJOVsIwLtwjcU00f6fx--
