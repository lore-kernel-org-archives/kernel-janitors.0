From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 16:22:18 +0000
Subject: [Kernel-janitors] Re: 2.6.9-rc2-kjt1 rio_linux compile error
Message-Id: <20040922162218.GB1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77078528099459087=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040921221307.GG4260@stro.at> <20040922112157.GB27364@fs.tum.de>
In-Reply-To: <20040922112157.GB27364@fs.tum.de>
To: Adrian Bunk <bunk@fs.tum.de>
Cc: kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org

--===============77078528099459087==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 22, 2004 at 01:21:58PM +0200, Adrian Bunk wrote:
> On Wed, Sep 22, 2004 at 12:13:07AM +0200, maximilian attems wrote:
> >...
> > added since 2.6.9-rc1-kjt1
> >...
> > msleep-drivers_char_rio_linux.patch
> >   From: Nishanth Aravamudan <nacc@us.ibm.com>
> >   Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 20/33] char/rio_linux: replace 	schedule_timeout() with msleep()/msleep_interruptible()
> >...
> 
> This doesn't compile (obvious typo):

Thanks for catching this! Here is the fixed patch:


--- 2.6.9-rc2-vanilla/drivers/char/rio/rio_linux.c	2004-09-13 17:15:47.000000000 -0700
+++ 2.6.9-rc2/drivers/char/rio/rio_linux.c	2004-09-22 09:20:56.000000000 -0700
@@ -330,8 +330,7 @@ int RIODelay (struct Port *PortP, int nj
   func_enter ();
 
   rio_dprintk (RIO_DEBUG_DELAY, "delaying %d jiffies\n", njiffies);  
-  current->state = TASK_INTERRUPTIBLE;
-  schedule_timeout(njiffies);
+  msleep_interruptible(jiffies_to_msecs(njiffies));
   func_exit();
 
   if (signal_pending(current))
@@ -347,8 +346,7 @@ int RIODelay_ni (struct Port *PortP, int
   func_enter ();
 
   rio_dprintk (RIO_DEBUG_DELAY, "delaying %d jiffies (ni)\n", njiffies);  
-  current->state = TASK_UNINTERRUPTIBLE;
-  schedule_timeout(njiffies);
+  msleep(jiffies_to_msecs(njiffies));
   func_exit();
   return !RIO_FAIL;
 }

--===============77078528099459087==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77078528099459087==--
