From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 28 Apr 2020 10:52:59 +0000
Subject: Re: [PATCH v3] checkpatch: add dedicated checker for 'Fixes:' tag
Message-Id: <38e1a926-53a6-bda6-cb07-2614f4c682ba@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428020223.GA28074@udknight>
In-Reply-To: <20200428020223.GA28074@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> And there is no 'Fixes:' tag format checker in checkpatch

I have taken another look at corresponding implementation details.
Will programming challenges get any more attention?


> to check the commit id length too,

The mentioned script contains the following information.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/checkpatch.pl?id=b240f960afb900e59112ebcfa5a759bb0a85a14e#n2818

# Check for git id commit length and improperly formed commit descriptions


> so let's add dedicated checker to check these conditions for 'Fixes:' tag.

How do you think about to reconsider the usage of the word “checker”
at specific places?


> +		    my $id = '0123456789ab';
> +		    my $orig_desc = "commit description";

* Do you try to extend the existing software analysis approach “GIT_COMMIT_ID”?

* Would you like to avoid the development of duplicate Perl code?

Regards,
Markus
