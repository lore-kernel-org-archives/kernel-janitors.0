From: Matthew Wilcox <willy@debian.org>
Date: Wed, 07 Jul 2004 20:40:45 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region specialix
Message-Id: <20040707204045.GI27324@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85654397879558142=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============85654397879558142==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2004 at 01:24:39PM -0700, Kristen Carlson wrote:
> Hi, please comment on this patch. It is against 2.6.7
> 
> Description: removes check_region call from specialix.c and cleans
> up some debug print messages and some dead code.
> Signed-off-by: Kristen Carlson Accardi <kristenc@cs.pdx.edu>

Looks good.  As far as I can tell, you removed the only call to
sx_check_io_range(), but didn't remove the function itself.  Doesn't gcc
warn about functions declared static but never called?  Or is this
different because it's also marked inline?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============85654397879558142==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85654397879558142==--
