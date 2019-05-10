From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 10 May 2019 10:25:27 +0000
Subject: Re: [PATCH][V2] reset: remove redundant null check on pointer dev
Message-Id: <1557483927.7859.3.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190510095832.28233-1-colin.king@canonical.com>
         <CAMpxmJWyVZ2hHE=1tu5NgSzEHZKD2pBo8KUXg1CLUaB-WX4KHQ@mail.gmail.com>
In-Reply-To: <CAMpxmJWyVZ2hHE=1tu5NgSzEHZKD2pBo8KUXg1CLUaB-WX4KHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2019-05-10 at 12:14 +0200, Bartosz Golaszewski wrote:
> pt., 10 maj 2019 o 11:58 Colin King <colin.king@canonical.com> napisa=C5=
=82(a):
> >=20
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > Pointer dev is being dereferenced when passed to the inlined
> > functon dev_name, however, dev is later being null checked
> > so at first this seems like a potential null pointer dereference.
> >=20
> > In fact, _reset_control_get_from_lookup is only ever called from
> > __reset_control_get, right after checking dev->of_node hence
> > dev can never be null.  Clean this up by removing the redundant
> > null check.
> >=20
> > Thanks to Philipp Zabel for spotting that dev can never be null.
> >=20
> > Addresses-Coverity: ("Dereference before null check")
> > Fixes: 6691dffab0ab ("reset: add support for non-DT systems")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thank you both, applied to reset/fixes.

regards
Philipp
