From: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Date: Mon, 27 Apr 2020 11:50:23 +0000
Subject: Re: [PATCH v4] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <8518467.FNpd3NTrYF@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200425113234.GA14492@blackclown>
In-Reply-To: <20200425113234.GA14492@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Saturday 25 April 2020 13:32:34 CEST Suraj Upadhyay wrote:
> Break lines with length over 80 characters to
> conform to the linux coding style and refactor
> wherever necessary.
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>=20
> Changes in v4:
> 	- Added a space after declaration in wfx_get_hw_rate().
> 	- A checkpatch warning for this commit is retained at line 75,
> 	  to maintain uniformity in function declarations. (Reviewer
> 	  jerome suggested).
>=20
> Changes in v3:
>         - Changed the temporary variable name for the memzcmp statement
>           to is_used. (as suggested).
>         - Added a temporary ieee80211_supported_band variable to address
>           the problem in wfx_get_hw_rate() more efficiently. (not
>           suggested, but still).
>=20
> Changes in v2:
>         - Introduced a temporary variable for the memzcmp statement.
>         - Addressed the checkpatch problem with wfx_get_hw_rate().
>         - Restored the function definition of wfx_tx_get_tx_parms
>           as suggested by the reviewer.
>         - Added suggested changes for req->packet_id statement.
>=20
>  drivers/staging/wfx/data_tx.c | 40 +++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 14 deletions(-)

This patch does not contain the suggestions from Dan. However, it is
sufficient from my personal point of view.

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>


--=20
J=E9r=F4me Pouiller
