From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2015 18:28:22 +0000
Subject: Re: [patch RESEND] atp870u: 64 bit bug in atp885_init()
Message-Id: <20151209182822.GC5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55B9CA3B.1030205@suse.de>
 <20151209102453.GE3173@mwanda>
 <20151209115339.46a09d94@lxorguk.ukuu.org.uk>
 <20151209134512.GA5177@mwanda>
 <20151209141459.41a237c9@lxorguk.ukuu.org.uk>
 <20151209174819.GB5177@mwanda>
 <alpine.DEB.2.10.1512091907590.2491@hadrien>
In-Reply-To: <alpine.DEB.2.10.1512091907590.2491@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, "James E.J. Bottomley" <JBottomley@odin.com>, Ondrej Zary <linux@rainbow-software.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hannes Reinecke <hare@suse.com>

On Wed, Dec 09, 2015 at 07:11:15PM +0100, Julia Lawall wrote:
> Forgive my ignorance, but what is the exact procedure?  For example, the
> following file: drivers/pcmcia/vrc4173_cardu.c contains the following
> code: INIT_WORK(&socket->tq_work, cardu_bh, socket);.  The last time
> INIT_WORK took three arguments was Linux 2.6.19, so I think no one has
> been compiling this code recently.  There would be the .c file and the
> associated .h file to move to staging, but it's less clear to me eg what
> to do with the Kconfig entry and the Makefile entry.  And is there
> anything else to take into account?

You should just delete that code along with the Kconfig and Makefile
entries.  Don't bother moving it to staging.  The move to staging is
supposed to give people one last chance to yell if they absolutely need
the code.  No one has compiled this code for years so no one will miss
it.

regards,
dan carpenter

