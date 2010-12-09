From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 09 Dec 2010 16:14:20 +0000
Subject: Re: [PATCH] rtc-bfin: Remove redundant unlikely()
Message-Id: <AANLkTikXBWjO2rvvwmKKN33_tKDPdZ_G51PF5Xgf+Uru@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291906126-475-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1291906126-475-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Dec 9, 2010 at 09:48, Tobias Klauser wrote:
> IS_ERR() already implies unlikely(), so it can be omitted here.

sounds like something that checkpatch.pl could look for ...

> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
