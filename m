From: Domen Puncer <domen@coderock.org>
Date: Fri, 23 Jul 2004 15:41:28 +0000
Subject: [Kernel-janitors] sleep_on removal from drivers/net/shaper.c
Message-Id: <20040723154128.GA2467@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86578795701515243=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86578795701515243==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Replaced sleep_on with wait_event.

Comments?


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/shaper.c	Wed Jun 16 07:19:43 2004
+++ a/drivers/net/shaper.c	Fri Jul 23 17:25:07 2004
@@ -112,7 +112,7 @@
 	while (test_and_set_bit(0, &sh->locked))
 	{
 		if (!in_interrupt())
-			sleep_on(&sh->wait_queue);
+			wait_event(sh->wait_queue, 0);
 		else
 			return 0;
 			

--===============86578795701515243==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86578795701515243==--
