From: "David S. Miller" <davem@davemloft.net>
Date: Wed, 09 Feb 2005 04:37:02 +0000
Subject: [KJ] Re: [PATCH 21/39] net/ipconfig: replace schedule_timeout() with
Message-Id: <20050208203702.7f033fcb.davem@davemloft.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39266409317648598=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120235749.GJ2600@us.ibm.com>
	<Xine.LNX.4.44.0501202135280.4666-100000@thoron.boston.redhat.com>
In-Reply-To: <Xine.LNX.4.44.0501202135280.4666-100000@thoron.boston.redhat.com>
To: James Morris <jmorris@redhat.com>
Cc: netdev@oss.sgi.com, kaber@coreworks.de, yoshfuji@linux-ipv6.org, kernel-janitors@lists.osdl.org, kuznet@ms2.inr.ac.ru

--===============39266409317648598==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Jan 2005 21:36:42 -0500 (EST)
James Morris <jmorris@redhat.com> wrote:

> On Thu, 20 Jan 2005, Nishanth Aravamudan wrote:
> 
> > Hi,
> > 
> > Please consider applying.
> > 
> > Description: Use msleep() instead of schedule_timeout() to guarantee the task
> > delays as expected. Change the units of the two constants to be msecs and secs
> > respectively.
> 
> Looks fine to me.

To me too, applied.  Thanks Nishanth.

--===============39266409317648598==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39266409317648598==--
