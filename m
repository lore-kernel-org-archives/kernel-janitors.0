From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 11 Jul 2004 10:19:36 +0000
Subject: Re: [Kernel-janitors] Re: sb1000.c::nicedelay() (msleep)
Message-Id: <20040711101936.GA10133@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11324193491666712=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0407082005410.5353@monarch.fast.net>
In-Reply-To: <Pine.LNX.4.58.0407082005410.5353@monarch.fast.net>
To: kernel-janitors@vger.kernel.org

--===============11324193491666712==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 08 Jul 2004, Steven N. Hirsch wrote:

> On Thu, 8 Jul 2004, Nishanth Aravamudan wrote:
> 
> > So, this function (drivers/net/sb1000.c::nicedelay()) takes as parameter some
> > value in usecs (which is also the name of the parameter). Then, it sleeps for
> > 1 second (schedule_timeout(HZ)) regardless of the parameter. Is this desired?
> > If so, I will replace the calls (all 3 of them) with msleep(). Or, should the
> > passed in values (60000, 30000 and 200000) actually be being used and not
> > ignored? Thanks.
> 
> Are these cards still being used?  I switched to 2-way cable almost (3) 
> years ago and haven't looked back.  

there is no active MAINTAINER listed,
but the cards were widespread and the driver received fixes for 2.6,
you may want to ask your question on linux-net@vger.kernel.org.

a++ maks



--===============11324193491666712==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11324193491666712==--
