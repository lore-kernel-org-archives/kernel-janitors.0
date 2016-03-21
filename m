From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 21 Mar 2016 18:50:13 +0000
Subject: Re: [patch] mfd: lp8788-irq: uninitialized variable in irq handler
Message-Id: <20160321185012.GJ4140@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311081139.GC31887@mwanda>
 <20160321115457.GH4140@x1>
 <20160321123013.GW5273@mwanda>
In-Reply-To: <20160321123013.GW5273@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Milo Kim <milo.kim@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 21 Mar 2016, Dan Carpenter wrote:

> Gar, the truth is I'm never going to remember to capitalize patches for
> you.  No one else has that rule.  Plus the last two times we had this

It's an awesome rule.  Everyone should have that rule. ;)

> discussion the patches I was fixing were not capitalized either.
>=20
> git log -p --author=3D"Dan Carpenter" drivers/mfd | grep Fixes | head
> -n 2

Not sure what you think the output of this command is meant to show,
but I get this:=20

$ git log -p --author=3D"Dan Carpenter" drivers/mfd | grep Fixes | head -n 2
    Fixes: c013f0a56c56 ('mfd: Add pm8xxx irq support')

... which seems to go against your statement.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
