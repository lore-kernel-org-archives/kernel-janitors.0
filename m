From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Date: Mon, 20 Jul 2009 14:59:24 +0000
Subject: Re: [PATCH 2/10] drivers/gpu/drm: Move a dereference below a NULL
Message-Id: <20090720145924.GA21724@khazad-dum.debian.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191725290.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191725290.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

AFAIK, all of those "move derreference below NULL test" count as potential
security fixes.  If the patches get accepted, please consider sending them
to -stable as well, or asking the maintaiers to do so...

Also, can we teach that deference-before-NULL-test pattern to sparse, or
some other tool that will periodically warn us when such problematic
patterns show up again in the tree?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
