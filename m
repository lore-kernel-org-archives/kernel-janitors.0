From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 07 Mar 2019 20:18:07 +0000
Subject: Re: [PATCH 10/61] gpio: simplify getting .drvdata
Message-Id: <20190307201807.GA950@kunai>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-11-wsa+renesas@sang-engineering.com>
 <b0c1e303-ca95-8bc8-a5d4-65e75dc8398a@ti.com>
 <CACRpkday+d9iGeX+CRHTEyC=w+oNUK-8oTy0HqugO5PRhHn62w@mail.gmail.com>
 <20180430092947.GC2270@ulmo>
 <CAHCN7xLBa0JxcUs9i6Rr3hUNe5zymfb66icqNK0N3PMo51T-TA@mail.gmail.com>
In-Reply-To: <CAHCN7xLBa0JxcUs9i6Rr3hUNe5zymfb66icqNK0N3PMo51T-TA@mail.gmail.com>
To: Adam Ford <aford173@gmail.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Hoan Tran <hotran@apm.com>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <thierry.reding@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It's been almost a year later, and several Linux revisions, and this
> still seems stuck somewhere/somehow.

I wanted to respin this series once rc1 is released.


--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyBfHsACgkQFA3kzBSg
Kbb87BAAgY8Zdjph2MvnTtWsLVlR20N3tzC48BqMW6+mCkS/GBg4G+shi+L5bN9r
eKruZXQ505sEuRpB/v1PC7QlGJ0Bp5Dk7VVaQolgC7Jx2ubqRYhaW2UWkz3Mr5RO
3yfmDc1jo4B3z7d4Cqyi7qWcFSB2i4hjR/CA6kz0EXC5LcAPTACDSmliFtoZPvQ/
wWbpWQN6kO8JYAluEjxOI+EtQL22fha/FrRKEY91X3yPtIzZYA89ZacOsBlKFBKU
SouRZmq7htq6eatqg7XV4y3X4ZxsOkL0gxWCZiGX4iE9yamM/eF0+6WD6zaVHoKa
W24fFnqyi+yg7sYZ1iNdokb0JHR/sCZJffPjKKD1OnJFjUedXFA1JazIEDfNARyM
/Sh/hrcIb4n6CXe1sQ3YHEZkaLffqICJW+OIEWkUI0kSAbSFnKCVxHVb6F0r/I+Q
PZ3SnruxYHrDWgegpZQkjE9rsZRCkG5KDNZ2fahXW9BUaIXfuWRyzoXaiVW8Matb
vbyKCym1vwq0SxHIGyCqEYK0GBt6Yx9y/JelHChYWyyiKe+g6SLgctFycF8Fn/Fh
sbdGgmrtsg+eIepcAvkw/+fvA3ITCCN0QX9WRzrUjftrG6MRoFni1+ec4nXJkwgI
p+565C1niZxFqf1wRcZT86WxiYI01T0pLi1bKOwunvZ8Riym9b4=
=vuew
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
