From: Hin-Tak Leung <htl10@users.sourceforge.net>
Date: Mon, 04 Dec 2017 22:57:55 +0000
Subject: Re: [PATCH] rtlwifi: rtl818x: remove redundant check for cck_power > 15
Message-Id: <734417985.2789125.1512428275673@mail.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <734417985.2789125.1512428275673.ref@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Larry Finger <Larry.Finger@lwfinger.net>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--------------------------------------------
On Tue, 14/11/17, Colin King <colin.king@canonical.com> wrote:

=20
> From: Colin Ian King <colin.king@canonical.com>
=20
> cck_poweri cannot be greated than 15 as
> is derived from the bottom 4 bits
> from riv->channels[channel -
> 1].hw_value & 0xf.=C2=A0 Hence the check for it
> being greater than 15 is redundant and
> can be removed.
=20
> Detected by CoverityScan, CID#744303
> ("Logically dead code")
=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
=20
Acked-by: Hin-Tak Leung <htl10@users.sourceforge.net>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
