From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Sun, 19 Aug 2012 10:07:46 +0000
Subject: Re: [PATCH 1/5] drivers/net/wireless/ipw2x00/ipw2100.c: introduce missing initialization
Message-Id: <CA++WF2Np75wKXV-2C-FR2vhzcPvMu+z5MixcPy4ajOdHM0K88Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345325159-7365-1-git-send-email-Julia.Lawall@lip6.fr>
	<CA++WF2MmTe6WP6MQRV-v1VwkpcUrw4hU6yh79NdG-K4snzQkbg@mail.gmail.com>
	<alpine.DEB.2.02.1208191149400.2031@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1208191149400.2031@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 19 August 2012 13:49, Julia Lawall <julia.lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The result of one call to a function is tested, and then at the second call
> to the same function, the previous result, and not the current result, is
> tested again.
>
> Also changed &bssid to bssid, at the suggestion of Stanislav Yakovlev.
>
> The semantic match that finds the first problem is as follows:
>
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression ret;
> identifier f;
> statement S1,S2;
> @@
>
> *ret = f(...);
> if (\(ret != 0\|ret < 0\|ret = NULL\)) S1
> ... when any
> *f(...);
> if (\(ret != 0\|ret < 0\|ret = NULL\)) S2
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
> v2: changed &bssid to bssid
>

Thank you, Julia.

Stanislav.
