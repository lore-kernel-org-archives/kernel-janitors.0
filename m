From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 02 Jan 2012 12:29:57 +0000
Subject: Re: [PATCH 0/10] use devm_ functions
Message-Id: <20120102122957.GL2899@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1325177489-13815-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1325177489-13815-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>

On Thu, Dec 29, 2011 at 05:51:19PM +0100, Julia Lawall wrote:
> The following is a semantic patch (http://coccinelle.lip6.fr/) that
> introduces uses of various devm_ functions.  The main strategy is

Applied all except the jz4740 patch which Axel already did, thanks.
