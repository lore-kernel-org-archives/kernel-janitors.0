From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 19 Feb 2018 17:37:14 +0000
Subject: Re: [PATCH][V2] net: dsa: mv88e6xxx: avoid unintended sign extension on a 16 bit shift
Message-Id: <20180219173714.6frfl3nfq3gi4jsv@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180216165505.20058-1-colin.king@canonical.com>
 <a97bab4dc79c4b7da76826843909cae9@AcuMS.aculab.com>
In-Reply-To: <a97bab4dc79c4b7da76826843909cae9@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Colin King' <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Feb 19, 2018 at 12:19:16PM +0000, David Laight wrote:
> This seems to be somewhat excessive 64bit maths on a 32bit system.
> It is more than enough to make timelo/timehi 'unsigned int'.

Do you see a difference in the generated code?

Thanks,
Richard
