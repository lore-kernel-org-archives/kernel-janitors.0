From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 02 Sep 2004 16:09:49 +0000
Subject: [Kernel-janitors] Re: [patch 8/8] prism54/islpci_dev: replace
Message-Id: <20040902160948.GA1944@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77209131688397914=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200409020850.38177.margitsw@t-online.de> <20040902082432.GA1876@stro.at>
In-Reply-To: <20040902082432.GA1876@stro.at>
To: Margit Schubert-While <margitsw@t-online.de>, netdev@oss.sgi.com, kj <kernel-janitors@osdl.org>

--===============77209131688397914==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 02, 2004 at 10:24:33AM +0200, maximilian attems wrote:
> On Thu, 02 Sep 2004, Margit Schubert-While wrote:
> 
> > I agree with Jean and add the following :
> > You are assuming HZ = 1000.
> > In 2.4, HZ = 100 (And in 2.6, HZ is not necessarily = 1000).

As the original author of the patches, I feel I should interject . . .
Why/Where do you see an assumption about the value of HZ? The conversion
of the parameter to schedule_timeout() from jiffies to msecs is the only
place I can see where that might appear to be the case. But, upon closer
examination, there is no such assumption:

1000 = the number of milliseconds in a second.
HZ = the number of jiffies in a second (regardless of architecture)

In the original code for prism54/islpci_dev.c:

set_current_state(TASK_UNINTERRUPTIBLE);
schedule_timeout(50*HZ/1000);

Thus, to convert (50*HZ/1000) from jiffies to msecs, multiply by 1000
and divide by HZ, or:

50*HZ/1000 jiffies * 1000/HZ msecs/jiffie = 50 msecs.

And thus, in the patched code, the above becomes:

msleep(50);

Does that clear things up?

-Nish

--===============77209131688397914==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77209131688397914==--
