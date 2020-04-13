From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Apr 2020 06:56:10 +0000
Subject: Re: [PATCH] net: mvneta: Fix a typo
Message-Id: <eea1b700-4559-c8d1-1960-1858ed3d90ef@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
 <6ecfa6cb686af1452101c0b727c9eb34d5582610.camel@perches.com>
In-Reply-To: <6ecfa6cb686af1452101c0b727c9eb34d5582610.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, thomas.petazzoni@bootlin.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 12/04/2020 à 23:35, Joe Perches a écrit :
> On Sun, 2020-04-12 at 23:20 +0200, Christophe JAILLET wrote:
>> s/mvmeta/mvneta/
> nice. how did you find this?


Hi,

This is based on a bash script I've made a while ago (see [1])
I've slightly updated it, but the idea is still the same. I search 
strings in a file with some variation on the file name (2 inverted 
chars, 1 missing char or 1 modified char).

The output is horrible, and a lot of filtering should be done.
It is much like noise, with MANY false positives. But I manage to dig 
some interesting stuff out of it.

If interested in the updated script, just ask, but except the concept 
itself, I'm not sure than anything else worth anything and is should be 
rewritten from scratch.

The update includes some tweaks in order to search into Kconfig files 
instead.

CJ

[1]: https://marc.info/?l=kernel-janitors&m6382201306781&w=4
