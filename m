From: Michal Marek <mmarek@suse.cz>
Date: Wed, 29 Sep 2010 15:03:29 +0000
Subject: Re: [PATCH] Documentation/kbuild: correct variable definitions in
Message-Id: <4CA35541.9090106@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284964412-32211-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1284964412-32211-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 20.9.2010 08:33, matt mooney wrote:
> Change $(src) and $(obj) definitions to state the path as absolute and
> not relative.

It _is_ a relative patch, AFAICS. What makes you think otherwise?

BTW, I applied your patches to modules.txt, thanks for them.

Michal
