From: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 27 Jun 2020 07:31:27 +0000
Subject: Re: [PATCH V3] firmware: stratix10-svc: Fix some error handling code
Message-Id: <eb3ed7ba-902e-8ecf-1246-82ce88efd436@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ecc14c7-b4df-1890-fbe7-91307c2db398@wanadoo.fr>
 <20200626193720.949431-1-christophe.jaillet@wanadoo.fr>
 <20200627051556.GD233327@kroah.com>
In-Reply-To: <20200627051556.GD233327@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.gong@linux.intel.com, atull@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Le 27/06/2020 à 07:15, Greg KH a écrit :
> On Fri, Jun 26, 2020 at 09:37:20PM +0200, Christophe JAILLET wrote:
>> ---
>> v2: takes Dan's comment into account and fix another resource leak.
>> v3: merge the previous 4 patches in a single one to ease review
>
> No, 4 small patches are _MUCH_ easier to review than one larger one that
> mixes everything together.  Who told you to put them together?

The cover letter of v2 serie can be found at [1].
The request for merging them in 1 patch is in [2].

V3, should be the same as v2, but all in one.

[1]: https://lkml.org/lkml/2020/4/29/77
[2]: https://lkml.org/lkml/2020/5/5/541

CJ
