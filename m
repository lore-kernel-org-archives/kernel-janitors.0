From: Armin Schindler <armin@melware.de>
Date: Sat, 24 Jul 2004 06:17:51 +0000
Subject: [Kernel-janitors] Re: [PATCH] eicon/platform: replace
Message-Id: <Pine.LNX.4.31.0407240810500.21642-100000@phoenix.one.melware.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6982979535934446=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6982979535934446==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 23 Jul 2004, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
>
> Thanks,
> Nish
>
>
> Depends-on: Patches to eicon/capifunc, io, mntfunc, os_4bri, os_bri,
> os_pri, which replace invocations of diva_os_sleep() and diva_os_wait()
> with msleep() and mdelay() respectively. Will not compile without those
> patches.

What is the reason for your patches ?

Most of the drivers code is 'common-' code, used in other OSes too.
So to maintain all of this, wrapper functions like diva_os_*() make it
easier and I don't like to change that.

If necessary, the inline function itself should be changed, not the main
code.

Armin


> Applys-to: 2.6.7
>
> Description: Replace diva_os_sleep() with msleep() and diva_os_wait()
> with mdelay() in all instances.
>
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
>
> --- linux-vanilla/drivers/isdn/hardware/eicon/platform.h	2004-06-16 05:19:43.000000000 +0000
> +++ linux-dev/drivers/isdn/hardware/eicon/platform.h	2004-07-02 18:09:08.000000000 +0000
> @@ -210,21 +210,6 @@ void diva_os_free_message_buffer(diva_os
>  #define DIVA_MESSAGE_BUFFER_DATA(x) x->data
>
>  /*
> -** mSeconds waiting
> -*/
> -static __inline__ void diva_os_sleep(dword mSec)
> -{
> -	unsigned long timeout = HZ * mSec / 1000 + 1;
> -
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(timeout);
> -}
> -static __inline__ void diva_os_wait(dword mSec)
> -{
> -	mdelay(mSec);
> -}
> -
> -/*
>  **  PCI Configuration space access
>  */
>  void PCIwrite (byte bus, byte func, int offset, void* data, int length, void* pci_dev_handle);
>


--===============6982979535934446==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6982979535934446==--
