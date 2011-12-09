From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Fri, 09 Dec 2011 12:39:46 +0000
Subject: RE: [smatch stuff] xshm: release misc device on error
Message-Id: <81C3A93C17462B4BBD7E272753C105791FB0D6B443@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111208192441.GB8810@elgon.mountain>
In-Reply-To: <20111208192441.GB8810@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

>Smatch complains that we don't release the misc device on error.
>  1055          if (mutex_lock_interruptible(&dev->mutex)) {
>  1056                  xdev_dbg(dev, "mutex_lock_interruptible got signalled\n");
>
>-> if result is 0 here we should release it.  Should we call
>xshmchr_put() or misc_deregister()?
>
>  1057                  return -ERESTARTSYS;
>  1058          }

Thank you for spotting this!

If we take the mutex before registering the misc device it's
impossible for anyone else to take the mutex. 
So I think I will simply call mutex_lock() before misc_register().

I will fix this in my next patch-set,

Thanks,
Sjur

