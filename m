From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 17 Feb 2005 00:40:16 +0000
Subject: [KJ] [UPDATE PATCH] net/s2io: replace schedule_timeout() with
Message-Id: <20050217004016.GB14664@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24680701876067968=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24680701876067968==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2005 at 04:18:42PM -0800, Ravinandan Arakali wrote:
> Jeff,
> I have just now sent you the below mentioned patch(It has the
> subject Multicast fix). Although the problem initially manifested
> as "IPv6 ping not working", root cause boiled down to driver 
> incorrectly programming multicast addresses into the NIC's Rx filter.
> 
> BTW, the patch has been generated on top of Nishanth's patch.

Here is a fix patch, which prevents an unstoppable sleep from occurring.
Now, the task can be woken by signals (Ctrl-C), etc. Generated in
response to comments by Domen Puncer & Ravindan Arakali.

Thanks,
Nish

Description: Fix a bug in the patched s2io driver, which lead to an
uninterruptible sleep lasting a *long* time. Instead, use
msleep_interruptible() to allow wake-ups early via Ctrl-C and other
signals.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc4-kj-v/drivers/net/s2io.c	2005-02-16 16:33:45.000000000 -0800
+++ 2.6.11-rc4-kj/drivers/net/s2io.c	2005-02-16 16:31:16.000000000 -0800
@@ -3297,9 +3297,9 @@ static int s2io_ethtool_idnic(struct net
 	}
 	mod_timer(&sp->id_timer, jiffies);
 	if (data)
-		msleep(data * 1000);
+		msleep_interruptible(data * 1000);
 	else
-		msleep(0xFFFFFFFF);
+		msleep_interruptible(0xFFFFFFFF);
 	del_timer_sync(&sp->id_timer);
 
 	if (CARDS_WITH_FAULTY_LINK_INDICATORS(subid)) {

--===============24680701876067968==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24680701876067968==--
