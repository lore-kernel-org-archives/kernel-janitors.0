From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 18:21:07 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 28/38] net/pcnet32: replace
Message-Id: <20040924182107.GI1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22603763232409824=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============22603763232409824==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 11:08:25AM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use ssleep() instead of schedule_timeout()
> to guarantee the task delays as expected.

As is pretty clear from the patch, this Description does not match.

Should be:

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Sorry about that.

-Nish

--===============22603763232409824==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22603763232409824==--
