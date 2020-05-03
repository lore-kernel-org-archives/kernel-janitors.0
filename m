From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 13:03:45 +0000
Subject: Re: [PATCH] checkpatch: add support for title acrosses three lines in commit id description
Message-Id: <df619612-3825-4637-e025-618a7a982310@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200503123435.GD10332@udknight>
In-Reply-To: <20200503123435.GD10332@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> The current GIT_COMMIT_ID will report error when the title in commit id
> description acrosses three lines, …

I suggest to improve the commit message (and subsequent Perl code)
also according to the usage of the text “acrosses”.


> This patch adds support for three lines title in the commit id description,
> and emit diagnostics info when the title acrosses more than three lines.

Please split this paragraph into two imperative wordings.

Regards,
Markus
