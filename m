From: Richard Weinberger <richard@nod.at>
Date: Wed, 08 Jul 2015 19:19:47 +0000
Subject: Re: [PATCH] um: umid: Use strdup to simplify code
Message-Id: <559D77D3.3030906@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436382947-13181-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436382947-13181-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jdike@addtoit.com
Cc: user-mode-linux-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Am 08.07.2015 um 21:15 schrieb Christophe JAILLET:
> Replace a malloc+strcpy by an equivalent strdup in order to improve
> readability.

Makes sense!

> Turn a some spaces into a tab to be consistent with the rest of the code.

Do this in an extra patch. One logical change per patch please.

Thanks,
//richard
