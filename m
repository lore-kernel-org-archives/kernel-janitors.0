From: Jody McIntyre <scjody@modernduck.com>
Date: Tue, 15 Feb 2005 22:03:40 +0000
Subject: [KJ] Re: [PATCH] 18/34: ieee1394/video1394: replace
Message-Id: <20050215220340.GN9231@conscoop.ottawa.on.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============049991104033888512=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050215002049.GH9231@conscoop.ottawa.on.ca>
In-Reply-To: <20050215002049.GH9231@conscoop.ottawa.on.ca>
To: kernel-janitors@vger.kernel.org

--===============049991104033888512==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2005 at 10:18:11AM -0800, Nishanth Aravamudan wrote:

> I am not sure if you have seen some of the discussion (under the
> subject: "[RFC UPDATE PATCH] add wait_event_*_lock() functions and
> comments") on LKML regarding these macros. Does Arnd's proposal to fix
> video1394 seem reasonable? I can throw up a patch, if you'd like to
> test.

I just read it now.  Arnd's suggestion looks like it will work.  I
thought of something similar while reading the thread and his code looks
correct.  If you have time to make a patch, I'll find some video1394
users to test it.

Thanks,
Jody

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

--===============049991104033888512==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============049991104033888512==--
