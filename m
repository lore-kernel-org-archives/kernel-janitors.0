From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Sep 2012 09:48:25 +0000
Subject: Re: [wireless:master 39/40] drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:2987
Message-Id: <20120911094825.GT19396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911091537.GA29599@localhost>
In-Reply-To: <20120911091537.GA29599@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 11, 2012 at 05:15:37PM +0800, Fengguang Wu wrote:
>   drivers/net/wireless/ath/ath9k/ar9003_eeprom.c:3372 ath9k_hw_ar9300_fill_eeprom() Error invalid range 4096 to -1

Sorry for this false positive.  I had it fixed in my tree but didn't
push.  It's pushed now.

regards,
dan carpenter
