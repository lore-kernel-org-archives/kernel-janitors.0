From: Jean Tourrilhes <jt@bougret.hpl.hp.com>
Date: Tue, 21 Sep 2004 22:04:30 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 2/40] net/act2001-sir:
Message-Id: <20040921220430.GA20188@bougret.hpl.hp.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============65446288625632631=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============65446288625632631==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2004 at 02:57:58PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep() instead of schedule_timeout()
> to guarantee the task delays as expected.

	I already said that I don't want this. And looking at other
people getting confused by msleep, I'm more convinced than ever.
	No.

	Thank you.

	Jean

--===============65446288625632631==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============65446288625632631==--
