From: Jody McIntyre <scjody@modernduck.com>
Date: Thu, 03 Mar 2005 22:07:52 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050303220752.GS1111@conscoop.ottawa.on.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78823622284816963=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============78823622284816963==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 22, 2005 at 09:37:33AM -0800, Nishanth Aravamudan wrote:
> On Tue, Feb 22, 2005 at 12:29:02PM -0500, Jody McIntyre wrote:
> > Please add a Signed-off-by: line.
> 
> Will do, I just wanted to get you a patch to test first. If it works,
> I'll send an "official" one :)

It's been over a week and nobody's reported any problems with your
patch.  Please send an "official" one and I will apply it.

Thanks,
Jody

> 
> > (more comments below)
> 
> <snip>
> 
> > > +			if (signal_pending(current)) {
> > 
> > Extra {.
> 
> Whoops, thanks for the catch. Let us know how the testing goes...
> 
> -Nish
> 
> 
> -------------------------------------------------------
> SF email is sponsored by - The IT Product Guide
> Read honest & candid reviews on hundreds of IT Products from real users.
> Discover which products truly live up to the hype. Start reading now.
> http://ads.osdn.com/?ad_id=6595&alloc_id=14396&op=click
> _______________________________________________
> mailing list linux1394-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux1394-devel

-- 

--===============78823622284816963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78823622284816963==--
