From: Adrian Bunk <bunk@fs.tum.de>
Date: Wed, 19 May 2004 18:46:49 +0000
Subject: Re: [Kernel-janitors] Re: remove old ifdef'd code from
Message-Id: <20040519184649.GC24287@fs.tum.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6939422611243895=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040517173832.GB5034@nd47>
In-Reply-To: <20040517173832.GB5034@nd47>
To: kernel-janitors@vger.kernel.org

--===============6939422611243895==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 17, 2004 at 07:38:32PM +0200, Domen Puncer wrote:
>...
> > b.  comments like "I built and loaded it.  Don't have hardware
> > 	to test it."
> 
> I usually just 'make ... .o', is that enough, or should i compile it as
> module and/or in-kernel?
>...

At least one of these two (in the modular case including a "make 
modules_install") should suffice.

> 	Domen

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============6939422611243895==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6939422611243895==--
