From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 19 Feb 2006 06:58:35 +0000
Subject: Re: [KJ][Patch] remove implicit sign bit in msp3400.h
Message-Id: <20060219065835.GX12822@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2313969605241053=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139380004.9409.40.camel@localhost.localdomain>
In-Reply-To: <1139380004.9409.40.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============2313969605241053==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 18, 2006 at 03:33:12PM +0300, Alexey Dobriyan wrote:
> It's very logical.
> 
> 	int a:1;
> 
> means 1 bit for sign (it's int) + >=1 bit for absolute value (it's int).
> So, >=2 bits you should somehow fit into 1 bit.

Standard 2's-complement representation.  The MSB is negative.  So
instead of the bits meaning 1, 2, 4, 8, 16, 32, 64, 128, the top bit
represents -128.  So the one bit case represents -1.

ie the two values it can have are 0 and -1.

> I guess C standard says "undefined behaviour" or "implementation-defined".

It does ... sort of:

6.7.2:
for bit-fields, it is implementation-defined whether the specifier int
designates the same type as signed int or the same type as unsigned int.

so relying on int to be signed was already broken.

> BTW, someone could do
> 
> 	int a:1;
> 	if (a < 0)
> 
> so every time type is flipped, submitter should check every usage of "a".
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============2313969605241053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2313969605241053==--
