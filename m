From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Sep 2004 20:40:44 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] ide/ide-tape: replace
Message-Id: <20040921204044.GD1946@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68334431758784664=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234735.GJ1777@us.ibm.com>
In-Reply-To: <20040916234735.GJ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============68334431758784664==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2004 at 09:12:59PM +0200, maximilian attems wrote:
> On Thu, 16 Sep 2004, Nishanth Aravamudan wrote:
> 
> > Any comments would be appreciated.
> > 
> > Description: Uses msleep_interruptible() in place of schedule_timeout()
> > to guarantee the task delays as expected.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > --- 2.6.9-rc2-vanilla/drivers/ide/legacy/ide-cs.c	2004-09-13 17:16:06.000000000 -0700
> > +++ 2.6.9-rc2/drivers/ide/legacy/ide-cs.c	2004-09-16 16:42:03.000000000 -0700
> > @@ -43,6 +43,7 @@
> >  #include <linux/ide.h>
> >  #include <linux/hdreg.h>
> >  #include <linux/major.h>
> > +#include <linux/delay.h>
> >  #include <asm/io.h>
> >  #include <asm/system.h>
> >  
> > @@ -357,8 +358,7 @@ void ide_config(dev_link_t *link)
> >  		break;
> >  	    }
> >  	}
> > -	__set_current_state(TASK_UNINTERRUPTIBLE);
> > -	schedule_timeout(HZ/10);
> > +	msleep(100);
> >      }
> >  
> >      if (hd < 0) {
> 
> hmm this patch is same as the one before resend, it uses msleep().
> did you forget to update, or is it just a comment mismatch?
> until feedback i keep old one for kjt. :)

Comment mismatch. Thanks for catching it.

-Nish

--===============68334431758784664==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68334431758784664==--
