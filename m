From: Greg KH <greg@kroah.com>
Date: Mon, 20 Sep 2004 07:03:49 +0000
Subject: Re: [Kernel-janitors] pci_find_* to pci_get_*
Message-Id: <20040920070349.GA6691@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============844783553956581=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============844783553956581==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 19, 2004 at 11:46:14PM -0700, Scott Feldman wrote:
> Is anyone working on converting pci_find_* to pci_get_*?  

I've already done a few of these conversions.  They are in the -mm tree,
in the bk-pci patch, if you are curious.  I also think that Hanna Linder
has started to do a few too.  I think only the pci_find_device to
pci_get_device conversions are remaining, but I haven't looked in a week
or so.

> Saw it in the TODO, but wanted to make sure someone wasn't already half
> way there before I spent time on it...

It's not a simple conversion all the time, as a number of drivers should
be converted to use the real "probe/release" functions instead of just
converting them to pci_get_device.  So feel free to start, as it will
take a while to get them all.  And don't wait until you are finished
with all of them to send in patches, even a few here and there are
gladly accepted.

thanks,

greg k-h

--===============844783553956581==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============844783553956581==--
