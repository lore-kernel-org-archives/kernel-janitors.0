From: Greg KH <greg@kroah.com>
Date: Wed, 29 Sep 2004 17:41:14 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 3/4] pci hotplug/pciehp:
Message-Id: <20040929174114.GD12641@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29828440289759905=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41493C3D.6090403@tungstengraphics.com>
In-Reply-To: <41493C3D.6090403@tungstengraphics.com>
To: kernel-janitors@vger.kernel.org

--===============29828440289759905==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 04:19:59PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Applied, thanks.

greg k-h


--===============29828440289759905==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29828440289759905==--
