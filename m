From: Jody McIntyre <scjody@modernduck.com>
Date: Tue, 15 Feb 2005 00:42:37 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050215004237.GI9231@conscoop.ottawa.on.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43960693559030406=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============43960693559030406==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 04:32:09PM -0800, Nishanth Aravamudan wrote:
> [...]
> 
> I will look into it, but from a cursory glance, the #if 1 case uses
> locking around the sleep, which is currently not supported by
> wait_event*(). I have sent a patch to LKML regarding this issue and the
> need, perhaps, for alternative wait_event*() style functions, such as
> ones that accept locks as parameters.

In my copy, it _unlocks_ around the sleep.  I don't see why this
couldn't be done with wait_event_interruptible (unlock, wait, lock).
Can you produce a patch with that?  I'll find a video1394 user to test
it.

Thanks,
Jody

> 
> Any suggestions?
> 
> Thanks,
> Nish
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

--===============43960693559030406==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43960693559030406==--
