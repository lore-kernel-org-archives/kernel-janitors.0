From: Greg KH <greg@kroah.com>
Date: Thu, 24 Feb 2005 19:08:31 +0000
Subject: Re: [KJ] [PATCH] drivers/i2c/chips/* : timer_after
Message-Id: <20050224190831.GC11806@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31255810973243037=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050224095217.GB2721@rhum.iomeda.fr>
In-Reply-To: <20050224095217.GB2721@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============31255810973243037==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 24, 2005 at 10:52:17AM +0100, Christophe Lucas wrote:
> Hi kj folks,
> 
> I think this patch have already posted, but kj TODO have been recently
> updated, and this entry already is here, so:
> 
> description:
> >From kj/TODO:
> 4.
> Some drivers do:
> if ((jiffies - data->last_updated > HZ * 2) ||
>             (jiffies < data->last_updated))
> Should be:
> #include <linux/jiffies.h>
> if (time_after(jiffies, data->last_updated + HZ * 2))
> 
> Have a patch for drivers/i2c/chips/*.
> 
> Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

Already fixed in the -mm tree.

thanks,

greg k-h

--===============31255810973243037==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31255810973243037==--
