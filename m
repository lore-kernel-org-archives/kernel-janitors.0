From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Sep 2005 23:29:01 +0000
Subject: Re: [KJ] [PATCH 4/4] drivers/video: Replace custom macro with
Message-Id: <20050910232901.GA32299@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72984978083253971=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050910122113.GE1218@neon.tklauser.home>
In-Reply-To: <20050910122113.GE1218@neon.tklauser.home>
To: kernel-janitors@vger.kernel.org

--===============72984978083253971==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 10, 2005 at 02:21:13PM +0200, Tobias Klauser wrote:
> Replace the custom CHAR_IS_NUM() macro with isdigit() from
> <linux/ctype.h>

> --- linux-2.6.13/drivers/video/pm3fb.c
> +++ linux-2.6.13~macro_removal/drivers/video/pm3fb.c

Marked as BROKEN for [checks bkbits] 25 months. I'd ask if anybody have
plans to ressurect it RSN, then rm -f.


--===============72984978083253971==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72984978083253971==--
