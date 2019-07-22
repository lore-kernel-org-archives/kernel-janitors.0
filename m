From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 22 Jul 2019 18:56:09 +0000
Subject: Re: Script to spot some typo based on the file name
Message-Id: <alpine.DEB.2.21.1907221348390.5391@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <460fd687-474f-8a3e-82f6-269eb5507f96@wanadoo.fr>
In-Reply-To: <460fd687-474f-8a3e-82f6-269eb5507f96@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Mon, 22 Jul 2019, Marion & Christophe JAILLET wrote:

> Hi,
>
> Attached is a WIP script I've just written which tries to spot typos in a
> file, based on the filename itself.
>
> Yesterday, I've posted some finding done with this script.
> Today, I share if someone finds it useful, want to improve it or just want to
> take the idea.
>
> As, I'm not a bash guru, it is neither optimal, nor well written.
> But it seems to work as I expect.
>
>
> The name of a file can be a good source of information to spot typo in the
> code itself. This can help spot typo in comments or strings, but also wrongly
> named functions or constant.
> 3 checks are implemented. They can be disabled individually.
>
> The filename should sometime be tweaked a bit to only take the part before or
> after a '-' or a '_'. (some regex patterns are in the script for that, just
> comment/un-comment)
>
> The 2 last checks generate lot of false positives.
> It can find some few things, but honestly, the semantic should be improved.
>
>
> Just in case s.o. find it useful and want to use it to clean-up a few things.

It seems like a nice idea.  Based on another patch you sent, perhaps
something could be done with non-English words in general.  If there are a
few occurrences of XYZ in a file, but only one occurrence of XXZ, it might
be worth highlighting XXZ as a possible typo.  (I don't know what string
length and string distance would give the best results).

julia
