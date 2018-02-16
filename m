From: Richard Cochran <richardcochran@gmail.com>
Date: Fri, 16 Feb 2018 15:53:45 +0000
Subject: Re: [PATCH][next] net: dsa: mv88e6xxx: avoid unintended sign extension on a 16 bit shift
Message-Id: <20180216155345.zlgmmna7u47xgb36@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215191218.27936-1-colin.king@canonical.com>
 <20180215202757.GB3080@lunn.ch>
In-Reply-To: <20180215202757.GB3080@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 15, 2018 at 09:27:57PM +0100, Andrew Lunn wrote:
> Do you prefer this, or making timehi and timelo a u64?

The latter.

While you are at it, please move the definition of 'ns' to the start
of the function.

Thanks,
Richard
