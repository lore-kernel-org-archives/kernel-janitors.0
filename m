From: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Date: Mon, 26 Apr 2010 23:05:15 +0000
Subject: Re: [patch] gpio: potential null dereference
Message-Id: <20100426230515.GA1388@emlix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100426192520.GU29093@bicker>
In-Reply-To: <20100426192520.GU29093@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jani Nikula <ext-jani.1.nikula@nokia.com>, David Brownell <dbrownell@users.sourceforge.net>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 26, 2010 at 09:25:20PM +0200, Dan Carpenter wrote:
> Smatch found a potential null dereference in gpio_setup_irq().  The=20
> "pdesc" variable is allocated with idr_find() that can return NULL.  If
> gpio_setup_irq() is called with 0 as gpio_flags and "pdesc" is null, it
> would OOPs here.

idr_find() doesn't allocate, idr_get_new_above() does.
Assuming idr_find() never fails for an id if idr_get_new_above()
successfully allocated that id, I don't think we can reach that
line with pdesc being NULL:

- There are two gotos leading to free_sd
- #2 is after a block that allocates pdesc
- #1 is in an if (!gpio_flags) block
- We exit early if ((desc->flags & GPIO_TRIGGER_MASK) =3D gpio_flags)
- Therefore (desc->flags & GPIO_TRIGGER_MASK) must be !=3D 0 to reach #1
- Trigger flags are added to desc->flags only after we have
  successfully allocated pdesc (i.e. right before return 0)
- We start off with no trigger flags set

  Daniel


--=20
Dipl.-Math. Daniel Gl=F6ckner, emlix GmbH, http://www.emlix.com
Fon +49 551 30664-0, Fax -11, Bahnhofsallee 1b, 37081 G=F6ttingen, Germany
Sitz der Gesellschaft: G=F6ttingen, Amtsgericht G=F6ttingen HR B 3160
Gesch=E4ftsf=FChrung: Dr. Uwe Kracke, Ust-IdNr.: DE 205 198 055

emlix - your embedded linux partner
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
