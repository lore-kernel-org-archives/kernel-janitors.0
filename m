From: Greg KH <greg@kroah.com>
Date: Wed, 29 Sep 2004 17:41:06 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 4/4] pci hotplug/shpchp:
Message-Id: <20040929174106.GC12641@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============090072056370896103=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920215026.GK2270@us.ibm.com>
In-Reply-To: <20040920215026.GK2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============090072056370896103==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 04:20:38PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============090072056370896103==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============090072056370896103==--
