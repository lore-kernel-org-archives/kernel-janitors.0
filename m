From: Greg KH <greg@kroah.com>
Date: Wed, 29 Sep 2004 17:41:21 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 2/4] pci hotplug/cpqphp:
Message-Id: <20040929174121.GE12641@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============017461209383768717=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234647.GI1777@us.ibm.com>
In-Reply-To: <20040916234647.GI1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============017461209383768717==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 04:18:58PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============017461209383768717==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============017461209383768717==--
