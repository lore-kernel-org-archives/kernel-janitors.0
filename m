From: Jan Yenya Kasprzak <kas@fi.muni.cz>
Date: Wed, 09 Dec 2009 14:55:55 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use Generic HDLC
Message-Id: <20091209145554.GQ6070@fi.muni.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091209143540.GA9620@vacuum.larces.uece.br>
In-Reply-To: <20091209143540.GA9620@vacuum.larces.uece.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rudy Matela <rudy.matela@gmail.com>
Cc: Krzysztof Halasa <khc@pm.waw.pl>, trivial@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Rudy Matela wrote:
: Added a space separating some if/switch/while keywords from the following
: parenthesis to conform to the CodingStyle.

	Hello,

	I am not sure whether it is necessary to fix formating mistakes in
a driver which is in deep freeze and the hardware is not produced anymore,
but whatever.

Acked-By: Jan "Yenya" Kasprzak <kas@fi.muni.cz>

-Yenya

: Signed-off-by: Rudy Matela <rudy.matela@gmail.com>
: ---
: 
:  drivers/net/wan/cosa.c       |   10 +++++-----
:  drivers/net/wan/hdlc_cisco.c |    8 ++++----
:  drivers/net/wan/hdlc_x25.c   |    4 ++--
:  3 files changed, 11 insertions(+), 11 deletions(-)
: 
: diff --git a/drivers/net/wan/cosa.c b/drivers/net/wan/cosa.c
: index b36bf96..f0bd70f 100644

-- 
| Jan "Yenya" Kasprzak  <kas at {fi.muni.cz - work | yenya.net - private}> |
| GPG: ID 1024/D3498839      Fingerprint 0D99A7FB206605D7 8B35FCDE05B18A5E |
| http://www.fi.muni.cz/~kas/    Journal: http://www.fi.muni.cz/~kas/blog/ |
Please don't top post and in particular don't attach entire digests to your
mail or we'll all soon be using bittorrent to read the list.     --Alan Cox
