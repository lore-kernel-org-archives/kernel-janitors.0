From: Matthew Wilcox <willy@debian.org>
Date: Tue, 27 Jul 2004 02:50:39 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/ewrk3: replace schedule_timeout()
Message-Id: <20040727025039.GA6171@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31998414320491819=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727000221.GL1897@us.ibm.com>
In-Reply-To: <20040727000221.GL1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============31998414320491819==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2004 at 05:02:21PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.

Seems like it should produce identical results to me.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============31998414320491819==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31998414320491819==--
