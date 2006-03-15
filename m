From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Mar 2006 07:32:30 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in i82365.c
Message-Id: <20060315073230.GB5620@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77196572199383828=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============77196572199383828==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15.03.2006 [18:02:59 +1100], Darren Jenkins" wrote:
> On Tue, 2006-03-14 at 08:26 -0800, Randy.Dunlap wrote:
> 
> > well.... if you have to make any more changes, add a space after
> > the "< 0)" and before the opening '{'.
> > The "grammar" isn't tough IMO.  Maybe you are just used to not
> > using whitespace?
> 
> White-space lol, I usually use a lot more, but I have never been
> restricted to 80 columns before and I'm not used to using the K&R coding
> style that you old folks all seem to use. :P
> 
> Here is an improved patch. I guess I will start with the style cleanups,
> unless there are anymore problems.

Without looking at the thread, it's now impossible to know what the does
:) Always keep the description tag with each patch you send out.

Thanks,
Nish

--===============77196572199383828==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77196572199383828==--
