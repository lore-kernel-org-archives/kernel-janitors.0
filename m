From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 18:52:34 +0000
Subject: [Kernel-janitors] Re: bluetooth: replace schedule_timeout() with
Message-Id: <20040720185234.GN2320@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33746852417761652=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720184510.GA2445@masina>
In-Reply-To: <20040720184510.GA2445@masina>
To: kernel-janitors@vger.kernel.org

--===============33746852417761652==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2004 at 08:45:10PM +0200, Domen Puncer wrote:
> On 20/07/04 18:18 +0000, Nishanth Aravamudan wrote:
> ...
> > --- linux-vanilla/drivers/bluetooth/bluecard_cs.c	2004-06-16 05:19:22.000000000 +0000
> > +++ linux-dev/drivers/bluetooth/bluecard_cs.c	2004-07-10 18:22:58.000000000 +0000
> > @@ -776,8 +776,7 @@ int bluecard_open(bluecard_info_t *info)
> >  	outb(0x80, iobase + 0x30);
> >  
> >  	/* Wait some time */
> > -	set_current_state(TASK_INTERRUPTIBLE);
> > -	schedule_timeout(HZ / 100);
> > +	msleep(100);
> 
> This should be 10.

Thanks, here is the corrected patch:


--- linux-vanilla/drivers/bluetooth/bluecard_cs.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/bluetooth/bluecard_cs.c	2004-07-10 18:22:58.000000000 +0000
@@ -776,8 +776,7 @@ int bluecard_open(bluecard_info_t *info)
 	outb(0x80, iobase + 0x30);
 
 	/* Wait some time */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ / 100);
+	msleep(10);
 
 	/* Turn FPGA on */
 	outb(0x00, iobase + 0x30);
@@ -823,8 +822,7 @@ int bluecard_open(bluecard_info_t *info)
 	outb((0x0f << RTS_LEVEL_SHIFT_BITS) | 1, iobase + REG_RX_CONTROL);
 
 	/* Timeout before it is safe to send the first HCI packet */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((HZ * 5) / 4);		// or set it to 3/2
+	msleep(1250);
 
 	/* Register HCI device */
 	if (hci_register_dev(hdev) < 0) {

--===============33746852417761652==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33746852417761652==--
