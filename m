From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 28 Sep 2004 16:13:48 +0000
Subject: [Kernel-janitors] [sailer@scs.ch: Re: [PATCH 2.6.9-rc2 9/9]
Message-Id: <20040928161348.GA1816@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73839524388665145=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73839524388665145==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

----- Forwarded message from Thomas Sailer <sailer@scs.ch> -----

Date: Tue, 28 Sep 2004 08:53:21 +0200
From: Thomas Sailer <sailer@scs.ch>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Subject: Re: [PATCH 2.6.9-rc2 9/9] usb/uss720: replace schedule_timeout()
	with msleep_interruptible()

On Tue, 2004-09-28 at 00:55, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of schedule_timeout() to
> guarantee the task delays as expected.

Fine with me. uss720 does have some bitrot other than that, it seems.


----- End forwarded message -----

--===============73839524388665145==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73839524388665145==--
