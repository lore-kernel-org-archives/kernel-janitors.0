From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 26 Jul 2004 19:43:36 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] eicon/platform: replace
Message-Id: <20040726124336.3318e348.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66123085966143735=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.31.0407240810500.21642-100000@phoenix.one.melware.de>
In-Reply-To: <Pine.LNX.4.31.0407240810500.21642-100000@phoenix.one.melware.de>
To: kernel-janitors@vger.kernel.org

--===============66123085966143735==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Jul 2004 21:48:33 +0200 (MEST) Armin Schindler wrote:

| On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:
| > On Sat, Jul 24, 2004 at 08:17:51AM +0200, Armin Schindler wrote:
| > > On Fri, 23 Jul 2004, Nishanth Aravamudan wrote:
| > > > I would appreciate any comments from the janitors list.
| > > >
| > > > Thanks,
| > > > Nish
| > > >
| > > >
| > > > Depends-on: Patches to eicon/capifunc, io, mntfunc, os_4bri, os_bri,
| > > > os_pri, which replace invocations of diva_os_sleep() and diva_os_wait()
| > > > with msleep() and mdelay() respectively. Will not compile without those
| > > > patches.
| > >
| > > What is the reason for your patches ?
| > >
| > > Most of the drivers code is 'common-' code, used in other OSes too.
| > > So to maintain all of this, wrapper functions like diva_os_*() make it
| > > easier and I don't like to change that.
| > >
| > > If necessary, the inline function itself should be changed, not the main
| > > code.
| >
| > I have made this change specifically. Please find the new patch below.
| > All of the previous eicon patches can be ignored, then, and just this
| > one applied.
| 
| Agreed.
| 
| I'm not familiar with kernel-janitors, who is going to send your patches
| to Linus/Andrew ?

The module/subsystem maintainer can elect to merge it on his/her own
(is that you?) or the KJ maintainer (Max Attems) will forward them
if they "pass".


| Armin
| 
| > --- linux-vanilla/drivers/isdn/hardware/eicon/platform.h	2004-06-15 22:19:43.000000000 -0700
| > +++ linux-dev/drivers/isdn/hardware/eicon/platform.h	2004-07-26 09:52:31.000000000 -0700
| > @@ -214,10 +214,7 @@ void diva_os_free_message_buffer(diva_os
| >  */
| >  static __inline__ void diva_os_sleep(dword mSec)
| >  {
| > -	unsigned long timeout = HZ * mSec / 1000 + 1;
| > -
| > -	set_current_state(TASK_UNINTERRUPTIBLE);
| > -	schedule_timeout(timeout);
| > +	msleep(mSec);
| >  }
| >  static __inline__ void diva_os_wait(dword mSec)
| >  {
| >
| 
| 


--
~Randy

--===============66123085966143735==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66123085966143735==--
