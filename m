From: Christophe Lucas <clucas@rotomalug.org>
Date: Sun, 15 May 2005 07:44:44 +0000
Subject: [KJ] Re: [PATCH] typo patch on v850e_uart.c
Message-Id: <20050515074444.GA32190@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============050321634802090287=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc339e4a0505130050283b5291@mail.gmail.com>
In-Reply-To: <fc339e4a0505130050283b5291@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============050321634802090287==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Miles Bader (snogglethorpe@gmail.com) wrote:
> On 5/13/05, Christophe Lucas <clucas@rotomalug.org> wrote:
> > > Oh, I see it actually removes a blank line which contains a form-feed
> > > character.  Same difference though:  it isn't a typo.
> > 
> > Oh sorry, it is not always easy for a french man to have the right word.
> 
> Er, I guess I'm not making my point well.  It's not the description
> that's the problem, it's the patch.  I put the ^L there on purpose, I
> don't want it to be removed unless there's a good reason, and your
> mail didn't give a good reason.
> 
> If there _is_ a good reason (e.g., "Linus declares he hates ^L and
> wants them all removed"), then please send it with the patch;
> otherwise, please drop this patch.

Ok, sorry to have wasted your time. Patch dropped.

Have fun,

	~Christophe


--===============050321634802090287==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============050321634802090287==--
