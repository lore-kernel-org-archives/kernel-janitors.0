From: Marek Lindner <lindner_marek@yahoo.de>
Date: Sun, 12 Sep 2010 19:57:38 +0000
Subject: Re: [PATCH] staging: batman-adv: check kmalloc() return value
Message-Id: <201009122157.40497.lindner_marek@yahoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317791-4744-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317791-4744-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Lunn <andrew@lunn.ch>, Sven Eckelmann <sven.eckelmann@gmx.de>, Simon Wunderlich <siwu@hrz.tu-chemnitz.de>, Andreas Langer <an.langer@gmx.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sunday 12 September 2010 20:56:26 Vasiliy Kulikov wrote:
> kmalloc() may fail, if so drop current packet.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Looks good to me. Added this patch to our repos.

Thanks,
Marek
