From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Nov 2005 06:58:47 +0000
Subject: [KJ] Re: [PATCH] drivers/char: Use ARRAY_SIZE macro
Message-Id: <20051118065847.GA7542@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30786118905973803=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051117151243.08b30e29.akpm@osdl.org>
In-Reply-To: <20051117151243.08b30e29.akpm@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============30786118905973803==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-11-18 at 00:12:43 +0100, Andrew Morton <akpm@osdl.org> wrote:
> The second change here in stallion.c seems wrong.
> 
> I replaced it with
> 
> 	if (i == ARRAY_SIZE(stl_brdstr)) {
> 		printk("STALLION: unknown board name, %s?\n", argp[0]);
> 		return 0;
> 	}

Oh sure! Don't know what hit me there. :-/ Thanks for correcting.

--===============30786118905973803==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30786118905973803==--
