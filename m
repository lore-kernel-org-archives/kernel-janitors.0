From: David McCullough <davidm@snapgear.com>
Date: Tue, 28 Sep 2004 01:00:34 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/6] serial/68328serial:
Message-Id: <20040928010034.GC16736@beast>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============057164900469502289=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============057164900469502289==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Jivin Nishanth Aravamudan lays it down ...
> On Mon, Sep 27, 2004 at 02:12:57PM -0700, Nishanth Aravamudan wrote:
> > Any comments would be appreciated.
> > 
> > Description: Use msleep_interruptible() instead of
> > schedule_timeout() to guarantee the task delays as expected.
> 
> Sorry, I was missing part of the description. The patch also uses
> set_current_state() instead of direct assignment of current->state.

Looks ok to me :-)

Cheers,
Davidm

-- 
David McCullough, davidm@snapgear.com  Ph:+61 7 34352815 http://www.SnapGear.com
Custom Embedded Solutions + Security   Fx:+61 7 38913630 http://www.uCdot.org

--===============057164900469502289==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============057164900469502289==--
