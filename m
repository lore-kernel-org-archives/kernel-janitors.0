From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 22 Sep 2004 18:26:33 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.9-rc2-kjt1 rio_linux compile error
Message-Id: <20040922182633.GD20621@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59527165778230184=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040921221307.GG4260@stro.at> <20040922112157.GB27364@fs.tum.de> <20040922162218.GB1924@us.ibm.com>
In-Reply-To: <20040922162218.GB1924@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Adrian Bunk <bunk@fs.tum.de>, kj <kernel-janitors@osdl.org>, linux-kernel@vger.kernel.org

--===============59527165778230184==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 22 Sep 2004, Nishanth Aravamudan wrote:

> On Wed, Sep 22, 2004 at 01:21:58PM +0200, Adrian Bunk wrote:
> > On Wed, Sep 22, 2004 at 12:13:07AM +0200, maximilian attems wrote:
> > >...
> > > added since 2.6.9-rc1-kjt1
> > >...
> > > msleep-drivers_char_rio_linux.patch
> > >   From: Nishanth Aravamudan <nacc@us.ibm.com>
> > >   Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 20/33] char/rio_linux: replace 	schedule_timeout() with msleep()/msleep_interruptible()
> > >...
> > 
> > This doesn't compile (obvious typo):
> 
> Thanks for catching this! Here is the fixed patch:
> 

thanks also fixed in latest kjt.


--===============59527165778230184==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59527165778230184==--
