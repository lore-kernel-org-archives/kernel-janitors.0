From: Domen Puncer <domen@coderock.org>
Date: Fri, 23 Jul 2004 15:42:58 +0000
Subject: [Kernel-janitors] sleep_on removal from tokenring/tms389tr.c
Message-Id: <20040723154258.GB2467@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35520384422640605=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723154128.GA2467@masina>
In-Reply-To: <20040723154128.GA2467@masina>
To: kernel-janitors@vger.kernel.org

--===============35520384422640605==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Replaced sleep_on_interruptible with wait_event_interruptible.
wait_event_interruptible condition is 0, but since it's a define it
compiles to nothing.

Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/tokenring/tms380tr.c	Fri Jul 23 16:00:23 2004
+++ a/drivers/net/tokenring/tms380tr.c	Fri Jul 23 17:11:05 2004
@@ -288,7 +288,7 @@
 	 * there will be a timeout from the timer.
 	 */
 	tp->Sleeping = 1;
-	interruptible_sleep_on(&tp->wait_for_tok_int);
+	wait_event_interruptible(tp->wait_for_tok_int, 0);
 	del_timer(&tp->timer);
 
 	/* If AdapterVirtOpenFlag is 1, the adapter is now open for use */
@@ -1145,7 +1145,7 @@
 	tms380tr_enable_interrupts(dev);
 
 	tp->Sleeping = 1;
-	interruptible_sleep_on(&tp->wait_for_tok_int);
+	wait_event_interruptible(tp->wait_for_tok_int, 0);
 	tp->TransmitCommandActive = 0;
     
 	del_timer(&tp->timer);

--===============35520384422640605==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35520384422640605==--
