From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Wed, 05 Sep 2012 22:29:46 +0000
Subject: Re: [PATCH] ASoC: wm0010: Fix warning, use format %zu for type size_t
Message-Id: <20120905222945.GD10580@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346876544-24514-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1346876544-24514-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Emil Goode <emilgoode@gmail.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, lrg@ti.com

On Wed, Sep 05, 2012 at 10:22:24PM +0200, Emil Goode wrote:
> Fix warning by using format specifier %zu for type size_t
> 
> Sparse warning:
> sound/soc/codecs/wm0010.c:411:2: warning:
>         format ‘%d’ expects argument of type ‘int’,
>         but argument 4 has type ‘size_t’ [-Wformat]

Applied, thanks.
