From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 12:54:31 +0000
Subject: Re: [PATCH v2] checkpatch: fix can't check for too long invalid commit id
Message-Id: <e108fe75-440e-8349-eda1-c28814997a5c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503115406.GB10332@udknight>
In-Reply-To: <20200503115406.GB10332@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> it willn't warn anything about it due to 41+ length commit will never

I suggest to reconsider also this wording.

Alternatives:
* will not
* won't


> This patch moves the unknown commit id check for normal commit description
> to GIT_COMMIT_ID, and uses ERROR instead of WARN, because unknown commit
> id is total useless to track change history in changelog, it deserves the
> ERROR.

Can such a software adjustment trigger any more improvements?

Regards,
Markus
