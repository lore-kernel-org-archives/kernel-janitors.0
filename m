From: "Luiz Fernando N. Capitulino" <lcapitulino@prefeitura.sp.gov.br>
Date: Wed, 07 Jul 2004 21:11:11 +0000
Subject: Re: [Kernel-janitors] [PATCH] IO-APIC debug message reducti
Message-Id: <20040707211111.GA744@lorien.prodam>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71530957358107905=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1089145628.2957.9.camel@tigger>
In-Reply-To: <1089145628.2957.9.camel@tigger>
To: kernel-janitors@vger.kernel.org

--===============71530957358107905==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Em Wed, Jul 07, 2004 at 02:03:13PM -0700, Randy.Dunlap escreveu:

| | > > +static int ioapic_verbosity = 0;
| | > > +
| | >
| | > no need to init static variables to zero, not doing so has the 
| | > advantage of moving this variable to the .bss kernel section.
| | 
| | Does this mean it will get set to zero automagically or must it
| | be set explicitly in the code?
| 
| The BSS section of data is cleared to zero by kernel init...

 also, static and global variables are set to zero by the compiler,
right ?

-- 
Luiz Fernando N. Capitulino
<http://www.telecentros.sp.gov.br>

--===============71530957358107905==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71530957358107905==--
