From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 Jan 2016 13:05:13 +0000
Subject: Re: [patch -next] ath9k: fix ath9k_hw_nvram_check_version()
Message-Id: <87wprlk0ae.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151219105919.GB3749@mwanda>
In-Reply-To: <20151219105919.GB3749@mwanda> (Dan Carpenter's message of "Sat,
	19 Dec 2015 13:59:19 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> There is a type bug so it always returns success.
>
> Fixes: 6fa658fd5ab2 ('ath9k: Simplify and fix eeprom endianness swapping')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to ath.git, thanks.

-- 
Kalle Valo
