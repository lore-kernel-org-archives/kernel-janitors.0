From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 30 Sep 2004 11:31:46 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 fore200e.c] convert
Message-Id: <20040930123146.A23919@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============086515536952314953=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <415BD20C.6050709@nuerscht.ch>
In-Reply-To: <415BD20C.6050709@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============086515536952314953==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2004 at 11:29:48AM +0200, Tobias Klauser wrote:
> I'm sending this only to kernel-janitor since I'm not sure, if I do this 
> right (It's my first patch). It compiled without problems here.
> 
> Description: Use pci_get_device instead of pci_find_device.

Sorry, but the original code really wants a rewrite to use pci_driver.

It's broken to no end, and pci_get_device won't fix the races.


--===============086515536952314953==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============086515536952314953==--
