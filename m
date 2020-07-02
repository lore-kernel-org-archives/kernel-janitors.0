From: Guilherme Piccoli <gpiccoli@canonical.com>
Date: Thu, 02 Jul 2020 14:40:51 +0000
Subject: Re: [PATCH] md: raid0/linear: fix dereference before null check on pointer mddev
Message-Id: <CAHD1Q_yy2gbBkd31oOJiJk2TU3K4wTV3gVtjLiQo1FW+e=5ivg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200702113502.37408-1-colin.king@canonical.com>
In-Reply-To: <20200702113502.37408-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Song Liu <song@kernel.org>, NeilBrown <neilb@suse.de>, linux-raid <linux-raid@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Great catch Colin, thanks!
Feel free to add my:

Reviewed-by: Guilherme G. Piccoli <gpiccoli@canonical.com>


P.S.  Not sure if it's only me, but the diff is soo much easier to
read when git is set to use patience diff algorithm:
https://termbin.com/f8ig
