From: Matthew Wilcox <willy@debian.org>
Date: Mon, 14 Jun 2004 19:22:27 +0000
Subject: Re: [Kernel-janitors] check_region TODO?
Message-Id: <20040614192227.GD20511@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99394760553116779=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406141906.i5EJ6IoP000052@sirius.cs.pdx.edu>
In-Reply-To: <200406141906.i5EJ6IoP000052@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============99394760553116779==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 14, 2004 at 12:06:18PM -0700, Kristen Carlson wrote:
> Hello, 
> Is anyone working on the "replace check_region() with request_region()" task?
> Thanks,
> Kristen

Various people are.  It's not trivial which means the best way to work
on it is to pick a driver, grok its init sequence in fullness, rewrite
it and submit it.  Search the archives for people who've failed to
understand what they were doing and the explanations they were given.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============99394760553116779==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99394760553116779==--
