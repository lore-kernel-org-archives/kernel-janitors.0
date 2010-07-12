From: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Date: Mon, 12 Jul 2010 14:51:49 +0000
Subject: Re: [PATCH] adm8211: fix memory leak
Message-Id: <20100712145149.GA2273@tux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278764938-9417-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278764938-9417-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Michael Wu <flamingice@sourmilk.net>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kalle.valo@iki.fi>, Luis Rodriguez <Luis.Rodriguez@Atheros.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Sat, Jul 10, 2010 at 05:28:57AM -0700, Kulikov Vasiliy wrote:
> We must free priv->eeprom allocated in adm8211_read_eeprom().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Acked-by: Luis R. Rodriguez <lrodriguez@atheros.com>

Good catch.

  Luis
