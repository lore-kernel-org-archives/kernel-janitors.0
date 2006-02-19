From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sun, 19 Feb 2006 06:32:23 +0000
Subject: Re: [KJ][Patch] remove implicit sign bit in msp3400.h
Message-Id: <1140330744.7778.11.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67825184967610141=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139380004.9409.40.camel@localhost.localdomain>
In-Reply-To: <1139380004.9409.40.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============67825184967610141==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2006-02-18 at 15:33 +0300, Alexey Dobriyan wrote:
> On Thu, Feb 09, 2006 at 11:15:31PM +1100, Darren Jenkins" wrote:
> > Weird if you ask me. I'm pretty sure the C standard says they are
> > promoted to an int for calculations.
> 
> It's very logical.
> 
> 	int a:1;
> 
> means 1 bit for sign (it's int) + >=1 bit for absolute value (it's int).
> So, >=2 bits you should somehow fit into 1 bit.
> 
> 	int	   |	unsigned int   |
> -------------------+-------------------+---
> doesn't make sense |	     OK	       |:1
> 	OK	   |	     OK	       |:2
> 	OK	   |	     OK	       |:3
> 			...
> 
> I guess C standard says "undefined behaviour" or "implementation-defined".
Yep, that's how I understand it.

What I thought was weird was that the common coding style in the kernel
was to include the int, when it is implicit. Where the rest of the style
in the kernel seems to be to remove anything that is implicit. 
Just an observation.

> BTW, someone could do
> 
> 	int a:1;
> 	if (a < 0)
> 
> so every time type is flipped, submitter should check every usage of "a".
> 

I did not think of that kind of usage. Will check it in future.

Darren J.


--===============67825184967610141==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67825184967610141==--
