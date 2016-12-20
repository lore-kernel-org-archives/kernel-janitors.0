From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 20 Dec 2016 05:44:04 +0000
Subject: Re: [RFC] Question about freeing of resource in 'atlas7_pinmux_probe()', in file 'drivers/pinctrl/si
Message-Id: <24932cf3-0fe2-c71f-231c-c2f05c96a3c9@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <612eedc5-0f28-7a38-abad-4b9573208875@wanadoo.fr>
 <7123e174-cc22-4a76-337c-661ee87994df@mentor.com>
In-Reply-To: <7123e174-cc22-4a76-337c-661ee87994df@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

Le 19/12/2016 à 14:54, Vladimir Zapolskiy a écrit :
> Functionally it looks good, I have two comments though.
> 1) you don't need to revert 151b8c5ba1eb, the commit is a proper fix
>     per se but incomplete, please add your change on top of it,
>
> 2) minimizing the lines of code by removing duplicates is always good,
>     so here a better and complete fix will be like the following one:
>
Hi,

thanks for the feedback and comments.
Patch submitted.

CJ
