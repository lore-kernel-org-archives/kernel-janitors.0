From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 01 May 2020 16:52:52 +0000
Subject: Re: [PATCH v3] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <b2f44460-dc42-1606-519f-2886c805715e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501154033.GA25730@udknight>
 <3aeb6ab5059ec753d922051d7732e13322188e7c.camel@perches.com>
 <20200501163440.GA19874@udknight>
In-Reply-To: <20200501163440.GA19874@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> I am not sure whether I get your words, you mean we need to emit warning
> for incomplete title line format? For example:
> Fixes: 277f27e2f277 ("SUNRPC/cache: Allow garbage collection ... ")

I suggest to increase the precision for the usage the ellipsis at the end.

* Triple ASCII dots

* U+2026

* The commit title should probably not be abbreviated too much.

Regards,
Markus
