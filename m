From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 08 Oct 2020 10:52:45 +0000
Subject: Re: [PATCH][next] ath11k: fix memory leak of 'combinations'
Message-Id: <20201008105245.EB687C43382@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006174225.545919-1-colin.king@canonical.com>
In-Reply-To: <20201006174225.545919-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the error return path when 'limits' fails to allocate
> does not free the memory allocated for 'combinations'. Fix this
> by adding a kfree before returning.
>=20
> Addresses-Coverity: ("Resource leak")
> Fixes: 2626c269702e ("ath11k: add interface_modes to hw_params")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Alex already sent an identical patch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next=
.git/commit/?id=8431350eee2e27ae60f5250e0437ab298329070e

Patch set to Superseded.

--=20
https://patchwork.kernel.org/patch/11819025/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes
