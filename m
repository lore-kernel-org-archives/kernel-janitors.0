From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 20 Jan 2005 15:36:02 +0000
Subject: Re: [KJ] [PATCH] unified spinlock initialization
Message-Id: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26628993567068693=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26628993567068693==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 08:56:18PM +0530, Amit Gud wrote:
> Unify the spinlock initialization as far as possible.

Why would you want to replace a statically initialised spinlock with
one that's initialised at runtime?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============26628993567068693==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26628993567068693==--
