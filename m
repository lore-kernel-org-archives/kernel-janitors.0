From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 28 Apr 2004 21:07:43 +0000
Subject: Re: [Kernel-janitors] [PATCH] Replaces yield() with
Message-Id: <20040428140743.123237e8.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77075071876810708=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <408AB344.6010000@acm.org>
In-Reply-To: <408AB344.6010000@acm.org>
To: kernel-janitors@vger.kernel.org

--===============77075071876810708==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Apr 2004 23:03:56 +0200 maximilian attems wrote:

| hello,
| 
| On Mon, 26 Apr 2004, Felipe W Damasio wrote:
| 
| > Gustavo Franco wrote:
| > >--- drivers/cdrom/sonycd535.c.orig    2004-04-24 13:46:28.000000000 -0300
| > >+++ drivers/cdrom/sonycd535.c 2004-04-24 13:47:38.000000000 -0300
| > >@@ -342,7 +342,7 @@
| > >sony_sleep(void)
| > >{
| > >       if (sony535_irq_used <= 0) {    /* poll */
| > >-               yield();
| > >+               schedule_timeout(1);
| > 
| > 	I don't think it's that cut-and-dry...shouldn't you use something 
| > relevant to HZ on this? Please see the patch maximilian sent on sis900 
| > net driver.
| 
| jeff garzik prefers schedule_timeout(1) in the case of the sis900,
| "that's IMO closer to the intention.."

Yes, and I've already sent an updated sis900.c patch to Jeff.

--
~Randy

--===============77075071876810708==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77075071876810708==--
