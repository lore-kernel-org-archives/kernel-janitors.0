From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:37:55 +0000
Subject: [Kernel-janitors] [PATCH] radio/radio-maxiradio: replace
Message-Id: <20040726223755.GI1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98516569784137054=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726223610.GH1897@us.ibm.com>
In-Reply-To: <20040726223610.GH1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============98516569784137054==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replaced sleep_125ms() with msleep(125) and replaced the
replaced function's definition.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/radio/radio-maxiradio.c	2004-06-16 05:20:03.000000000 +0000
+++ linux-dev/drivers/media/radio/radio-maxiradio.c	2004-07-02 20:39:37.000000000 +0000
@@ -104,13 +104,6 @@ static struct radio_device
 } radio_unit = {0, 0, 0, 0, };
 
 
-static void sleep_125ms(void)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ >> 3);
-}
-
-
 static void outbit(unsigned long bit, __u16 io)
 {
 	if(bit != 0)
@@ -228,7 +221,7 @@ inline static int radio_function(struct 
 				return -EINVAL;
 			card->freq = *freq;
 			set_freq(card->io, FREQ2BITS(card->freq));
-			sleep_125ms();
+			msleep(125);
 			return 0;
 		}
 		case VIDIOCGAUDIO: {	

--===============98516569784137054==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98516569784137054==--
