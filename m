From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 20 Aug 2012 09:15:53 +0000
Subject: Re: [alsa-devel] [PATCH 0/10] fix error return code
Message-Id: <alpine.DEB.2.02.1208201115050.1922@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345359780-18647-1-git-send-email-Julia.Lawall@lip6.fr>
 <s5hobm6q6h0.wl%tiwai@suse.de>
In-Reply-To: <s5hobm6q6h0.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>

On Mon, 20 Aug 2012, Takashi Iwai wrote:

> At Sun, 19 Aug 2012 09:02:51 +0200,
> Julia Lawall wrote:
>>
>> These patches fix cases where the return code appears to be unintentially
>> nonnegative.
>
> The patch 10/10 seems missing.  Or are all 9 patches?  The patch
> number suddenly changes to X/9 from 4.
>
> In anyway, the patches 3, 5, 6, 7, 8 and 9 are applied.
> I leave patches 1, 2 and 4 to Mark.

Sorry, I thought I fixed that, but I guess not enough.  Patches 4 and 5 
were the same originally.  There is no patch 10.

julia
