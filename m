From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 24 Sep 2004 18:44:44 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 28/38] net/pcnet32: replace
Message-Id: <20040924184444.GF16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96359463593555872=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040924180825.GH1757@us.ibm.com>
In-Reply-To: <20040924180825.GH1757@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============96359463593555872==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 11:40:42AM -0700, Nishanth Aravamudan wrote:
> > >      if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ)))
> > >      data = (u32)(MAX_SCHEDULE_TIMEOUT / HZ);
> > 	if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / 1000))
> > 		data = (u32)(MAX_SCHEDULE_TIMEOUT / 1000)
> I agree - the tabbing in that whole driver is non-standard (looks to be
> 4 spaces). And some places simply aren't tabbed like this one.

It wasn't the tabbing, but the divisor that I was complaining about.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============96359463593555872==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96359463593555872==--
