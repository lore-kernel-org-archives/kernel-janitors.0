From: "H. Peter Anvin" <hpa@zytor.com>
Date: Fri, 24 Sep 2004 21:26:56 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm2] Create new function to
Message-Id: <41549120.2060509@zytor.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47522629712077163=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2480000.1095978400@w-hlinder.beaverton.ibm.com> <20040924200231.A30391@infradead.org> <20040924211912.GC7619@kroah.com>
In-Reply-To: <20040924211912.GC7619@kroah.com>
To: Greg KH <greg@kroah.com>
Cc: Christoph Hellwig <hch@infradead.org>, Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, davej@codemonkey.org.uk

--===============47522629712077163==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Greg KH wrote:
> 
> Good idea, but do you see any places in the kernel that would use those
> fields, instead of always setting them to PCI_ANY_ID?
> 

Does it matter what it is currently used for?  It *is* one way you can find 
out about specific board bugs.  I'd think you'd want all of (VID, DID, RID, 
SVID, SID).


	-hpa

--===============47522629712077163==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47522629712077163==--
