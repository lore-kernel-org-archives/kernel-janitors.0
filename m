From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 24 Feb 2005 10:45:15 +0000
Subject: Re: [KJ] [PATCH] drivers/i2c/chips/* : timer_after
Message-Id: <20050224104515.GE2721@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97934004235975003=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050224095217.GB2721@rhum.iomeda.fr>
In-Reply-To: <20050224095217.GB2721@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============97934004235975003==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Alexey Dobriyan (adobriyan@mail.ru) wrote:
> On Thursday 24 February 2005 11:52, Christophe Lucas wrote:
> 
> > I think this patch have already posted, but kj TODO have been recently
> > updated, and this entry already is here, so:
> > 
> > description:
> > >From kj/TODO:
> > 4.
> > Some drivers do:
> > if ((jiffies - data->last_updated > HZ * 2) ||
> >             (jiffies < data->last_updated))
> > Should be:
> > #include <linux/jiffies.h>
> > if (time_after(jiffies, data->last_updated + HZ * 2))
> 
> Greg KH already applied my patch with following diffstat:

Ok sorry :-)

Have a nice day.

	~Christophe


--===============97934004235975003==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97934004235975003==--
