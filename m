From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 20:41:34 +0000
Subject: [Kernel-janitors] [PATCH] saa7146_i2c: replace schedule_timeout()
Message-Id: <20040726204134.GD1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62981406387198025=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723220936.GQ2675@us.ibm.com>
In-Reply-To: <20040723220936.GQ2675@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============62981406387198025==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not quite corrected enough. Please see below. Thanks again, Domen.

On Sat, Jul 24, 2004 at 09:10:27PM -0400, Mark Hollomon wrote:
> Nish Aravamudan wrote:
> 
> >
> >Ok, thanks, I wasn't sure about this - I had posted a while ago about
> >the weird conversion because I couldn't quite decipher what it was
> >intended to achieve. Looking over the math, I think I agree with you.
> >I will re-submit this patch soon. BTW, doesn't that seem kind of
> >confusing? - The delays are in terms of 1, 5 and 10 tenths of a
> >millisecond? If that's the case, then this patch is pretty much
> >useless (it makes sense to use msleep() with long delays, things
> >countable in msecs). I suppose I could re-patch so that the value of
> >SAA7146_I2C_DELAY is in msecs and then use msecs_to_jiffies() in
> >my_wait(). Thanks again!
> 
> Very confusing. Also, a millisecond is added to the delay. So, if you 
> pass in 10, the expression will partially evaluate to 2 * HZ / 1000 
> which is effectively 2 milliseconds.
> 
> 
> But I suspect the +10 in the original code was simply to ensure that the 
> delay was never zero. I don't remember if gcc does all the constant 
> folding in float and truncate at the end or if it truncates as it goes. 
> But if it truncates partial results then ms/10 will be zero if  ms < 10.

<snip>

> If you wanted to be cheap, you could make the guts of my_wait be simply
> 	msleep((ms+10)/10)
> and let somebody else figure out what was really meant.

Ok, I think I understand the math now, after doing a bit of messing with
it myself. I agree that the +10 is just a rounding fix, which is pretty
common in schedule_timeout() calls. I have used msecs_to_jiffies() in
the corrected patch below to avoid some of this confusion, as it will
take care of the rounding. Thus, I am invoking msleep() on (ms/10),
which should correctly express the parameter as tenths of a millisecond.
Thanks for your help, Mark. 

-Nish

Note: This patch supersedes the previous saa7146_i2c one. Thanks.

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the desired time. Also replaces the conversion between
msecs and jiffies with msecs_to_jiffies(). 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/common/saa7146_i2c.c	2004-06-15 22:20:04.000000000 -0700
+++ linux-dev/drivers/media/common/saa7146_i2c.c	2004-07-26 10:27:26.000000000 -0700
@@ -1,11 +1,11 @@
 #include <linux/version.h>
 #include <media/saa7146_vv.h>
 
-/* helper function */
+/* helper function
+   Note: ms is in terms of tenths of a msec */
 static void my_wait(struct saa7146_dev *dev, long ms)
 {
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((((ms+10)/10)*HZ)/1000);
+	msleep(ms/10);
 }
 
 u32 saa7146_i2c_func(struct i2c_adapter *adapter)

--===============62981406387198025==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62981406387198025==--
