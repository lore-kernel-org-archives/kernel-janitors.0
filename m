From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 18 Jan 2005 15:03:53 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050118150353.GQ30982@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============076726291071638197=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============076726291071638197==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2005 at 03:03:37AM -0200, Arnaldo Carvalho de Melo wrote:
> I suggest not removing the "finished stuff", just move them to a "finished
> as of 2.6.something", as these cases may well come back in the future, say
> when something big like infiniband gets merged it can come packed with
> those "finished" things 8)

Funny you should mention that.

drivers/infiniband/ulp/ipoib/ipoib_ib.c:                yield();
drivers/infiniband/ulp/ipoib/ipoib_ib.c:                yield();

*SLAP*.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============076726291071638197==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============076726291071638197==--
