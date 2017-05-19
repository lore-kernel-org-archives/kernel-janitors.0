From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 19 May 2017 07:52:27 +0000
Subject: Re: ath5k: fix memory leak on buf on failed eeprom read
Message-Id: <31364cad256e4b409906f66efd7dd6d0@euamsexm01a.eu.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503142600.32609-1-colin.king@canonical.com>
In-Reply-To: <20170503142600.32609-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, "Luis R . Rodriguez" <mcgrof@do-not-panic.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The AR5K_EEPROM_READ macro returns with -EIO if a read error
> occurs causing a memory leak on the allocated buffer buf. Fix
> this by explicitly calling ath5k_hw_nvram_read and exiting on
> the via the freebuf label that performs the necessary free'ing
> of buf when a read error occurs.
> 
> Detected by CoverityScan, CID#1248782 ("Resource Leak")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to ath-next branch of ath.git, thanks.

8fed6823e06e ath5k: fix memory leak on buf on failed eeprom read

-- 
https://patchwork.kernel.org/patch/9709935/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

