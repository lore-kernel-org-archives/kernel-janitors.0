From: Luciano Coelho <coelho@ti.com>
Date: Wed, 24 Aug 2011 14:18:41 +0000
Subject: Re: [patch -next] wl12xx: fix recent change to
Message-Id: <1314195521.2296.204.camel@cumari>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110824113139.GE5975@shale.localdomain>
In-Reply-To: <20110824113139.GE5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Shahar Levi <shahar_levi@ti.com>, "John W. Linville" <linville@tuxdriver.com>, "open list:WL1271 WIRELESS D..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, 2011-08-24 at 14:31 +0300, Dan Carpenter wrote:=20
> bc765bf3b9a "wl12xx: 1281/1283 support - Loading FW & NVS" had two
> problems.  The condition was written so that it failed if "len" was
> not equal to sizeof(struct wl1271_nvs_file).  Also we need to release
> the locks on these new error paths.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks for your patch.  But we have just removed this function, since
the implementation was broken and the feature is not really used
anymore.

The patch that removes this function entirely is already queued for
inclusion on the 3.1-rc series:

http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless.git;a=3Dcommi=
t;h=80900d0140a7648587982c8f299830e900e49165


--=20
Cheers,
Luca.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
