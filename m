From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 21 Sep 2009 20:55:52 +0000
Subject: Re: [PATCH] arch/mips: remove duplicate structure field
Message-Id: <20090921205551.GA20341@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909211708200.8549@pc-004.diku.dk> <20090921192520.GB17310@linux-mips.org> <4AB7E0D1.10506@paralogos.com> <4AB7E50D.4090509@paralogos.com>
In-Reply-To: <4AB7E50D.4090509@paralogos.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Kevin D. Kissell" <kevink@paralogos.com>
Cc: Julia Lawall <julia@diku.dk>, dmitri.vorobiev@gmail.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 21, 2009 at 01:41:49PM -0700, Kevin D. Kissell wrote:

> Ha!  Found the breakage.  It wasn't a two-phase commit.  It was just an  
> overworked mantainer in a hurry, in July 2007.  See commit  
> 033890b084adfa367c544864451d7730552ce8bf

An overworked maintainer in cooperation with a broken compiler.  Worse -
it's not the first time this type of bug strikes but probably this was
never brought to the gcc maintainers' attention.

  Ralf
