From: Matthew Wilcox <willy@debian.org>
Date: Tue, 20 Apr 2004 12:09:57 +0000
Subject: Re: [Kernel-janitors] [RFT] Update to the mandocs build target
Message-Id: <20040420120957.GG18329@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47633456079580805=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40831B29.9010108@stillhq.com>
In-Reply-To: <40831B29.9010108@stillhq.com>
To: kernel-janitors@vger.kernel.org

--===============47633456079580805==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2004 at 05:44:19PM +1000, Michael Still wrote:
> Another interesting problem is that of repeated comments. There are 
> places where more than one comment documents a function of a given name. 
> At the moment the last found comment wins. Ultimately it would be nice 
> to audit those comments, and work out why there are repeats (multiple 
> architectures repeating code?).

Architectures should not be including kerneldoc comments.  i386 is and
always has been the refereence platform for Linux and thus is the only
architecture which should have kerneldoc comments.  If there's one thing
worse than having one set of buggy comments, it's having eight sets of
buggy comments, all subtly incompatible.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============47633456079580805==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47633456079580805==--
