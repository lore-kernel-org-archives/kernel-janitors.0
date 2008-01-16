From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 16 Jan 2008 16:12:43 +0000
Subject: Re: [PATCH 3/6] drivers/char/keyboard.c: clean up remove
Message-Id: <20080116111208.ZZRA012@mailhub.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br> <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br> <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br> <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-4-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francisco Alecrim <francisco.alecrim@indt.org.br>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, hcegtvedt@atmel.com

On Fri, Dec 14, 2007 at 02:56:47PM -0400, Francisco Alecrim wrote:
> Remove duplicated headers in drivers/char/keyboard.c:
> drivers/char/keyboard.c: linux/consolemap.h is included more than once.
> 
> Signed-off-by: Francisco Alecrim <francisco.alecrim@indt.org.br>

Applied, thank you Francisco.

-- 
Dmitry
