From: Paul Burton <paulburton@kernel.org>
Date: Sat, 15 Feb 2020 22:56:00 +0000
Subject: Re: [PATCH] MIPS: VPE: Fix a double free and a memory leak in  'release_vpe()'
Message-Id: <5e487701.1c69fb81.107e8.b7f9@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200202201922.22852-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200202201922.22852-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ralf@linux-mips.org, paulburton@kernel.org

Hello,

Christophe JAILLET wrote:
> Pointer on the memory allocated by 'alloc_progmem()' is stored in
> 'v->load_addr'. So this is this memory that should be freed by
> 'release_progmem()'.
> 
> 'release_progmem()' is only a call to 'kfree()'.
> 
> With the current code, there is both a double free and a memory leak.
> Fix it by passing the correct pointer to 'release_progmem()'.

Applied to mips-fixes.

> commit bef8e2dfceed
> https://git.kernel.org/mips/c/bef8e2dfceed
> 
> Fixes: e01402b115ccc ("More AP / SP bits for the 34K, the Malta bits and things. Still wants")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
