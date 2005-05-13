From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 13 May 2005 08:04:36 +0000
Subject: [KJ] Re: [PATCH] typo patch on v850e_uart.c
Message-Id: <20050513080436.GC3365@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54643606021072122=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc339e4a0505130050283b5291@mail.gmail.com>
In-Reply-To: <fc339e4a0505130050283b5291@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============54643606021072122==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Miles Bader (snogglethorpe@gmail.com) wrote:
> On 5/13/05, Christophe Lucas <clucas@rotomalug.org> wrote:
> > Description:
> > Little patch on typo problem.
> 
> I'm confused -- your patch appears to simply remove a blank line.
> 
> The blank line it removes is not a typo, it was put there intentionally.

It is not only one blank line.

	http://lxr.linux.no/source/drivers/serial/v850e_uart.c#L52

I have remove one "^L".

Have a nice day,

	~Christophe

PS: Sorry for the noise if this patch has no sens :)


--===============54643606021072122==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54643606021072122==--
